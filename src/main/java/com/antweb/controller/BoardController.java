package com.antweb.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.antweb.domain.BoardVO;
import com.antweb.service.BoardService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService service;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("home입니다.");

		List<BoardVO> list = service.selectAll();
		model.addAttribute("list", list);

		return "home";
	}

	@RequestMapping(value = "/read/{bno}")
	public String read(@PathVariable("bno") int bno, Model model) {
		logger.info("read");

		BoardVO vo = service.selectOne(bno);
		model.addAttribute("item", vo);

		return "readForm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGet() {
		logger.info("registerGet");

		return "registerForm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(BoardVO vo) {
		logger.info("registerPost");
		service.insert(vo);

		return "redirect:/";
	}

	/*
	 * @ResponseBody
	 * 
	 * @RequestMapping("imgUpload") public Map<String,Object>
	 * imgaeUpload(HttpServletRequest req, @RequestParam MultipartFile upload,
	 * Model model) throws Exception{ logger.info("image upload!!!!!");
	 * 
	 * //http body OutputStream out=null; //PrintWriter printWriter=null;//웹페이지에
	 * html 넣음
	 * 
	 * 
	 * Map<String, Object> map=new HashMap<String, Object>();
	 * 
	 * //업로드한 파일 이름 String fileName=upload.getOriginalFilename(); //바이트 배열로 변환
	 * byte[] bytes=upload.getBytes(); //이미지를 업로드할 디렉토리(배포경로로 설정) String
	 * innerUploadPath="resources/upload/"; String uploadPath=
	 * (req.getSession().getServletContext().getRealPath("/"))+ innerUploadPath;
	 * logger.info(uploadPath);
	 * 
	 * out=new FileOutputStream(new File(uploadPath+fileName));//서버에 파일 저장 //서버에
	 * 저장됨 out.write(bytes);
	 * 
	 * //클라이언트에 업로드 결과를 표시 String callback =
	 * req.getParameter("CKEditorFuncNum");
	 * 
	 * String fileUrl=innerUploadPath+fileName;
	 * 
	 * System.out.println(fileUrl);
	 * 
	 * map.put("uploaded", 1); map.put("fileName", fileName); map.put("url",
	 * fileUrl);
	 * 
	 * return map; }
	 */

	@ResponseBody
	@RequestMapping("imgUpload")
	public Map<String, Object> imgaeUpload(HttpServletRequest req, @RequestParam MultipartFile upload, Model model)
			throws Exception {
		logger.info("image upload!!!!!");

		// http body
		OutputStream out = null;

		Map<String, Object> map = new HashMap<String, Object>();

		// 업로드한 파일 이름
		String fileName = upload.getOriginalFilename();

		// ==================================================================================================================================
		String serverIp = "112.175.85.200";
		int serverPort = 21;
		String user = "test7425";
		String password = "qowowls12!";

		FileInputStream fis = null;
		FTPClient ftpClient = new FTPClient();

		File fileObj = multipartToFile(upload);

		try {
			ftpClient.connect(serverIp, serverPort);// ftp연결
			ftpClient.setControlEncoding("utf-8");// ftp인코딩설정
			int reply = ftpClient.getReplyCode();// 응답코드받기
			if (!FTPReply.isPositiveCompletion(reply)) {
				ftpClient.disconnect();
				throw new Exception(serverIp + "FTP 서버 연결 실패");
			}

			ftpClient.setSoTimeout(1000 * 20);
			ftpClient.login(user, password);
			ftpClient.changeWorkingDirectory("www");
			ftpClient.setFileType(FTP.BINARY_FILE_TYPE);
			ftpClient.enterLocalActiveMode();

			fis = new FileInputStream(fileObj);
			ftpClient.storeFile(upload.getOriginalFilename(), fis);
		} finally {
			if (ftpClient.isConnected()) {
				ftpClient.disconnect();
			}
			if (fis != null) {
				fis.close();
			}
		}

		map.put("uploaded", 1);
		map.put("fileName", fileName);
		map.put("url", "http://test7425.cdn3.cafe24.com/"+fileName);

		return map;
	}
	
	public File multipartToFile(MultipartFile multipart) throws IllegalStateException, IOException {
		File convFile = new File(multipart.getOriginalFilename());
		multipart.transferTo(convFile);
		return convFile;
	}

	@RequestMapping("/delete/{bno}")
	public String delete(@PathVariable("bno") int bno) {
		logger.info("delete");
		service.delete(bno);

		return "redirect:/";
	}
	
	@RequestMapping(value="/update/{bno}", method=RequestMethod.GET)
	public String updateGet(@PathVariable("bno") int bno, Model model){
		BoardVO vo=service.selectOne(bno);
		model.addAttribute("obj",vo);
		
		return "updateForm";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updatePost(BoardVO vo){
		service.update(vo);
		
		return "redirect:/";
	}

	

}
