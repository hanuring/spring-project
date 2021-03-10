package com.project.model;

import java.util.List;

public interface ComunityDAO {
	public List<ComunityVO> getComuList(int lec_no); //강사, 강의번호로 조회
	public int getComuCount(int lec_no);
	public List<ReplyDTO> getReplyList(int lec_no); //강의번호로 조회
	public int comuWrite(ComunityDTO dto);
	public int replyWrite(ReplyDTO dto);
	public int replyDelete(int rep_no);
	public int replyEdit(ReplyDTO dto);
	public List<ReplyDTO> getReReplyList(int lec_no,int rep_no); //강의번호로 조회
	public int reRepWrite(ReplyDTO dto);
}
