package com.project.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LecInfoDAOImpl implements LecInfoDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 임하늘님 
	@Override
	public List<LectureDTO> getInfoList() {
		
		return this.sqlSession.selectList("allList");
	}


	@Override
	public int updateInfo(LectureDTO dto) {

		return this.sqlSession.update("update", dto);
	}

	@Override
	public void deleteInfo(int no) {
		
		this.sqlSession.delete("del", no);
	}


//	@Override													//==> getLargeCate로 변경
//	public List<CategoryDTO> getCateList() {
//
//		return this.sqlSession.selectList("cateList");
//	}

	@Override
	public List<CategoryDTO> subCateList(int code) {
		
		return this.sqlSession.selectList("subCateList", code);
	}

	// 카테고리 + 클래스 정보 조인
	@Override
	public List<CategoryDTO> getInfoCate() {

		return this.sqlSession.selectList("infoCate");
	}

	@Override
	public CategoryDTO modifyCont(int no) {
		
		return this.sqlSession.selectOne("modifyCont", no);
	}
	
	// lec_member 별 클래스 정보
		@Override
		public List<CategoryDTO> getInfoMember(String member) {

			return this.sqlSession.selectList("memberInfo", member);
		}
	
	
// 이호철
// ==================================강의 ===================================================	
		
		// List(기본정렬)
		@Override
		public List<LectureDTO> getLectList() {
			return null;
		}
		@Override
		public List<LectureDTO> getLargeCateLec(int cate_code) {
			return this.sqlSession.selectList("L_Cate_Lec", cate_code);
		}
		@Override
		public List<LectureDTO> getMidCateLec(int cate_code) {
			return this.sqlSession.selectList("M_Cate_Lec", cate_code);
		}

		@Override
		public List<LectureDTO> search_list(String search_field, String search_keyword) {
				return this.sqlSession.selectList(search_field, search_keyword);
		}
		
		// 인기검색어 관련
//		@Override
//		public List<SearchDTO> getHotSearchList() {
//			return this.sqlSession.selectList("Hot_Search_List");
//		}
//		@Override
//		public int insert_search_hit(String hot_search_field, String hot_search_keyword) {
//			return this.sqlSession.insert(hot_search_field, hot_search_keyword);
//		}
//		@Override
//		public void search_hit(String hot_search_field, String hot_search_keyword) {
//			this.sqlSession.update(hot_search_field, hot_search_keyword);
//		}
		
		
		@Override
		public List<Integer> distinctCateList(int cate_code) {
			return this.sqlSession.selectList("Distinct_cate", cate_code);
		}
		
		// List(정렬)
		@Override
		public List<LectureDTO> sortList(int cate_code, String sort) {
			if(sort.equals("hit")) {
				return this.sqlSession.selectList("Hit_sort", cate_code);
			} else if(sort.equals("recent")) {
				return this.sqlSession.selectList("Recent_sort", cate_code);
			}else if(sort.equals("satisfy")) {
				return this.sqlSession.selectList("Satisfy_sort", cate_code);
			} else {
				return null;
			}
		}
		
		// search(autocomplete)
		@Override
		public List<String> autoSearch(String search_field) {
			
			if(search_field.equals("lec_name")) {
				return this.sqlSession.selectList("lec_name_search");
			} else if(search_field.equals("lec_teacher")) {
				return this.sqlSession.selectList("lec_teacher_search");
			} else {	// category
				return this.sqlSession.selectList("category_search");
			}
		}
		
		
		// C
		@Override
		public int insertInfo(LectureDTO dto) {
			
			return this.sqlSession.insert("add", dto);
		}
		
		// R
		@Override
		public LectureDTO contInfo(int lec_no) {
			return this.sqlSession.selectOne("contList", lec_no);
		}
		
		@Override
		public void count(int no) {
			
		}
		
		
		// U
		
		// D
		
		// 210129 이호철 추가
		@Override
		public void infoHit(int lec_no) {
			
			this.sqlSession.update("InfoHit", lec_no);
		}
		
		
		
	//==================================카테고리===================================================	
		// List
		@Override
		public List<CategoryDTO> getCateList() {
			return this.sqlSession.selectList("C_total");
		}


		@Override
		public List<CategoryDTO> getLargeCate() {
			// Category 대분류만
			return this.sqlSession.selectList("C_Large");
		}

		@Override
		public List<CategoryDTO> getMidCate() {
			// Category 중분류만
			return this.sqlSession.selectList("C_Mid");
		}
		
		//C
		
		//R
		@Override
		public CategoryDTO getDetailCate(int cate_code) {
			// 하나의 카테고리 이름, 코드, 참조코드 가져오기
			return this.sqlSession.selectOne("Detail_cate", cate_code);
		}


		//U
		
		//D
		
		
//==================================210128 혁님 추가===================================================	
        @Override
        public LectureDTO getLatestInfo() {
            return this.sqlSession.selectOne("latestInfo");
        }


        // 210208 추가
		@Override
		public List<LectureDTO> getEarlyBirdList(int cate_code) {
			
			return this.sqlSession.selectList("ealryBird", cate_code);
		}


		@Override
		public List<LectureDTO> getOpenPlanList(int cate_code) {
			
			return this.sqlSession.selectList("openPlan", cate_code);
		}


		@Override
		public List<LectureDTO> getImmeRegiList(int cate_code) {
			
			return this.sqlSession.selectList("immeRegi", cate_code);
		}

		
		// 210216 이호철 추가
		public List<LectureDTO> getListWhereMember(int mem_no_fk){
			
			return this.sqlSession.selectList("getListWhereMemberno", mem_no_fk);
		}
		
}
