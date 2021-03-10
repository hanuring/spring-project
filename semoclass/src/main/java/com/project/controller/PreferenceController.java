package com.project.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.model.PreferenceDAO;

@Controller
public class PreferenceController {
	@Autowired
	private PreferenceDAO dao;
	
	@RequestMapping("lec_like.do")
	@ResponseBody
	public int lecLike(@RequestParam("lec_no_fk") int lec_no,@RequestParam("mem_no_fk")int mem_no) {
		return dao.doLikeLec(lec_no,mem_no);
	}
	
	@RequestMapping("lec_dislike.do")
	@ResponseBody
	public int lecDislike(@RequestParam("lec_no_fk") int lec_no,@RequestParam("mem_no_fk")int mem_no) {
		return dao.doDislikeLec(lec_no,mem_no);
	}
	
	@RequestMapping("wishlist.do")
	@ResponseBody
	public int addWishList(@RequestParam("lec_no_fk") int lec_no,@RequestParam("mem_no_fk")int mem_no) {
		return dao.addWishList(lec_no, mem_no);
	}
	
	@RequestMapping("/pref.do")
	public String pref(Model model, @RequestParam("no") int lec_no, HttpSession session) {
		int mem_no = (Integer)session.getAttribute("member_no");
		int count = this.dao.prefCount(lec_no, mem_no);
		if(count>0) {
			model.addAttribute("pref_info",this.dao.prefCont(lec_no, mem_no));
		}
		return "preference";
	}
	
	// 좋아요&싫어요 수 카운트
	@RequestMapping("pref_count.do")
	@ResponseBody
	public HashMap<String, Integer> prefCount(@RequestParam("lec_no_fk") int lec_no, Model model) {
		HashMap<String, Integer> count = new HashMap<String, Integer>();
		count.put("likeCount", this.dao.getLikeNum(lec_no));
		count.put("dislikeCount", this.dao.getDislikeNum(lec_no));
		
		return count;
	}
	
	
}
