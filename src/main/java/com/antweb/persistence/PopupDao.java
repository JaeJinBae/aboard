package com.antweb.persistence;

import java.util.List;

import com.antweb.domain.PopupVO;

public interface PopupDao {
	public List<PopupVO> selectAll();
	public PopupVO selectOne(int pno);
	public void insert(PopupVO vo);
	public void update(PopupVO vo);
	public void delete(int pno);
}
