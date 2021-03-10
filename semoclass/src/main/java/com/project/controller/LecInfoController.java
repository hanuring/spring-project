package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.project.model.CategoryDTO;
import com.project.model.ComunityDAO;
import com.project.model.HotDAO;
import com.project.model.HotDTO;
import com.project.model.LecInfoDAO;
import com.project.model.LectureDTO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;
import com.project.model.OtDAO;
import com.project.model.OtDTO;
import com.project.model.PreferenceDAO;
import com.project.model.RegistDAO;

@Controller
public class LecInfoController {

	@Autowired
	private LecInfoDAO dao;
	
	@Autowired
	private upload upload;
	
	@Autowired
	private ComunityDAO cdao;
	
	@Autowired
	private MemberDAO mdao;
	
	@Autowired
	private PreferenceDAO pdao;
	
	@Autowired
    private OtDAO otdao;
	
	// 철민 0201
	@Autowired
	private HotDAO hotDao;
	
	@Autowired
	private RegistDAO regDao;
	
	@RequestMapping("info_list.do")
	public String list(Model model) {
		
		List<CategoryDTO> clist = this.dao.getInfoCate();
		
		model.addAttribute("cList", clist);
		
		return "lecture/info_list";
	}
	
	
	@RequestMapping("class_insert.do")
	public String insert(@RequestParam("mem") String mem, CategoryDTO dto, Model model, HttpSession session) {
		
		List<CategoryDTO> list = this.dao.getLargeCate();
		/* int member_no = (Integer)session.getAttribute("member_no"); */
		/* MemberDTO mdto = this.mdao.MypageInfo(member_no); */
		model.addAttribute("member_name", mem);
		model.addAttribute("cateList", list);
		
		return "mypage/class_insert";
	}
	
	@RequestMapping("class_insert_ok.do")
    public String insertOk(MultipartHttpServletRequest mRequest, LectureDTO dto, HttpServletResponse response, HttpSession session, Model model) throws IOException {

        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();

        if(upload.fileUpload(mRequest)) {
            Iterator<String> iterator = mRequest.getFileNames();

            MultipartFile mFile = mRequest.getFile(iterator.next());
            dto.setLec_thumbnail(mFile.getOriginalFilename());

            int result = this.dao.insertInfo(dto);

            LectureDTO ldto = this.dao.getLatestInfo();

            if(result > 0) {
                out.println("<script>");
                out.println("alert('성공')");
                out.println("</script>");

                model.addAttribute("lec_no", ldto.getLec_no());

                return "mypage/ot_video_insert";
                
            }else {
                out.println("<script>");
                out.println("alert('등록 실패')");
                out.println("history.back()");
                out.println("</script>");
            }
        }else {
            out.println("<script>");
            out.println("alert('이미지 등록 실패')");
            out.println("history.back()");
            out.println("</script>");
        }

        return "home";

    }
	
	
	
	// 이호철 
	// 대분류 카테고리를 선택했을때 대분류 검색리스트
	@RequestMapping("/l_category.do")
	public String goToLargeCateList(@RequestParam("cate_code") int cate_code, Model model, HttpSession session) {

		
		List<Integer> dlist = this.dao.distinctCateList(cate_code);
		model.addAttribute("Distinct_cate", dlist);
		
		List<LectureDTO> list = this.dao.getLargeCateLec(cate_code);
		model.addAttribute("L_cate", list);

		List<CategoryDTO> clist = this.dao.getCateList();
		model.addAttribute("C_list", clist);

		//210129 추가
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		// 210203 추가 
		List<HotDTO> allList = this.hotDao.getAllLikeList();
		model.addAttribute("All_list_for_like", allList);
		
		// 210208 추가
		model.addAttribute("Large_cate_code", cate_code);
		
		return "smc_large_category";
	}

	@RequestMapping("/s_category.do")
	public String goToMidCateList(@RequestParam("cate_code") int cate_code, Model model, HttpSession session) {

		model.addAttribute("sess_member_no", session.getAttribute("member_no"));

		List<LectureDTO> list = this.dao.getMidCateLec(cate_code);
		model.addAttribute("L_cate", list);

		List<CategoryDTO> clist = this.dao.getCateList();
		model.addAttribute("C_list", clist);

		//210129 추가
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		// 210203 이호철 추가 
		List<HotDTO> allList = this.hotDao.getAllLikeList();
		model.addAttribute("All_list_for_like", allList);
		
		return "smc_mid_category";
	}

	// 강의이름을 클릭했을 때 강의 자세한 사항을 가져오기
	@RequestMapping("info_cont.do")
	public String cont(@RequestParam("no") int lec_no, Model model, HttpSession session, HttpServletResponse response) throws IOException{
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		String result = null;
		int member_no = (Integer)session.getAttribute("member_no");
		
//		System.out.println("lec_no >>> " +lec_no );
//		System.out.println("member_no >>> " +member_no );
			
			if(member_no == 0 ) {
				out.println("<script>");
				out.println("alert('로그인 먼저 해주세요')");
				out.println("location.href='goto_login_member.do'");
				out.println("</script>");
			}else {
				//210126 이호철 추가
				dao.infoHit(lec_no);
				MemberDTO mdto = this.mdao.MypageInfo(member_no);
				model.addAttribute("mdto", mdto);
				
				//LectureDTO dto = this.dao.contInfo(lec_no);
				CategoryDTO dto = this.dao.modifyCont(lec_no);
				model.addAttribute("cont", dto);
				
				model.addAttribute("comuList", this.cdao.getComuList(lec_no));
				//0203박지원 추가
				model.addAttribute("comuCount", this.cdao.getComuCount(lec_no));
				
				// 철민 0201
				HotDTO hotList = this.hotDao.getOneList(lec_no);
				model.addAttribute("hotList", hotList);
				List<HotDTO> recentList = this.hotDao.getAllList();
				model.addAttribute("recentList", recentList);
				List<MemberDTO> mlist =  mdao.getAllMember();
				model.addAttribute("Member_list", mlist);
				
				int count = this.pdao.prefCount(lec_no, member_no);
				
				if(count > 0) {
					model.addAttribute("pref_info",this.pdao.prefCont(lec_no, member_no));
				}
				
				if(member_no == dto.getMem_no_fk()) {
					model.addAttribute("check_teacher", 1);
				} else {
					model.addAttribute("check_teacher", 2);
				}
//				try {
//					if(member_no == dto.getMem_no_fk()) {	// 본인 강의 일때
//						System.out.println("member_no & dto.getMem_no_fk() >>> " + member_no + " & " + dto.getMem_no_fk());
//						model.addAttribute("check_teacher", 1);
//					} else if(member_no != dto.getMem_no_fk()) {								// 본인 강의가 아닐떄
//						RegistDTO regDTO = regDao.checkReg2(member_no, lec_no);
//						System.out.println("regDTO >>> " + regDTO);	// null
//						System.out.println("regDTO.getMem_no_fk() >>> " + regDTO.getMem_no_fk());
//						if(regDTO != null)	{				// 등록신청한 강의가 아닐떄
//							model.addAttribute("check_teacher", 2);
//						} 
//					}
//				} catch (Exception e) {
//					model.addAttribute("check_teacher", 3);
//				}
				
				result = "lecture/info_cont";
			}
		return result;
	}
	

	// 검색 기능
	@RequestMapping("/smc_search.do")
	public String searchList(HttpServletRequest request, Model model, HttpSession session) {

		model.addAttribute("sess_member_no", session.getAttribute("member_no"));
		
		String search_field = request.getParameter("search_field");
		String search_keyword = request.getParameter("search_keyword");

		List<LectureDTO> list = this.dao.search_list(search_field, search_keyword);
		model.addAttribute("L_cate", list);

		List<CategoryDTO> clist = this.dao.getCateList();
		model.addAttribute("C_list", clist);
		
		//210129 추가
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		// 210203 이호철 추가 
		List<HotDTO> allList = this.hotDao.getAllLikeList();
		model.addAttribute("All_list_for_like", allList);
		
		// 인기검색어 넣기
//		List<SearchDTO> slist = dao.getHotSearchList();
//		System.out.println(slist);
//		if(slist.size() == 0) {
//			this.dao.insert_search_hit(search_field, search_keyword);
//			System.out.println("search_hit에 데이터 추가");
//		}
//		for(int i = 0 ; i < slist.size(); i++) {
//			if(search_field.equals(slist.get(i).getHot_search_field()) && search_keyword.equals(slist.get(i).getHot_search_keyword())) {
//				this.dao.search_hit(search_field, search_keyword);
//				System.out.println("테이블에 있던 검색 기록 >>> keyword : "+slist.get(i).getHot_search_keyword());
//			} else {
//				this.dao.insert_search_hit(search_field, search_keyword);
//				System.out.println("테이블에 없던 검색 기록");
//			}
//		}
		return "smc_search_list";
	}

	// ajax
	// ajax(smc_mid_category.jsp 에서 대분류=>중분류까지 했을 때 리스트 가져오기)
	@RequestMapping("get_mid_cateList.do")
	public String getMidCateList(@RequestParam("cate_code") int cate_code, Model model) {

		List<LectureDTO> list = this.dao.getMidCateLec(cate_code);
		model.addAttribute("Mid_Cate_list", list);

		CategoryDTO dto = dao.getDetailCate(cate_code);
		model.addAttribute("cate_name", dto.getCate_name());
		
		List<MemberDTO> mlist = mdao.getAllMember();
		List<HotDTO> hlist = hotDao.getAllLikeList();
		model.addAttribute("Member_list", mlist);
		model.addAttribute("All_list_for_like", hlist);
		
		return "ajax/cate_list";
	}

	// ajax(smc_mid_category.jsp 에서 정렬기준 선택했을 때 리스트 가져오기)
	@RequestMapping("sort_mid_cateList.do") 
	public String sortMidCateList(@RequestParam("cate_code") int cate_code, @RequestParam("sort") String sort, Model model) {
		
			List<LectureDTO> list = this.dao.sortList(cate_code, sort);
			model.addAttribute("Mid_Cate_list", list);
			
			CategoryDTO dto = dao.getDetailCate(cate_code);
			model.addAttribute("cate_name", dto.getCate_name());
			
			List<MemberDTO> mlist = mdao.getAllMember();
			List<HotDTO> hlist = hotDao.getAllLikeList();
			model.addAttribute("Member_list", mlist);
			model.addAttribute("All_list_for_like", hlist);
		
			return "ajax/cate_list";
	}
	
	// 210202 수정
	// 혁님 OT동영상 (210126) - 수정 (210202)(OT관련 데이터 없어도 처리되게)
    @RequestMapping("goto_video_ot")
    public void gotoVideoOt(@RequestParam("no") int no, Model model, HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();

        try {
             OtDTO dto = this.otdao.getOtCont(no);
             
             if(!dto.getOt_summary().equals(null)) {
            	 System.out.println("등록됐을때 no값 >>> " + no);
                 out.println("<script>");
                 out.println("location.href='goto_video_ot_ok.do?no="+no+"'");
                 out.println("</script>");
             } else{
            	 System.out.println("try문 dto가 null 일때 no >>> " + no);
                 out.println("<script>");
                 out.println("alert('OT가 등록되어있지 않습니다.')");
                 out.println("history.back()");
                 out.println("</script>");
             }
                /* model.addAttribute("dto", dto); /

             String ot_title = dto.getOt_summary();

                /
                 * String[] tokens = ot_title.split(",|/");
                 * 
                 * int tlength = tokens.length;
                 */



        } catch (Exception e) {
        	System.out.println("catch문 no >>> " + no);
            out.println("<script>");
            out.println("alert('OT가 등록되어있지 않습니다.')");
            out.println("history.back()");
            out.println("</script>");
        } 

    }
    
 // 210203 수정(수강신청을 위해)
    @RequestMapping("goto_video_ot_ok.do")
    public String gotoVideoOtOk(@RequestParam("no") int no, Model model, HttpSession session) {

        OtDTO dto = this.otdao.getOtCont(no);
        LectureDTO ldto = this.dao.contInfo(no);
        
        int member_no = (Integer)session.getAttribute("member_no");
        
        String ot_title = dto.getOt_summary();
        
         String[] tokens = ot_title.split(",|/");

         int tlength = tokens.length;

         model.addAttribute("dto", dto);
         model.addAttribute("ldto", ldto);
         model.addAttribute("member_no", member_no);

         model.addAttribute("tokens", tokens);
         model.addAttribute("tlength", tlength);
         
         LectureDTO lecDTO = dao.contInfo(no);
         lecDTO.getMem_no_fk();
         
         if(member_no == lecDTO.getMem_no_fk()) {
				model.addAttribute("check_teacher", 1);
			} else {
				model.addAttribute("check_teacher", 2);
			}

        return "lecture/ot_video";
    }
    
    
    //혁님 추가 210128
    // DB ot 동영상 추가
    @RequestMapping("insert_ot_video.do")
    public void inserOtVideo(OtDTO dto, @RequestParam("lec_no") int lec_no,
    		@RequestParam(value="time_first_m") int time_f_m,
    		@RequestParam(value="time_first_s") int time_f_s,
    		@RequestParam(value="time_second_m") int time_s_m,
    		@RequestParam(value="time_second_s") int time_s_s,
    		@RequestParam(value="time_third_m") int time_t_m,
    		@RequestParam(value="time_third_s") int time_t_s, 
    		@RequestParam(value="txt_first") String txt_f, @RequestParam(value="txt_second") String txt_s, 
    		@RequestParam(value="txt_third", defaultValue = "") String txt_t, @RequestParam("ot_src_origin") String ot_src_origin,
    		HttpServletResponse response, Model model) throws IOException {
    	
    	response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
    	
		String ot_summary = "none";
		
		int time_f_tot = time_f_m + time_f_s;
		int time_s_tot = time_s_m + time_s_s;
		int time_t_tot = time_t_m + time_t_s;
		
		if(time_f_tot != 0 && time_s_tot == 0) {
		 
		int time_f = (time_f_m * 60) + time_f_s; ot_summary =
		Integer.toString(time_f)+","+txt_f;
		 
		}else if(time_f_tot != 0 && time_s_tot != 0 && time_t_tot == 0) {
		 
		int time_f = (time_f_m * 60) + time_f_s; int time_s = (time_s_m * 60) +
		time_s_s; ot_summary =
		Integer.toString(time_f)+","+txt_f+"/"+Integer.toString(time_s)+","+txt_s;
		 
		}else if(time_f_tot != 0 && time_s_tot !=0 && time_t_tot != 0) {
		 
		int time_f = (time_f_m * 60) + time_f_s; int time_s = (time_s_m * 60) +
		time_s_s; int time_t = (time_t_m * 60) + time_t_s; ot_summary =
		Integer.toString(time_f)+","+txt_f+"/"+Integer.toString(time_s)+","+txt_s+"/"+Integer.toString(time_t)+","+txt_t+"/";
		 
		}else { 
			ot_summary = "none"; 
		}
		
    	// DB데이터 형식 작업
    	String[] tokens = ot_src_origin.split("=");
    	
    	System.out.println(tokens);
    	
    	// youtube link 주소
    	String ot_src = "https://www.youtube.com/embed/"+tokens[1];
    	
    	dto.setLec_no_fk(lec_no);
    	dto.setOt_summary(ot_summary);
    	dto.setOt_src(ot_src);
    	
    	int res = this.otdao.inserOt(dto);
    	
    	if(res > 0) {
			out.println("<script>");
			out.println("alert('OT정보성공')");
			out.println("location.href='main.do'");
			out.println("</script>");

		}else {
			out.println("<script>");
			out.println("alert('등록 실패')");
			out.println("history.back()");
			out.println("</script>");
		}
    }
    
    @RequestMapping("resist_ot_later.do")
    public void resistLate(Model model, HttpServletResponse response) throws IOException {

        response.setContentType("text/html; charset=UTF-8");

        PrintWriter out = response.getWriter();

        out.println("<script>");
        out.println("alert('나중에 OT정보를 등록해주세요!')");
        out.println("location.href='main.do'");
        out.println("</script>");

    }
    
    // 이혁님 추가 210129
 // 이혁 
    // OT 동영상 관리
    @RequestMapping("ot_insertEdit.do")
    public String otInsertEdit(@RequestParam("no") int lec_no, Model model, HttpServletResponse response) throws IOException {
       
       response.setContentType("text/html; charset=UTF-8");
       
       int res = 0;
       
       res = this.otdao.checkOtData(lec_no);
       
       if(res > 0) {

          OtDTO dto = this.otdao.getOtContByLecNo(lec_no);
          
          String ot_title = dto.getOt_summary();

           String[] tokens = ot_title.split(",|/");
           
           int tlength = tokens.length;

            model.addAttribute("tokens", tokens);
            model.addAttribute("tlength", tlength);
          
          model.addAttribute("lec_no", lec_no);
          model.addAttribute("dto", dto);
          return "mypage/ot_video_edit";
          
       }else {
          
          model.addAttribute("lec_no", lec_no);
          return "mypage/ot_video_insert";
          
       }
       
    }
    @RequestMapping("edit_ot_video.do")
    public void editOtVideo(OtDTO dto, @RequestParam("lec_no") int lec_no,
           @RequestParam(value="time_first_m") int time_f_m,
           @RequestParam(value="time_first_s") int time_f_s,
           @RequestParam(value="time_second_m") int time_s_m,
           @RequestParam(value="time_second_s") int time_s_s,
           @RequestParam(value="time_third_m") int time_t_m,
           @RequestParam(value="time_third_s") int time_t_s, 
           @RequestParam(value="txt_first") String txt_f, @RequestParam(value="txt_second") String txt_s, 
           @RequestParam(value="txt_third", defaultValue = "") String txt_t, @RequestParam("ot_src_origin") String ot_src_origin,
           HttpServletResponse response, Model model) throws IOException {
        
        response.setContentType("text/html; charset=UTF-8");
       
       PrintWriter out = response.getWriter();
        
       String ot_summary = "none";
       
       int time_f_tot = time_f_m + time_f_s;
       int time_s_tot = time_s_m + time_s_s;
       int time_t_tot = time_t_m + time_t_s;
       
       if(time_f_tot != 0 && time_s_tot == 0) {
        
       int time_f = (time_f_m * 60) + time_f_s; ot_summary =
       Integer.toString(time_f)+","+txt_f;
        
       }else if(time_f_tot != 0 && time_s_tot != 0 && time_t_tot == 0) {
        
       int time_f = (time_f_m * 60) + time_f_s; int time_s = (time_s_m * 60) +
       time_s_s; ot_summary =
       Integer.toString(time_f)+","+txt_f+"/"+Integer.toString(time_s)+","+txt_s;
        
       }else if(time_f_tot != 0 && time_s_tot !=0 && time_t_tot != 0) {
        
       int time_f = (time_f_m * 60) + time_f_s; int time_s = (time_s_m * 60) +
       time_s_s; int time_t = (time_t_m * 60) + time_t_s; ot_summary =
       Integer.toString(time_f)+","+txt_f+"/"+Integer.toString(time_s)+","+txt_s+"/"+Integer.toString(time_t)+","+txt_t+"/";
        
       }else { 
          ot_summary = "none"; 
       }
       
        // DB 뜲 씠 꽣  삎 떇  옉 뾽
        String[] tokens = ot_src_origin.split("=");
        
        // youtube link 二쇱냼
        String ot_src = "https://www.youtube.com/embed/"+tokens[1];
        
        dto.setLec_no_fk(lec_no);
        dto.setOt_summary(ot_summary);
        dto.setOt_src(ot_src);
        
        int res = this.otdao.updateOt(dto);
        
        
        
           if(res > 0) {
             out.println("<script>");
             out.println("alert('OT수정이 완료되었습니다.')");
             out.println("location.href='main.do'");
             out.println("</script>");
    
          }else {
             out.println("<script>");
             out.println("alert('OT정보가 등록되어있지 않습니다.')");
             out.println("history.back()");
             out.println("</script>");
          }
        
        
    }
    
    @RequestMapping("ot_delete.do")
    public void otDeleteOk(@RequestParam("no") int lec_no, HttpServletResponse response) throws IOException {
       
       response.setContentType("text/html; charset=UTF-8");
       
       PrintWriter out = response.getWriter();
       
        int chkExist = this.otdao.checkOtData(lec_no);
       
        if(chkExist > 0) {
        
           int res = this.otdao.deleteOt(lec_no);
           
          if(res > 0) {
             out.println("<script>");
             out.println("alert('OT정보가 삭제되었습니다.')");
             out.println("history.back()");
             out.println("</script>");
    
          }else {
             out.println("<script>");
             out.println("alert('알수없는 오류로 수정에 실패하였습니다.')");
             out.println("history.back()");
             out.println("</script>");
          }
       
        }else {
           
           out.println("<script>");
          out.println("alert('OT가 아직 등록되어있지 않습니다.')");
          out.println("history.back()");
          out.println("</script>");
           
        }
       
    }
    
    
    // 임하늘님 추가 210129
	// 클래스 관리자 페이지 이동
    @RequestMapping("class_management.do")
	public String manage(@RequestParam("mem") String member, Model model) {
		
		List<CategoryDTO> list = this.dao.getInfoMember(member);
		model.addAttribute("cList", list);
		
		return "mypage/class_manager";
	}
	
    // 클래스 삭제
 	@RequestMapping("class_delete.do")
 	public void del(@RequestParam("no") int no, HttpServletResponse response, HttpSession session) throws IOException {
 		response.setContentType("text/html; charset=UTF-8");
 		PrintWriter out = response.getWriter();
 		String mem = (String) session.getAttribute("member_id");
 		
 		this.dao.deleteInfo(no);
 		
 		out.println("<script>");
 		out.println("alert('클래스가 정상적으로 삭제되었습니다.')");
 		out.println("location.href='class_management.do?mem="+mem+"'");
 		out.println("</script>");
 	}
 	
	// 클래스 수정
	@RequestMapping("class_update.do")
	public String modify(@RequestParam("no") int no, Model model) {
		
		CategoryDTO dto = this.dao.modifyCont(no);
		
		model.addAttribute("dto", dto);
		
		return "mypage/class_update";
	}
	
	@RequestMapping("class_update_ok.do")
	public void modifyOk(MultipartHttpServletRequest mRequest, LectureDTO dto, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		upload.fileUpload(mRequest);
		
		Iterator<String> iterator = mRequest.getFileNames();
		
		MultipartFile mFile = mRequest.getFile(iterator.next());
		
		// 이미지 변경 시
		if(mFile.getSize() > 0) {
			dto.setLec_thumbnail(mFile.getOriginalFilename());
			int result = this.dao.updateInfo(dto);
			
			if(result > 0) {
				out.println("<script>");
				out.println("alert('정상적으로 수정되었습니다.')");
				out.println("location.href='class_management.do?mem="+dto.getLec_member()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('이미지 변경 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}else { // 이미지 그대로
			int result_no = this.dao.updateInfo(dto);
			
			if(result_no > 0) {
				out.println("<script>");
				out.println("alert('정상적으로 수정되었습니다.')");
				out.println("location.href='class_management.do?mem="+dto.getLec_member()+"'");
				out.println("</script>");
			}else {
				out.println("<script>");
				out.println("alert('수정 실패')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
	}
	
	// 210208 추가
	@RequestMapping("early_bird.do")
	public String earlyBird(@RequestParam("cate_code") int cate_code, Model model, HttpSession session) {
		
		model.addAttribute("sess_member_no", session.getAttribute("member_no"));

		List<LectureDTO> list = this.dao.getEarlyBirdList(cate_code);
		model.addAttribute("L_cate", list);

		List<CategoryDTO> clist = this.dao.getCateList();
		model.addAttribute("C_list", clist);

		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		List<HotDTO> allList = this.hotDao.getAllLikeList();
		model.addAttribute("All_list_for_like", allList);
		
		model.addAttribute("icon", "fas fa-dove fa-3x");
		
		return "smc_event";
	}
	
	@RequestMapping("open_plan.do")
	public String openPlan(@RequestParam("cate_code") int cate_code, Model model, HttpSession session) {
		
		model.addAttribute("sess_member_no", session.getAttribute("member_no"));
		
		List<LectureDTO> list = this.dao.getOpenPlanList(cate_code);
		model.addAttribute("L_cate", list);
		
		List<CategoryDTO> clist = this.dao.getCateList();
		model.addAttribute("C_list", clist);
		
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		List<HotDTO> allList = this.hotDao.getAllLikeList();
		model.addAttribute("All_list_for_like", allList);
		
		model.addAttribute("icon", "far fa-clock fa-3x");
		
		return "smc_event";
	}
	
	@RequestMapping("imme_regi.do")
	public String immeRegi(@RequestParam("cate_code") int cate_code, Model model, HttpSession session) {
		
		model.addAttribute("sess_member_no", session.getAttribute("member_no"));
		
		List<LectureDTO> list = this.dao.getImmeRegiList(cate_code);
		model.addAttribute("L_cate", list);
		
		List<CategoryDTO> clist = this.dao.getCateList();
		model.addAttribute("C_list", clist);
		
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		List<HotDTO> allList = this.hotDao.getAllLikeList();
		model.addAttribute("All_list_for_like", allList);
		
		model.addAttribute("icon", "far fa-play-circle fa-3x");
		
		return "smc_event";
	}
	
	@RequestMapping("info_popup.do")
	public String popup() {
		
		return "lecture/info_popup";
	}
    
}
