package com.project.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class RegistDAOImpl implements RegistDAO {
	
	HashMap<String, Integer> no_fk;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int registClass(RegistDTO dto) {
		return this.sqlSession.insert("regist", dto);
	}

	@Override
	public Integer checkRegist(RegistDTO dto) {
		return this.sqlSession.selectOne("check", dto);
	}

	@Override
	public List<Integer> checkWish(int mem_no_fk) {
		return this.sqlSession.selectList("checkWish", mem_no_fk);
	}
	
	@Override
	public List<Integer> checkReg(int mem_no_fk) {
		return this.sqlSession.selectList("checkReg", mem_no_fk);
	}

	// 0214 이호철 추가
	@Override
	public RegistDTO checkReg2(int mem_no_fk, int lec_no_fk) {
		
		no_fk = new HashMap<String,Integer>();
		no_fk.put("mem_no_fk", mem_no_fk);
		no_fk.put("lec_no_fk", lec_no_fk);
		
		return this.sqlSession.selectOne("checkReg2", no_fk);
	}
	
	// 210217수정
	@Override
	public int deleteRegist(int mem_no_fk) {
	    
		return this.sqlSession.selectOne("delete_class", mem_no_fk);
	}

	
	
	
}
