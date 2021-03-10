package com.project.model;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class OtDAOImpl implements OtDAO {

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
   public OtDTO getOtCont(int no) {
      
      return sqlSession.selectOne("otCont", no);
   }
   
   @Override
    public int inserOt(OtDTO dto) {

        return sqlSession.insert("otVideo", dto);
    }

   @Override
   public int checkOtData(int lec_no) {
      // TODO Auto-generated method stub
      
      return sqlSession.update("ckOtData", lec_no);
   }

   @Override
   public OtDTO getOtContByLecNo(int lec_no) {
      // TODO Auto-generated method stub
      return this.sqlSession.selectOne("otContByLecNo", lec_no);
   }

   @Override
   public int updateOt(OtDTO dto) {
      // TODO Auto-generated method stub
      return this.sqlSession.update("OtUpdate", dto);
   }

   @Override
   public int deleteOt(int lec_no) {
      // TODO Auto-generated method stub
      return this.sqlSession.delete("OtDelete", lec_no);
   }
   
}