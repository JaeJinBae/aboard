package com.antweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.antweb.domain.BoardVO;
import com.antweb.persistence.BoardDao;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	private BoardDao dao;

	@Override
	public List<BoardVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public BoardVO selectOne(int bno) {
		dao.updateCnt(bno);
		return dao.selectOne(bno);
	}

	@Override
	public void insert(BoardVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(BoardVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int bno) {
		dao.delete(bno);
	}
	
	
}
