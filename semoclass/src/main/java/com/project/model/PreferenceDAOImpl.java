package com.project.model;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class PreferenceDAOImpl implements PreferenceDAO {
	@Autowired
	private SqlSessionTemplate template;
	HashMap<String, Integer> no_fk;
	
	@Override
	public int doLikeLec(int lec_no,int mem_no) {
		no_fk = new HashMap<String, Integer>();
		no_fk.put("lec_no", lec_no);
		no_fk.put("mem_no", mem_no);
		//유저가 강의에 좋아요/싫어요를 누른 적이 있는지 조회
		int count = this.template.selectOne("prefCheck", no_fk);
		PreferenceDTO dto = this.template.selectOne("prefDTO", no_fk);
		if(count>0) {
			if(dto.getPref_like() == 1) {
				this.template.delete("deleteLike",dto.getPref_no());
				return 0;
			}else {
				this.template.update("updateLecLike", no_fk);
				return 1;
			}
		}else {
			this.template.insert("insertLecLike", no_fk);
			return 1;
		}
	}
	@Override
	public List<HotDTO> getLecLikeList(int mem_no) {
		return this.template.selectList("selectLecLikeList",mem_no);
	}

	@Override
	public int doDislikeLec(int lec_no,int mem_no) {
		no_fk = new HashMap<String, Integer>();
		no_fk.put("lec_no", lec_no);
		no_fk.put("mem_no", mem_no);
		//유저가 강의에 좋아요/싫어요를 누른 적이 있는지 조회
		int count = this.template.selectOne("prefCheck", no_fk);
		PreferenceDTO dto = this.template.selectOne("prefDTO", no_fk);
		if(count>0) {
			if(dto.getPref_dislike() == 1) {
				this.template.delete("deleteDislike",dto.getPref_no());
				return 0;
			}else {
				this.template.update("updateLecDislike", no_fk);
				return 1;
			}
		}else {
			this.template.insert("insertLecDislike", no_fk);
			return 1;
		}
	}
	
	@Override
	public int addWishList(int lec_no, int mem_no) {
		no_fk = new HashMap<String, Integer>();
		no_fk.put("lec_no", lec_no);
		no_fk.put("mem_no", mem_no);
		//유저가 강의에 좋아요/싫어요를 누른 적이 있는지 조회
		int count = this.template.selectOne("wishCheck", no_fk);
		
		if(count>0) {
			this.template.delete("deleteWishList", no_fk);
			return 0;
		}else {
			this.template.insert("insertWishList", no_fk);
			return 1;
		}
	}
	
	// 210126이호철 추가
	@Override
	public int getLikeNum(int lec_no) {
		return this.template.selectOne("like_number", lec_no);
	}

	// 210129 박지원 추가
	@Override
	public int getDislikeNum(int lec_no) {
		return this.template.selectOne("dislike_number", lec_no);
	}
	// 210127 박지원님 추가
	@Override
	public int prefCount(int lec_no, int mem_no) {
		no_fk = new HashMap<String, Integer>();
		no_fk.put("lec_no", lec_no);
		no_fk.put("mem_no", mem_no);
		return this.template.selectOne("prefCheck", no_fk);
	}
	@Override
	public PreferenceDTO prefCont(int lec_no, int mem_no) {
		no_fk = new HashMap<String, Integer>();
		no_fk.put("lec_no", lec_no);
		no_fk.put("mem_no", mem_no);
		return this.template.selectOne("prefDTO", no_fk);
	}

	
	
}