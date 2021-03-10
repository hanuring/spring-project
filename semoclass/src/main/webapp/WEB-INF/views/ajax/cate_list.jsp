<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.*"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="javax.xml.ws.RequestWrapper"%>
<%@page import="java.text.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.project.model.*" %>
<%@ page import="org.json.*" %>


<%
	
	List<LectureDTO> list = (List<LectureDTO>)request.getAttribute("Mid_Cate_list");
	String cate_name = (String)request.getAttribute("cate_name");
	List<MemberDTO> mlist = (List<MemberDTO>)request.getAttribute("Member_list");
	List<HotDTO> hlist = (List<HotDTO>)request.getAttribute("All_list_for_like");
	JSONArray jsonArray = new JSONArray();
	
	Date now = new Date();
	
	
	for(int i = 0 ; i < list.size(); i++){
		JSONObject obj = new JSONObject();
		LectureDTO dto = list.get(i);
		obj.put("lec_no", dto.getLec_no());
		obj.put("cate_fk", dto.getCate_fk());
		obj.put("lec_level", dto.getLec_level());
		obj.put("lec_thumbnail", dto.getLec_thumbnail());
		obj.put("lec_name", dto.getLec_name());
		obj.put("lec_amount", dto.getLec_amount());
		obj.put("lec_possible", dto.getLec_possible());
		obj.put("lec_tool", dto.getLec_tool());
		obj.put("lec_explain", dto.getLec_explain());
		obj.put("lec_date", dto.getLec_date());
		obj.put("lec_price", dto.getLec_price());
		obj.put("lec_hit", dto.getLec_hit());
		obj.put("lec_startdate", dto.getLec_startdate());
		obj.put("lec_enddate", dto.getLec_enddate());
		obj.put("lec_refund", dto.getLec_refund());
		obj.put("lec_member", dto.getLec_member());
		obj.put("mem_no_fk", dto.getMem_no_fk());
		obj.put("cate_name", cate_name);
		// all like 개수 가져와야 하고 alldislike 개수 가져와야함 %도
		for(int j = 0 ; j < hlist.size(); j ++){
			if(dto.getLec_no() == hlist.get(j).getLec_no()){
				obj.put("like_num", hlist.get(j).getAll_pref_like());
				obj.put("dislike_num", hlist.get(j).getAll_pref_dislike());
				if(hlist.get(j).getAll_pref_dislike() == 0 && hlist.get(j).getAll_pref_like() == 0){
					obj.put("percent", 0);
				} else{
					int percent = (hlist.get(j).getAll_pref_like())*100/(hlist.get(j).getAll_pref_dislike() + hlist.get(j).getAll_pref_like());
					obj.put("percent", percent);
				}
			}
		}
		// 멤버이름 가져오기
		for(int k=0; k<mlist.size(); k ++){
			if(dto.getLec_member().equals(mlist.get(k).getMember_id())){
				obj.put("member_name", mlist.get(k).getMember_name());
			}
		}
		// stratdate enddate 사이에 현재 날짜가 들어있는지 체크
// 		System.out.println(dto.getLec_name()+"시작 >>> " +dto.getLec_startdate().substring(0,10));
// 		System.out.println(dto.getLec_name()+"끝 >>> " +dto.getLec_enddate().substring(0,10));
		SimpleDateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
		
		int compare, compare1, compare2;
		Date startDate=null , endDate= null;
		// start & end date를 Date 타입으로 형변환
		startDate = format1.parse(dto.getLec_startdate().substring(0,10));
		endDate = format1.parse(dto.getLec_enddate().substring(0,10));
		// 확인
// 		System.out.println(dto.getLec_name() + " 시작 날짜 >>>"+ startDate);		
// 		System.out.println(dto.getLec_name() + " 마감 날짜 >>>"+ endDate);		
		
		compare1 = now.compareTo(startDate);
// 		System.out.println(dto.getLec_name() + " 현재시간을 시작날짜로 비교 >>>"+ compare1);		
		compare2 = now.compareTo(endDate);
// 		System.out.println(dto.getLec_name() + " 현재시간을 마감날짜로 비교 >>>"+ compare2);		
		
		if(compare1 == -1 ){
			obj.put("compare", 0); // 오픈예정
		} else if(compare1 == 1 && compare2 == -1){
			obj.put("compare", 1); // 바로수강가능
		} else if(compare1 == 1 && compare2 == 1){
			obj.put("compare", 2); // 마감된 강의
		}
		jsonArray.add(obj);		
	}

	out.println(jsonArray);
%>