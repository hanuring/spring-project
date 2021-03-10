package com.project.model;

import lombok.Data;

@Data
public class ComunityVO {
	private int comu_no;
	private String comu_cont;
	private int mem_no_fk;
	private int lec_no_fk;
	private String comu_date;
	private String member_name;
}
