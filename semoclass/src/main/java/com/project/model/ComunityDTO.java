package com.project.model;

import lombok.Data;

@Data
public class ComunityDTO {
	private int comu_no;
	private String comu_cont;
	private int mem_no_fk;
	private int lec_no_fk;
	private String comu_date;
}
