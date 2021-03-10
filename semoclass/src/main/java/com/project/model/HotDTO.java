package com.project.model;

import lombok.Data;

@Data
public class HotDTO {

	private int lec_no;
	private int cate_fk;
	private String lec_thumbnail;
	private String lec_name;
	private String lec_possible;
	private String lec_date;
	private int lec_price;
	private String lec_startdate;
	private String lec_enddate;
	private String lec_member;
	private int all_pref_like;
	private int all_pref_dislike;
	
	
}
