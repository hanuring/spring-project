package com.project.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.Iterator;

import javax.servlet.ServletOutputStream;
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

import com.project.model.AdminDAO;
import com.project.model.NoticeDTO;

@Controller
public class NoticeController {
	
	@Autowired
	private upload upload;
	
	@Autowired
	private AdminDAO dao;
	
	String filePath = "C:\\Users\\이혁\\Desktop\\spring\\Project_final\\src\\main\\webapp\\resources\\notice_file\\";
	
	@RequestMapping("notice.do")
	public String notice(Model model, @RequestParam("page") int mPage, HttpSession session) {
		int page = 1;
		if(mPage > 0) page = mPage;
		
		int rowsize = 10;
		int block = 10;
		int startNo = (page*rowsize)-(rowsize-1);
		int endNo = (page*rowsize);
		
		int totalRecord = dao.getNoticeCount();
		int allPage = (int)Math.ceil(totalRecord/(double)rowsize);
		
		int startBlock = (((page-1)/block)*block)+1;
		int endBlock = (((page-1)/block)*block)+block;
		
		if(endBlock>allPage) endBlock = allPage;
		
		
		model.addAttribute("allPage",allPage);
		model.addAttribute("startNo",startNo);
		model.addAttribute("endNo",endNo);
		model.addAttribute("startBlock",startBlock);
		model.addAttribute("endBlock",endBlock);
		model.addAttribute("page",page);
		model.addAttribute("rowsize",rowsize);
		model.addAttribute("block",block);
		model.addAttribute("memID",session.getAttribute("member_id"));
		//공지글들 넘겨주기
		model.addAttribute("noticeList",dao.getNoticeList(startNo,endNo));
		
		return "notice/notice";
	}
	
	@RequestMapping("notice_write.do")
	public String noticeWrite() {
		
		return "admin/notice_writeForm";
	}
	
	@RequestMapping("notice_write_ok.do")
	public String noticeWriteOk(MultipartHttpServletRequest mRequest, NoticeDTO dto,HttpServletResponse resp, HttpSession session) throws IOException {
		int res = 0;
		int mem_no = (Integer)session.getAttribute("member_no");
		PrintWriter out = resp.getWriter();
		Iterator<String> fileName = mRequest.getFileNames();
		
		dto.setMem_no_fk(mem_no);

		if(fileName.hasNext()) {
			MultipartFile file = mRequest.getFile(fileName.next());
			
			//업로드할 파일이 있는 경우
			if(file.getSize()>0){
				dto.setNotice_file(file.getOriginalFilename());
				
				if(upload.noticeFileUpload(mRequest)) {//파일 업로드
					res = dao.insertNotice(dto);
				}else {
					out.println("<script>");
					out.println("alert('공지사항 파일 업로드 실패')");
					out.println("history.back()");
					out.println("<script>");
				}
			}else {//업로드할 파일이 없는 경우
				res = dao.insertNotice(dto);
			}
			
			if(res>0) {//insert 성공시
				return "redirect:notice.do?page=1";
			}else {
				out.println("<script>");
				out.println("alert('공지사항 작성 실패')");
				out.println("history.back()");
				out.println("<script>");
			}
		}else {
			res = dao.insertNotice(dto);
			if(res>0) {//insert 성공시
				return "redirect:notice.do?page=1";
			}else {
				out.println("<script>");
				out.println("alert('공지사항 작성 실패')");
				out.println("history.back()");
			}
		}
		
		return "redirect:notice.do?page=1";
	}
	
	@RequestMapping("notice_cont.do")
	public String noticeCont(@RequestParam("no") int no, Model model, HttpSession session) {
		dao.addHit(no);
		model.addAttribute("memID",session.getAttribute("member_id"));
		model.addAttribute("notice",dao.getNoticeCont(no));
		
		return "notice/notice_cont";
	}
	
	@RequestMapping("notice_delete.do")
	public String noticeDelete(@RequestParam("no") int no) {
		dao.deleteNotice(no);
		
		return "redirect:notice.do?page=1";
	}
	
	@RequestMapping("notice_update.do")
	public String noticeUpdate(@RequestParam("no") int no, Model model) {
		model.addAttribute("updateCont", dao.getNoticeCont(no));
		
		return "admin/notice_updateForm";
	}
	@RequestMapping("notice_update_ok.do")
	public String noticeUpdateOk(@RequestParam("old_filename")String oldFileName, NoticeDTO dto, MultipartHttpServletRequest mRequest, HttpServletResponse resp) throws IOException {
		int res = 0;
		Iterator<String> fileName = mRequest.getFileNames();
		PrintWriter out = resp.getWriter();
		
		if(fileName.hasNext()) {
			MultipartFile file = mRequest.getFile(fileName.next());
			
			//업로드할 파일이 있는 경우
			if(file.getSize()>0){
				dto.setNotice_file(file.getOriginalFilename());
				
				File oldFile = new File(filePath+oldFileName);
				//업로드됐던 예전 파일 삭제
				if(oldFile.exists()) oldFile.delete();
				
				if(upload.noticeFileUpload(mRequest)) {//파일 업로드
					res = dao.updateNotice(dto);
				}else {
					out.println("<script>");
					out.println("alert('공지사항 파일 업로드 실패')");
					out.println("history.back()");
					out.println("<script>");
				}
			}else {//hasNext()시 업로드할 파일이 없는 경우
				res = dao.updateNotice(dto);
			}
		}else {//업로드할 파일이 없는 경우
			res = dao.updateNotice(dto);
		}
		
		if(res>0) {//update 성공시
			return "redirect:notice.do?page=1";
		}else {
			out.println("<script>");
			out.println("alert('공지사항 작성 실패')");
			out.println("history.back()");
			out.println("<script>");
		}
		
		dao.updateNotice(dto);
		
		return "redirect:notice_cont.do?no="+dto.getNotice_no();
	}
	
	@RequestMapping("file_download.do")
	public void fileDownload(@RequestParam("name") String fileName, HttpServletResponse resp, HttpServletRequest req) {
		
		File file = new File(filePath+fileName); 
		
		FileInputStream fis = null;
		BufferedInputStream bis = null;
		ServletOutputStream sos = null;
		
		try {
			fis = new FileInputStream(file);
			bis = new BufferedInputStream(fis);
			sos = resp.getOutputStream();
			
			//IE일 경우 파일이름 인코딩
			String reFileName = fileName;
			boolean isMSIE = req.getHeader("user-agent").indexOf("MSIE") != -1 || req.getHeader("user-agent").indexOf("Trident") != -1;
			if(isMSIE) {
				reFileName = URLEncoder.encode(reFileName,"UTF-8");
				reFileName = reFileName.replaceAll("\\", "%20");
			}else {
				reFileName = new String(reFileName.getBytes("UTF-8"),"ISO-8859-1");
			}
			
			resp.setContentType("aplication/octet-stream; charset=utf-8");
			resp.addHeader("Content-Disposition", "attachment;filename=\""+reFileName+"\"");
			resp.setContentLength((int)file.length());
			
			int read = 0;
			while((read = bis.read())!= -1) {
				//파일 출력
				sos.write(read);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				sos.close();
				bis.close();
			}catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	
	
}
