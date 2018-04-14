package com.antweb.aboard;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.antweb.domain.BoardVO;
import com.antweb.persistence.BoardDao;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class BoardDaoTest {

	@Autowired
	private BoardDao dao;
	
	@Test
	public void selectAll(){
		dao.selectAll();
	}
	
	//@Test
	public void selectOne(){
		dao.selectOne(1);
	}
	//@Test
	public void insert(){
		BoardVO vo=new BoardVO();
		vo.setBtitle("안녕하세요");
		vo.setBcontent("가나다라마바사");
		dao.insert(vo);
	}
	//@Test
	public void update(){
		BoardVO vo= new BoardVO();
		vo.setBno(3);
		vo.setBtitle("바이");
		vo.setBcontent("바이바이바이");
		dao.update(vo);
	}
	//@Test
	public void delete(){
		dao.delete(3);
	}
}
