package com.project.model;

import lombok.Data;

@Data
public class MemberDTO {

	private int member_no;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private String member_birth;
	private String member_category;
	private String member_grade;
	private int member_state;
	
}
