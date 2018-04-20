package com.antweb.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.antweb.domain.PopupVO;
import com.antweb.persistence.PopupDao;

@Service
public class PopupServiceImpl implements PopupService {

	@Autowired
	private PopupDao dao;
	
	@Override
	public List<PopupVO> selectAll() {
		return dao.selectAll();
	}

	@Override
	public PopupVO selectOne(int pno) {
		return dao.selectOne(pno);
	}

	@Override
	public void insert(PopupVO vo) {
		dao.insert(vo);
	}

	@Override
	public void update(PopupVO vo) {
		dao.update(vo);
	}

	@Override
	public void delete(int pno) {
		dao.delete(pno);
	}

}
