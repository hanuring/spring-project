package com.project.model;

import lombok.Data;

@Data
public class CategoryDTO {
	
	private int cate_code;
	private int cate_code_ref;
	private String cate_name;
	
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
	
	private int member_no;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_birth;
	private String member_category;
	private String member_grade;

}
