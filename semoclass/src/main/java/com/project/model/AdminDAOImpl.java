package com.project.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	private HashMap<String, Integer> no;
	
	@Override
	public List<NoticeVO> getNoticeList(int s_no, int e_no) {
		no = new HashMap<String, Integer>();
		no.put("startNo", s_no);
		no.put("endNo", e_no);
		
		return this.sqlSession.selectList("noticeList", no);
	}
	
	@Override
	public NoticeVO getNoticeCont(int no) {
		
		return this.sqlSession.selectOne("noticeCont",no);
	}
	@Override
	public int addHit(int no) {
		return this.sqlSession.update("addHit",no);
	}
	
	@Override
	public int getNoticeCount() {
		
		return this.sqlSession.selectOne("noticeCount");
	}
	
	@Override
	public int insertNotice(NoticeDTO dto) {
		
		return this.sqlSession.insert("noticeWrite", dto);
	}

	@Override
	public int updateNotice(NoticeDTO dto) {
		
		return this.sqlSession.update("noticeUpdate",dto);
	}

	@Override
	public int deleteNotice(int no) {
		
		return this.sqlSession.delete("noticeDelete",no);
	}

}
