package com.antweb.controller;

import java.io.File;
import java.io.FileInputStream;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.antweb.domain.BoardVO;
import com.antweb.domain.Criteria;
import com.antweb.domain.PageMaker;
import com.antweb.domain.ReplyVO;
import com.antweb.domain.SearchCriteria;
import com.antweb.service.BoardService;
import com.antweb.service.ReplyService;

@Controller
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	private BoardService bservice;
	
	@Autowired
	private ReplyService rservice;

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String home(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {
		logger.info("home입니다.");
		
		List<BoardVO> list = bservice.listSearch(cri);
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.makeSearch(cri.getPage());
		pageMaker.setTotalCount(bservice.listSearchCount(cri));
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker",pageMaker);
		return "home";
	}

	@RequestMapping(value = "/read/{bno}/{page}")
	public String read(@PathVariable("bno") int bno, @PathVariable("page") int page, Model model) throws Exception {
		logger.info("read");

		BoardVO vo = bservice.selectOne(bno);
		bservice.updateCnt(bno);
		Criteria cri=new Criteria();
		cri.setPage(page);
		List<ReplyVO> list=rservice.listReplyPage(bno, cri);
		
		
		PageMaker pageMaker=new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(rservice.count(bno));
		
		model.addAttribute("item", vo);
		model.addAttribute("list",list);
		model.addAttribute("pageMaker",pageMaker);
		
		return "readForm";
	}
	
	@RequestMapping(value="/pwcheck/{bno}", method=RequestMethod.GET)
	public String pwcheckGet(@PathVariable("bno") int bno, Model model){
		logger.info("pwcheck Get");
		
		BoardVO vo=bservice.selectOne(bno);
		if(vo.getPwtype().equals("x")){
			logger.info(vo.getPwtype());
			/*model.addAttribute("bno",bno);
			model.addAttribute("page",1);*/
			return "redirect:/read/"+bno+"/"+1;
		}
		
		model.addAttribute("vo",vo);
		return "pwcheck";
	}

	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String registerGet() {
		logger.info("registerGet");

		return "registerForm";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPost(BoardVO vo) {
		logger.info("registerPost");
		bservice.insert(vo);

		return "redirect:/board";
	}

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
		String serverIp = "112.175.85.200";//호스트 주소(ex. http://아이디.iud.cdn3.cafe24.com)
		int serverPort = 21;//포트번호
		String user = "test7425";//ftp아이디
		String password = "qowowls12!";//ftp비밀번호

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
			ftpClient.changeWorkingDirectory("www");//디렉토리변경(저장할 폴더로 이동)
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
	public String delete(@PathVariable("bno") int bno) throws Exception {
		logger.info("delete");
		
		rservice.deleteByBno(bno);
		bservice.delete(bno);
		
		return "redirect:/";
	}
	
	@RequestMapping(value="/update/{bno}", method=RequestMethod.GET)
	public String updateGet(@PathVariable("bno") int bno, Model model){
		BoardVO vo=bservice.selectOne(bno);
		model.addAttribute("obj",vo);
		
		return "updateForm";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String updatePost(BoardVO vo){
		bservice.update(vo);
		
		return "redirect:/";
	}

	@RequestMapping("/login")
	public String loginGet(){
		logger.info("loginGet");
		
		return "login";
	}
	
	@RequestMapping(value="manager2", method=RequestMethod.GET)
	public String managerGet(){
		logger.info("managerGet");
		
		return "manager";
	}

}
