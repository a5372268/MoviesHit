package com.reply.model;

import java.util.*;


public interface ReplyDAO_interface {
    public void insert(ReplyVO replyVO);
    public void update(ReplyVO replyVO);
    public void delete(Integer replyVO);
    public ReplyVO findByPrimaryKey(Integer replyno);
    public List<ReplyVO> getAll();
   
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
    public List<ReplyVO> getAll(Map<String, String[]> map); 
}
