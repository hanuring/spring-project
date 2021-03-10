package com.project.model;

import lombok.Data;

@Data
public class ReplyVO {
	private int reply_no;
	private String reply_cont;
	private int lec_no_fk;
	private int mem_no_fk;
	private String reply_date;
	private int reply_group;
	private int reply_step;
	private String mem_name;
	private int member_state;
}
