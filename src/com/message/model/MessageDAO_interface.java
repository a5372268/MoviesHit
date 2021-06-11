package com.message.model;

import java.util.*;

public interface MessageDAO_interface {
          public void insert(MessageVO messageVO);
          public void update(MessageVO messageVO);
          public void delete(Integer message_no);
          public MessageVO findByPrimaryKey(Integer message_no);
          public List<MessageVO> getAll();
          //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//        public List<EmpVO> getAll(Map<String, String[]> map); 
}
