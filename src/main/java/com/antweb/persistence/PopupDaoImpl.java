package com.antweb.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.antweb.domain.PopupVO;

@Repository
public class PopupDaoImpl implements PopupDao {

	private static final String namespace="com.antweb.mappers.PopupMapper";
	
	@Autowired
	private SqlSession session;

	@Override
	public List<PopupVO> selectAll() {
		return session.selectList(namespace+".selectAll");
	}

	@Override
	public PopupVO selectOne(int pno) {
		return session.selectOne(namespace+".selectOne",pno);
	}

	@Override
	public void insert(PopupVO vo) {
		session.insert(namespace+".insert",vo);
	}

	@Override
	public void update(PopupVO vo) {
		session.update(namespace+".update",vo);
	}

	@Override
	public void delete(int pno) {
		session.delete(namespace+".delete",pno);
	}
	
	
}
