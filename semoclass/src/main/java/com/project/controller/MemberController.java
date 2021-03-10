package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.model.CategoryDTO;
import com.project.model.ComunityDAO;
import com.project.model.HotDAO;
import com.project.model.HotDTO;
import com.project.model.LecInfoDAO;
import com.project.model.LectureDTO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;
import com.project.model.OtDAO;
import com.project.model.PreferenceDAO;
import com.project.model.RegistDAO;
import com.project.model.RegistDTO;
import com.project.model.ReplyDTO;

@Controller
public class MemberController {

	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private LecInfoDAO ldao;
	
	// 철민 0126
	@Autowired
	private HotDAO hotDao;
	
	@Autowired
	private MemberDAO mdao;
	
	// 철민 0201
	@Autowired
	private RegistDAO regDao;
	
	// 호철 0215
	private OtDAO otDao;
	
	private ComunityDAO cDao;
	
	private PreferenceDAO pDao;
	
	
	
	
	@RequestMapping("smc_main.do")
	public String gotoMemberIndexPage(Model model, HttpSession session) {
		
		model.addAttribute("sess_member_no", session.getAttribute("member_no"));
		
		// 추가(210121)		
		List<CategoryDTO> lcate= this.ldao.getLargeCate();
		model.addAttribute("L_Cate", lcate);
		List<CategoryDTO> mcate= this.ldao.getMidCate();
		model.addAttribute("M_Cate", mcate);

		// 철민 0126
		List<HotDTO> hotList = this.hotDao.getHotList();
		model.addAttribute("hotList", hotList);
		
		// 0201 철민
		List<HotDTO> recentList = this.hotDao.getAllList();
		model.addAttribute("recentList", recentList);
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		// 0209 철민
		List<HotDTO> openList = this.hotDao.getOpenList();
		model.addAttribute("openList", openList);
		List<HotDTO> newList = this.hotDao.getNewList();
		model.addAttribute("newList", newList);
		
		// 수정(210121)
		return "smc_main";
	}
	
	@RequestMapping("goto_login_member.do")
	public String gotoLoginPage(Model model) {
		
		return "member_login";
		
	}
	
	@RequestMapping("member_try_login.do")
	public void tryLogin(MemberDTO dto, Model model, HttpServletResponse response, HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto.getMember_id().isEmpty()||dto.getMember_pwd().isEmpty()) {
			
			out.println("<script>");
			out.println("alert('아이디와 비밀번호를 입력해 주세요.')");
			out.println("history.back()");
			out.println("</script>");
			
		}else {
			try {
				MemberDTO dto_2 = this.dao.loginMember(dto);
				
				session.setAttribute("member_no", dto_2.getMember_no());
				session.setAttribute("member_id", dto_2.getMember_id());
				session.setAttribute("member_grade", dto_2.getMember_grade());
				
				if(dto_2.getMember_state() == -1) { //탈퇴한 상태인 경우
					//0216 박지원 추가
					out.println("<script>");
					out.println("alert('회원탈퇴한 계정입니다.')");
					out.println("history.back()");
					out.println("</script>");
				}else if(dto_2.getMember_pwd().equals(dto.getMember_pwd())) {
					out.println("<script>");
					out.println("alert('로그인 성공')");
					// 수정(210121)
					out.println("location.href='smc_main.do'");
					out.println("</script>");
				}else{
					
					out.println("<script>");
					out.println("alert('로그인 실패')");
					out.println("history.back()");
					out.println("</script>");
					
				}
				
			} catch (Exception e) {
				out.println("<script>");
				out.println("alert('존재하지 않는 아이디이거나, 틀린 비밀번호입니다.')");
				out.println("history.back()");
				out.println("</script>");
			}
		}
		
	}
	
	@RequestMapping("goto_logout_member.do")
	public String logoutMember(Model model, HttpServletResponse response, HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		session.setAttribute("member_no", 0);
		
		// 추가(210121)		
		List<CategoryDTO> lcate= this.ldao.getLargeCate();
		model.addAttribute("L_Cate", lcate);
		List<CategoryDTO> mcate= this.ldao.getMidCate();
		model.addAttribute("M_Cate", mcate);
		
		// 철민 0126
		List<HotDTO> hotList = this.hotDao.getHotList();
		model.addAttribute("hotList", hotList);
		
		// 0201 철민
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		// 0209 철민
		List<HotDTO> openList = this.hotDao.getOpenList();
		model.addAttribute("openList", openList);
		List<HotDTO> newList = this.hotDao.getNewList();
		model.addAttribute("newList", newList);
		
		// 수정(210121)
		return "smc_main";
		
	}
	
	@RequestMapping("goto_myInfo_member.do")
	public String gotoMypageInfo(@RequestParam("no") int no, Model model) {
		
		MemberDTO dto = this.dao.MypageInfo(no);
		model.addAttribute("dto", dto);
		
		// 0210 철민
		MemberDTO mdto = this.dao.MypageInfo(no);
		model.addAttribute("mdto", mdto);
		List<HotDTO> recentList = this.hotDao.getAllList();
		model.addAttribute("recentList", recentList);
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		List<Integer> wishList = this.regDao.checkWish(no);
		model.addAttribute("wishList", wishList);
		List<Integer> regList = this.regDao.checkReg(no);
		model.addAttribute("regList", regList);
		
		return "member/member_myPage";
		
	}
	
	@RequestMapping("member_goto_edit.do")
	public String gotoEditPwdChk(Model model, @RequestParam("no") int no) {
		
		MemberDTO dto = this.dao.MypageInfo(no);
		
		model.addAttribute("dto", dto);
		
		return "member/member_editForm";
		
	}
	
	@RequestMapping("member_edit_check.do")
	public void gotoEditForm(@RequestParam("no") int no, @RequestParam("try_pwd") String try_pwd, Model model, HttpSession session, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		MemberDTO dto = this.dao.MypageInfo(no);
		
		if(dto.getMember_pwd().equals(try_pwd)) {
				
			model.addAttribute("dto", dto);
			
			out.println("<script>");
			out.println("location.href='goto_myInfo_member.do?no='"+no);
			out.println("</script>");
				
		}else {
			out.println("<script>");
			out.println("alert('비밀번호 불일치')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	@RequestMapping("goto_member_editForm.do") 
	public String gotoEditForm(@RequestParam("dto") MemberDTO dto, Model model) {
		
		model.addAttribute("dto", dto);
		
		return "member/member_editForm";
	}
	
	@RequestMapping("member_edit_ok.do")
	public void editOkMember(MemberDTO dto, Model model, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int res = this.dao.editMemberInfo(dto);
		
		if(res > 0) {
			
			out.println("<script>");
			out.println("alert('정보변경 성공')");
			// 수정(210121)
			out.println("location.href='smc_main.do'");
			out.println("</script>");
			
		}else {
			
			out.println("<script>");
			out.println("alert('정보변경 실패')");
			out.println("history.back()");
			out.println("</script>");
			
		}
		
	}
	
	@RequestMapping("member_try_quit.do")
	public String gotoTryQuit(@RequestParam("no") int no, Model model) {
		
		MemberDTO dto = dao.MypageInfo(no);
		
		model.addAttribute("dto", dto);
		
		return "member/member_quit_check";
		
	}
	
	@RequestMapping("member_quit_check.do")
	public void tryQuitOk(@RequestParam("no") int no, @RequestParam("try_pwd") String try_pwd, Model model, HttpServletResponse response, HttpSession session) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		// no = member_no
		MemberDTO dto = dao.MypageInfo(no);
		
		if(dto.getMember_pwd().equals(try_pwd)) {
			
			this.dao.quitMember(no);
			
			session.setAttribute("member_no", 0);
			
			List<LectureDTO> lwmList = this.ldao.getListWhereMember(no);
			if(lwmList != null) {
				System.out.println(lwmList);
				for(int i =0 ; i < lwmList.size(); i ++) {
					int lec_no = lwmList.get(i).getLec_no();
					System.out.println("lec_no["+i+"] >>> " + lec_no);
					//강의 삭제
					ldao.deleteInfo(lwmList.get(i).getLec_no());
				}
				System.out.println("integer 반환 " + regDao.checkReg(no));
				try {
					System.out.println("수강신청한 클래스 있음");
					regDao.deleteRegist(no); 
				} catch (Exception e) {
				}
				 
			}
			out.println("<script>");
			out.println("alert('회원탈퇴')");
			// 수정(210121)
			out.println("location.href='smc_main.do'");
			out.println("</script>");
		}else {
			out.println("<script>");
			out.println("alert('비밀번호 불일치')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}
	
	@RequestMapping("goto_join_member.do")
	public String gotoJoinForm(Model model) {
		
		return "member/member_joinForm";
		
	}
	
	@RequestMapping("member_join.do")
	public void joinMemberOk(MemberDTO dto, @RequestParam("member_pwd_conf") String pwd_second, Model model, HttpServletResponse response, HttpSession session) throws IOException  {
		
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		int chkId = 0;
		int temp = 0;
		
		try {
			chkId = this.dao.idCheck(dto);
		} catch (Exception e) {
		}
		try {
			if(dto.getMember_pwd().equals(pwd_second)) {
				if(chkId > 0) {
					out.println("<script>"); 
					out.println("alert('아이디 중복')");
					out.println("history.back()"); 
					out.println("</script>");
				}else if(chkId == 0){
					int res = this.dao.joinMember(dto);
					
					MemberDTO latestDto = this.dao.getLatestMember();
                    session.setAttribute("member_no", latestDto.getMember_no());
					
					if(res > 0) {
						out.println("<script>");
						out.println("alert('가입성공! 메인페이지로 이동합니다.')");
						// 수정(210121)
						out.println("location.href='smc_main.do'");
						out.println("</script>");
					}else {
						out.println("<script>");
						out.println("alert('회원가입 실패')");
						out.println("history.back()");
						out.println("</script>");
					}
				}
				
			}else {
				out.println("<script>");
				out.println("alert('비밀번호확인이 비밀번호와 일치하지않습니다.')");
				out.println("history.back()");
				out.println("</script>");
				
			}
		}catch (Exception e) {
			temp = 1;
		}
		if(temp == 1) {
			out.println("<script>");
			out.println("alert('회원가입에 실패하였습니다. 필수기입사항을 확인하세요.')");
			out.println("history.back()");
			out.println("</script>");
		}
	}
	
	
	
	// 회원가입시 id중복체크관련 ajax
	@RequestMapping("member_idCheck.do")
    public String ajaxIdCheck(@RequestParam("userId") String user_id, Model model) {

        MemberDTO dto = new MemberDTO();
        dto.setMember_id(user_id);

        int res = 0;

        try {
            res = this.dao.idCheck(dto);
        } catch (Exception e) {
        	
        }
        model.addAttribute("res", res);

        return "ajax/ajax_idChk";
    }
	
	
	// 0201 철민
	@RequestMapping("/regist_class.do")
	public String regist(@RequestParam("lec_no") int lec_no, @RequestParam("mem_no") int mem_no, Model model, HttpServletResponse response) throws IOException {

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		RegistDTO regDto = new RegistDTO();
		regDto.setLec_no_fk(lec_no);
		regDto.setMem_no_fk(mem_no);
		
		HotDTO hotDto = this.hotDao.getOneList(lec_no);
		model.addAttribute("dto", hotDto);
		MemberDTO mdto = mdao.MypageInfo(mem_no);
		
		/*
		 * Date now = new Date(); SimpleDateFormat before = new
		 * SimpleDateFormat("yyyy-MM-dd"); Date start =
		 * before.parse(hotDto.getLec_startdate()); int compare = now.compareTo(start);
		 * 
		 * Integer check = this.regDao.checkRegist(regDto);
		 * 
		 * if (check > 0) { out.println("<script>");
		 * out.println("alert('이미 수강 중인 클래스입니다')"); out.println("history.back()");
		 * out.println("</script>"); } else if (compare < 0) { out.println("<script>");
		 * out.println("alert('아직 오픈하지 않은 클래스입니다')"); out.println("history.back()");
		 * out.println("</script>"); } else { return "class/regist_class"; }
		 */
		Integer check = this.regDao.checkRegist(regDto);
		if (check > 0) {
			System.out.println(hotDto);
			out.println("<script>");
			out.println("alert('이미 수강 중인 클래스입니다')");
			out.println("history.back()");
			out.println("</script>");
			return null;
		} else {
			model.addAttribute("member_name", mdto.getMember_name());
			return "class/regist_class";
		}
	}

	// 0201 철민
	@RequestMapping("/regist_class_ok.do")
	public void registOk(@RequestParam(value="lec_no", required=true) int lec_no, @RequestParam(value="mem_no", required = true) int mem_no, Model model, HttpServletResponse response) throws IOException {
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		RegistDTO regDto = new RegistDTO();
		regDto.setLec_no_fk(lec_no);
		regDto.setMem_no_fk(mem_no);
		System.out.println("lec_no, mem_no " + lec_no +", " + mem_no);
		int res = this.regDao.registClass(regDto);
		System.out.println("res >>> " + res);
		// 210210 이호철 수정
		if (res > 0) {
			MemberDTO dto = this.dao.MypageInfo(mem_no);
			model.addAttribute("dto", dto);
			MemberDTO mdto = this.dao.MypageInfo(mem_no);
			model.addAttribute("mdto", mdto);
			List<HotDTO> recentList = this.hotDao.getAllList();
			model.addAttribute("recentList", recentList);
			List<MemberDTO> mlist =  mdao.getAllMember();
			model.addAttribute("Member_list", mlist);
			List<Integer> wishList = this.regDao.checkWish(mem_no);
			model.addAttribute("wishList", wishList);
			List<Integer> regList = this.regDao.checkReg(mem_no);
			model.addAttribute("regList", regList);
			
			out.println("<script>");
			out.println("alert('수강신청 성공! 마이페이지로 이동합니다.')");
			out.println("location.href='goto_myInfo_member.do?no="+mem_no +"'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("alert('실패하였습니다. 다시 확인해주세요')");
			out.println("history.back()");
			out.println("</script>");
		}
		
	}

	
	
}
