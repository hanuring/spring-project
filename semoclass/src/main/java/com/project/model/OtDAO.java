package com.project.model;

public interface OtDAO {

   OtDTO getOtCont(int no);
   
   int inserOt(OtDTO dto);
   int checkOtData(int lec_no);
   OtDTO getOtContByLecNo(int lec_no);
   int updateOt(OtDTO dto);
   int deleteOt(int lec_no);
   
}