package com.project.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.model.ComunityDAO;
import com.project.model.ComunityDTO;
import com.project.model.ReplyDTO;

@Controller
public class ComunityController {
	@Autowired
	private ComunityDAO dao;
	
	// 210126 (이호철 수정)
	@RequestMapping("/comu_write.do")
	public String comuWrite(HttpServletRequest request, HttpSession session,Model model) {
		
		int lec_no = Integer.parseInt(request.getParameter("no"));
		model.addAttribute("lec_no", lec_no);
		
		//0202박지원 추가
		String lec_name = request.getParameter("lec_name");
		model.addAttribute("lec_name",lec_name);
		
		// 세션에 저장돼있는 회원번호값 가져와서 저장
		int member_no = (Integer)session.getAttribute("member_no");
		model.addAttribute("member_no", member_no);
		
		return "comu_write";
	}
	
	// 210126 이호철 수정
	@RequestMapping("/comu_writeOk.do")
	public void comuWriteOk(ComunityDTO dto, HttpServletResponse resp, HttpServletRequest request) throws IOException {
		int res = this.dao.comuWrite(dto);
		int lec_no = Integer.parseInt(request.getParameter("lec_no_fk"));
		
		PrintWriter out = resp.getWriter();
		if(res>0) {
			out.println("<script>");
			//out.println("opener.parent.location.reload()");
			//out.println("location.href='info_cont.do?no="+ lec_no +"'");
			out.println("</script>");
		}
	}
	
	@RequestMapping("rep_list.do")
	@ResponseBody
	public List<ReplyDTO> repList(@RequestParam("lec_no_fk") int lec_no) {
		List<ReplyDTO> list = new ArrayList<ReplyDTO>();
		list = this.dao.getReplyList(lec_no);
		
		return list;
	}
	
	@RequestMapping("rep_write.do")
	@ResponseBody
	public int repWrite(ReplyDTO dto) {
//		System.out.println("강의 번호: "+dto.getLec_no_fk()+", 댓글 작성자: "+dto.getMem_name());
		if(dto.getReply_cont()==""||dto.getReply_cont()==null) {
			return -1;
		}else {
			return this.dao.replyWrite(dto);
		}
	}
	
	
	// 210128 박지원님 추가
	@RequestMapping("rep_delete.do")
	@ResponseBody
	public int repDelete(@RequestParam("rep_no") int rep_no) {
		return this.dao.replyDelete(rep_no);
	}
	
	@RequestMapping("rep_edit.do")
	@ResponseBody
	public void repEdit(@RequestParam("rep_no") int rep_no, @RequestParam("rep_cont")String rep_cont) {
		ReplyDTO dto = new ReplyDTO();
		dto.setReply_no(rep_no);
		dto.setReply_cont(rep_cont);
		this.dao.replyEdit(dto);
	}
	
	@RequestMapping("re_rep_list.do")
	@ResponseBody
	public List<ReplyDTO> reRepList(@RequestParam("lec_no") int lec_no,@RequestParam("rep_no") int rep_no) {
		
		return this.dao.getReReplyList(lec_no, rep_no);
	}
	
	@RequestMapping("re_rep_write.do")
	@ResponseBody
	public int reRepWrite(ReplyDTO dto) {
		if(dto.getReply_cont()==""||dto.getReply_cont()==null) {
			return -1;
		}else {
			return this.dao.reRepWrite(dto);
		}
	}
	
	
}