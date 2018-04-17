package com.antweb.persistence;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.antweb.domain.BoardVO;
import com.antweb.domain.SearchCriteria;

@Repository
public class BoardDaoImpl implements BoardDao {

	private static final String namespace="com.antweb.mappers.BoardMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public List<BoardVO> selectAll() {
		return session.selectList(namespace+".selectAll");
	}
	
	@Override
	public BoardVO selectOne(int bno) {
		return session.selectOne(namespace+".selectOne",bno);
	}

	@Override
	public void insert(BoardVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(BoardVO vo) {
		session.update(namespace+".update",vo);
	}

	@Override
	public void updateCnt(int bno) {
		session.update(namespace+".updateCnt",bno);
		
	}
	
	@Override
	public void delete(int bno) {
		session.delete(namespace+".delete",bno);
	}

	@Override
	public List<BoardVO> listSearch(SearchCriteria cri) throws Exception {
		return session.selectList(namespace+".listSearch",cri);
	}
	
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		return session.selectOne(namespace+".listSearchCount",cri);
	}

	@Override
	public void updateReplyCnt(int bno, int amount) throws Exception {
		HashMap<String, Object> map=new HashMap<>();
		map.put("bno", bno);
		map.put("amount", amount);
		
		session.update(namespace+".updateReplyCnt",map);
	}

	


	
		

}
