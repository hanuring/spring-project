package com.project.model;

import java.util.List;

public interface PreferenceDAO {
	public int doLikeLec(int lec_no,int mem_no);
	public List<HotDTO> getLecLikeList(int mem_no);
	
	public int doDislikeLec(int lec_no,int mem_no);
	public int addWishList(int lec_no,int mem_no);
	
	// 210126 이호철 추가
	public int getLikeNum(int lec_no);
	// 200129 박지원 추가
	public int getDislikeNum(int lec_no);
	
	// 210127 박지원님 추가
	public int prefCount(int lec_no,int mem_no);
	public PreferenceDTO prefCont(int lec_no,int mem_no);
}