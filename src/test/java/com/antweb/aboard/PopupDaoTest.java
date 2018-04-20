package com.antweb.aboard;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.antweb.domain.PopupVO;
import com.antweb.persistence.PopupDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class PopupDaoTest {

	@Autowired
	private PopupDao dao;
	
	//@Test
	public void insert(){
		PopupVO vo=new PopupVO();
		vo.setTitle("Title test100");
		vo.setContent("testtesttest");
		vo.setWidth("45px");
		vo.setHeight("45px");
		
		dao.insert(vo);
	}
	
	//@Test
	public void selectAll(){
		List<PopupVO> list=dao.selectAll();
		for(PopupVO vo:list){
			System.out.println(vo);
		}
	}
	
	//@Test
	public void selectOne(){
		System.out.println(dao.selectOne(1));
	}
	
	//@Test
	public void delete(){
		dao.delete(1);
	}
	
}
