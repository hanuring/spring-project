package com.project.model;

import lombok.Data;

@Data
public class SearchDTO {
	private String hot_search_field;
	private String hot_search_keyword;
	private int hot_search_hit;
}
