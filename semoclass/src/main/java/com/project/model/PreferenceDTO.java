package com.project.model;

import lombok.Data;

@Data
public class PreferenceDTO {
	private int pref_no;
	private int mem_no_fk;
	private int lec_no_fk;
	private int pref_like;
	private int pref_dislike;
}
 