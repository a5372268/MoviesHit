package com.report_group.model;

import java.util.*;

import com.group_member.model.Group_MemberVO;

public interface Report_GroupDAO_interface {
          public void insert(Report_GroupVO report_groupVO);
          public void update(Report_GroupVO report_groupVO);
          public void delete(Integer report_no);
          public Report_GroupVO findByPrimaryKey(Integer report_no);
          public List<Report_GroupVO> getAll();

          //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
          
        //�d�߬Y���A�����|(�^�� Set)
	      public Set<Report_GroupVO> getReportsByStatus(String status);
          
          
//        public List<EmpVO> getAll(Map<String, String[]> map); 
}
