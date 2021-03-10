package com.project.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDTO loginMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		
		return this.sqlSession.selectOne("tryLogin", dto);
	}

	@Override
	public MemberDTO MypageInfo(int no) {
		// TODO Auto-generated method stub
		
		return this.sqlSession.selectOne("myPageInfo", no);
	}

	@Override
	public int editMemberInfo(MemberDTO dto) {
		// TODO Auto-generated method stub
		
		return this.sqlSession.update("editMemberInfo", dto);
	}

	@Override
	public int quitMember(int no) {
		// TODO Auto-generated method stub
		this.sqlSession.delete("quitMemberPrefDelete",no);
		return this.sqlSession.update("quitMember", no);
	}

	@Override
	public int joinMember(MemberDTO dto) {
		// TODO Auto-generated method stub
		
		return this.sqlSession.insert("joinMember", dto);
	}

	@Override
	public int idCheck(MemberDTO dto) {
		// TODO Auto-generated method stub
		
		return this.sqlSession.selectOne("idChk", dto);
	}

	
	// 210129 추가
	@Override
	public List<MemberDTO> getAllMember() {
		return this.sqlSession.selectList("All_Member");
	}

	
	// 210201 추가
	@Override
    public MemberDTO getLatestMember() {

        return this.sqlSession.selectOne("LatestMember");
    }

}
