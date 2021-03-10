package com.project.model;

import lombok.Data;

@Data
public class LectureDTO {
	
	private int lec_no;
	private int cate_fk;
	private String lec_level;
	private String lec_thumbnail;
	private String lec_name;
	private String lec_amount;
	private String lec_possible;
	private String lec_tool;
	private String lec_explain;
	private String lec_date;
	private int lec_price;
	private int lec_hit;
	private String lec_startdate;
	private String lec_enddate;
	private int lec_refund;
	private String lec_member;
	private int mem_no_fk;
	
	
	private int all_pref_like;
	private int all_pref_dislike;
	
}
