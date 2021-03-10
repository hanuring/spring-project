package com.project.model;

import java.util.List;

public interface RegistDAO {
	
	public int registClass(RegistDTO dto);
	public Integer checkRegist(RegistDTO dto);
	public List<Integer> checkWish(int mem_no_fk);
	public List<Integer> checkReg(int mem_no_fk);
	
	// 210214 이호철 추가
	public RegistDTO checkReg2(int mem_no_fk, int lec_no_fk);
	// 210217 이호철 수정
	public int deleteRegist(int mem_no_fk);
}
