package com.project.model;

import java.util.List;

public interface HotDAO {
	
	public List<HotDTO> getHotList();
	public List<HotDTO> getAllList();
	public HotDTO getOneList(int lec_no);
	
	// 210203 이호철 추가 전부 뽑기 
	public List<HotDTO> getAllLikeList();
	
	// 0209 추가
	public List<HotDTO> getOpenList();
	public List<HotDTO> getNewList();
	
}
