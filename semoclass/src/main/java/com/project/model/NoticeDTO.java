package com.project.model;

import lombok.Data;

@Data
public class NoticeDTO {
	private int notice_no;
	private String notice_title;
	private String notice_cont;
	private int notice_hit;
	private int mem_no_fk;
	private String notice_date;
	private String notice_file;
}
