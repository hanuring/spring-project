package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.model.CategoryDTO;
import com.project.model.HotDAO;
import com.project.model.HotDTO;
import com.project.model.LecInfoDAO;
import com.project.model.MemberDAO;
import com.project.model.MemberDTO;
import com.project.model.PreferenceDAO;

@Controller
public class HeaderController {
	
	@Autowired
	private LecInfoDAO ldao;
	
	// 철민
	@Autowired
	private HotDAO hotDao;
	
	// 210129 추가
	@Autowired
	private MemberDAO mdao;
	
	// 210203 추가
	@Autowired
	private PreferenceDAO pdao;
	
	// 홈버튼 아이콘 
	@RequestMapping("/main.do")
	public String goTomain(Model model, HttpSession session) {
		
		model.addAttribute("sess_member_no", session.getAttribute("member_no"));
		
		List<CategoryDTO> lcate= this.ldao.getLargeCate();
		model.addAttribute("L_Cate", lcate);
		
		List<CategoryDTO> mcate= this.ldao.getMidCate();
		model.addAttribute("M_Cate", mcate);
		
		// 철민
		List<HotDTO> hotList = this.hotDao.getHotList();
		model.addAttribute("hotList", hotList);		
		
		// 0201 철민
		List<HotDTO> recentList = this.hotDao.getAllList();
		model.addAttribute("recentList", recentList);	
		
		//210129 추가
		List<MemberDTO> mlist =  mdao.getAllMember();
		model.addAttribute("Member_list", mlist);
		
		// 210203 이호철 추가 
		List<HotDTO> allList = this.hotDao.getAllLikeList();
		model.addAttribute("All_list_for_like", allList);
		
		// 0209 철민
		List<HotDTO> openList = this.hotDao.getOpenList();
		model.addAttribute("openList", openList);
		List<HotDTO> newList = this.hotDao.getNewList();
		model.addAttribute("newList", newList);
		
		
		return "smc_main";
	}
	
	
	@RequestMapping("autoComplete.do")
	@ResponseBody
	public List<String> searchList(@RequestParam("search_field") String search_field){
		List<String> list = this.ldao.autoSearch(search_field);
		return list;
	}
	
	
}
