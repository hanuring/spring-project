package com.project.model;

import java.util.List;

public interface MemberDAO {

	MemberDTO loginMember(MemberDTO dto);
	MemberDTO MypageInfo(int no);
	int editMemberInfo(MemberDTO dto);
	int quitMember(int no);
	int joinMember(MemberDTO dto);
	int idCheck(MemberDTO dto);
	
	// 210129 추가
	List<MemberDTO> getAllMember();
	
	// 210201 추가
    MemberDTO getLatestMember();
}
