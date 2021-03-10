package com.project.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ComunityDAOImpl implements ComunityDAO {
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	String sql = null;
	HashMap<String, Integer> no_fk;
	@Override
	public List<ComunityVO> getComuList(int lec_no) {
		
		return this.sqlSession.selectList("comuList",lec_no);
	}
	@Override
	public int getComuCount(int lec_no) {
		return this.sqlSession.selectOne("comuCount",lec_no);
	}

	@Override
	public List<ReplyDTO> getReplyList(int lec_no) {
		return this.sqlSession.selectList("replyList",lec_no);
	}
	
	@Override
	public int comuWrite(ComunityDTO dto) {
		return this.sqlSession.insert("comuWrite",dto);
	}
	
	@Override
	public int replyWrite(ReplyDTO dto) {
		return this.sqlSession.insert("replyWrite",dto);
	}
	
	@Override
	public int replyDelete(int rep_no) {
		return this.sqlSession.insert("replyDelete",rep_no);
	}
	
	@Override
	public int replyEdit(ReplyDTO dto) {
		return this.sqlSession.insert("replyEdit",dto);
	}
	
	@Override
	public List<ReplyDTO> getReReplyList(int lec_no, int rep_no) {
		no_fk = new HashMap<String, Integer>();
		no_fk.put("lec_no", lec_no);
		no_fk.put("rep_no", rep_no);
		
		return this.sqlSession.selectList("reReplyList",no_fk);
	}
	
	@Override
	public int reRepWrite(ReplyDTO dto) {
		
		return this.sqlSession.insert("reReplyWrite",dto);
	}

}
