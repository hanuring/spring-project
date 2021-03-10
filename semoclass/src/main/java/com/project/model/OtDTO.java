package com.project.model;

import lombok.Data;

@Data
public class OtDTO {

    private int ot_no;
    private int lec_no_fk;
    private String ot_src;
    private String ot_title;
    private String ot_summary;
    private String ot_notice;

}