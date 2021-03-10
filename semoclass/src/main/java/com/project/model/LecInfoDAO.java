package com.project.model;

import java.util.List;

public interface LecInfoDAO {
	
	
	// 임하늘님
	List<LectureDTO> getInfoList();				// 전체리스트
	List<CategoryDTO> getInfoCate();			// 카테고리+강의정보 리스트
	List<CategoryDTO> subCateList(int code);		// 서브 카테고리 리스트
	List<CategoryDTO> getInfoMember(String member);
	
	int updateInfo(LectureDTO dto);  			// 강의정보 수정
	void deleteInfo(int no);				// 강의정보 삭제
	

	//==================================210129 임하늘님 추가===================================================	
	CategoryDTO modifyCont(int no);				// 강의 수정용 카테고리+강의정보 리스트
	
	
	
	// 이호철
	// ==================================강의 ===================================================	
		// List
		List<LectureDTO> getLectList();			// 강의 모든 리스트 뽑기
		List<LectureDTO> getLargeCateLec(int cate_code);
		List<LectureDTO> getMidCateLec(int cate_code);
		List<LectureDTO> search_list(String search_field, String search_keyword);
		List<Integer> distinctCateList(int cate_code);
		
		//sort
		List<LectureDTO> sortList(int cate_code, String sort);
		
		// search
		List<String> autoSearch(String search_field);
		//인기검색어
//		List<SearchDTO> getHotSearchList();
//		int insert_search_hit(String search_field, String search_keyword);
//		void search_hit(String search_field, String search_keyword);
	
		
		// C
		int insertInfo(LectureDTO dto);				// 강의정보 추가
		
		// R
		LectureDTO contInfo(int no);				// 강의정보 상세 내역
		void count(int no);							// 조회수
		
		
		// 210129 이호철 추가
		void infoHit(int lec_no);
		
		// 210208 추가
		List<LectureDTO> getEarlyBirdList(int cate_code);
		List<LectureDTO> getOpenPlanList(int cate_code);
		List<LectureDTO> getImmeRegiList(int cate_code);
		
	//==================================카테고리===================================================	

		// List
		List<CategoryDTO> getCateList();		// 카테고리 모든리스트 뽑기 (아직 사용 x)
		List<CategoryDTO> getLargeCate();		// 카테고리 대분류 리스트만 뽑기 
		List<CategoryDTO> getMidCate();			// 카테고리 중분류 리스트만 뽑기
		
		// C
		
		// R
		CategoryDTO getDetailCate(int cate_code);
		
		// U
		
		// D
		
//==================================210128 혁님 추가===================================================	
		LectureDTO getLatestInfo();
		
//==================================210216 이호철 추가===================================================	
		List<LectureDTO> getListWhereMember(int mem_no_fk);
		
		
		

}
