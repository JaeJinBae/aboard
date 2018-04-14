package com.antweb.service;

import java.util.List;

import com.antweb.domain.BoardVO;

public interface BoardService {
	public List<BoardVO> selectAll();
	public BoardVO selectOne(int bno);
	public void insert(BoardVO vo);
	public void update(BoardVO vo);
	public void delete(int bno);
}
