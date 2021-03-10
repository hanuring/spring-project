package com.project.model;

import java.util.List;

public interface AdminDAO {
	
	public List<NoticeVO> getNoticeList(int s_no, int e_no);
	public NoticeVO getNoticeCont(int no);
	
	public int getNoticeCount();
	public int addHit(int no);
	
	public int insertNotice(NoticeDTO dto);
	public int updateNotice(NoticeDTO dto);
	public int deleteNotice(int no);
	
	
}
