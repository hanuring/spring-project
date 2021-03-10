package com.project.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class HotDAOImpl implements HotDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 10개만 
	@Override
	public List<HotDTO> getHotList() {
		return this.sqlSession.selectList("hotList");
	}

	@Override
	public List<HotDTO> getAllList() {
		return this.sqlSession.selectList("recentList");
	}

	@Override
	public HotDTO getOneList(int lec_no) {
		return this.sqlSession.selectOne("oneList", lec_no);
	}


	// 210203 이호철 추가 (리스트 전부)
	@Override
	public List<HotDTO> getAllLikeList(){
		return this.sqlSession.selectList("AllLikeList");
	}
	
	
	//0209 추가
	@Override
	public List<HotDTO> getOpenList() {
		return this.sqlSession.selectList("openList");
	}

	@Override
	public List<HotDTO> getNewList() {
		return this.sqlSession.selectList("newList");
	}
	
}
