package com.project.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.model.CategoryDTO;
import com.project.model.HotDAO;
import com.project.model.HotDTO;
import com.project.model.LecInfoDAO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;
import com.project.model.PreferenceDAO;

@Controller
public class HomeController {
	
	@Autowired
	private LecInfoDAO dao;
	
	// 철민
	@Autowired
	private HotDAO hotDao;
		
	// 210129 추가
	@Autowired
	private MemberDAO mdao;
	
	// 210203 추가
	@Autowired
	private PreferenceDAO pdao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, HttpSession session) {
		
		List<CategoryDTO> lcate= this.dao.getLargeCate();
		model.addAttribute("L_Cate", lcate);
		
		List<CategoryDTO> mcate= this.dao.getMidCate();
		model.addAttribute("M_Cate", mcate);
		
		// 검색하는 부분 여기서 리스트 넘겨주는 식으로 해보자
		// ajax
		
		// 혁님 member_index 로 넘겨준 값들 
		session.setAttribute("member_no", 0);
		session.setAttribute("member_id", null);
		session.setAttribute("member_grade", null);
		session.setAttribute("sess_member_no", null);
		
		// 철민
		List<HotDTO> hotList = this.hotDao.getHotList();
		model.addAttribute("hotList", hotList);		
		
		// 210129 추가
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		
		// 210203 추가 
		List<HotDTO> allList = this.hotDao.getAllLikeList();
		model.addAttribute("All_list_for_like", allList);
		
		// 0209 철민
		List<HotDTO> openList = this.hotDao.getOpenList();
		model.addAttribute("openList", openList);
		List<HotDTO> newList = this.hotDao.getNewList();
		model.addAttribute("newList", newList);
		
		return "smc_main";
	}
	
	// 0204 박지원 추가(좋아요 누른 강의 목록)
	@RequestMapping("lec_like_list.do")
	public String lecLikeList(Model model, HttpSession session) {
		int mem_no = (Integer)session.getAttribute("member_no");
		
		model.addAttribute("L_Cate", this.dao.getLargeCate());
		model.addAttribute("M_Cate", this.dao.getMidCate());
		model.addAttribute("likeList", this.pdao.getLecLikeList(mem_no));
		model.addAttribute("Member_list", mdao.getAllMember());
		
		return "like_list";
	}
	
}
