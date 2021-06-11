package com.article.model;

import java.sql.Connection;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.article.model.ArticleVO;
import com.like.model.LikeVO;
import com.reply.model.ReplyVO;

public interface ArticleDAO_interface {
    public void insert(ArticleVO articleVO);
    public void update(ArticleVO articleVO);
    public void delete(Integer articleno);
    public ArticleVO findByPrimaryKey(Integer articleno);
    public List<ArticleVO> getAll();
    public List<ArticleVO> getArticleLikeCount();
    
    public Set<ReplyVO> getReplysByArticleno(Integer articleno); // �@��h
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<ArticleVO> getAll(Map<String, String[]> map); 
	
	void subtractArticleLike(int articleno, Connection con);
	void addArticleLike(int articleno, Connection con);
	public List<ArticleVO> getAll(Map<String, String[]> map);
	public Set<LikeVO> getLikesByArticle(Integer articleno);
	
	
	
	
	
}
