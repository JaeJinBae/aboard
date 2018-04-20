package com.antweb.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.antweb.domain.PopupVO;
import com.antweb.service.PopupService;

@Controller
public class PopupController {
	private static final Logger logger = LoggerFactory.getLogger(PopupController.class);

	@Autowired
	private PopupService service;
	
	@RequestMapping("popupView")
	public void popupGet(Model model){
		logger.info("popup Get");
		List<PopupVO> list= service.selectAll();
		
		model.addAttribute("list",list);
	}
	
	@RequestMapping(value="/popupAdd", method=RequestMethod.GET)
	public void popupAddGet(){
		logger.info("popupADD GET");
			
	}
	
	@RequestMapping(value="/popupAdd",method=RequestMethod.POST)
	public String popupAddPost(PopupVO vo, String startDay, String endDay) throws ParseException{
		logger.info("popupADD POST");
		
		/*Date startDate=new Date(startDay);
		Date endDate=new Date(endDay);*/
		
		SimpleDateFormat dt=new SimpleDateFormat("yyyy-MM-dd");
		Date startDate=dt.parse(startDay);
		Date endDate=dt.parse(endDay);
		
		vo.setStartdate(startDate);
		vo.setEnddate(endDate);
		
		//System.out.println("시작일: "+startDate+", 종료일: "+endDate);
		
		
		service.insert(vo);
		
		return "redirect:/popupView";
	}

	
}
