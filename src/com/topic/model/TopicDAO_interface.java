package com.topic.model;

import java.util.List;
import java.util.Set;

import com.article.model.ArticleVO;

public interface TopicDAO_interface {
    public void insert(TopicVO topicVO);
    public void update(TopicVO topicVO);
    public void delete(Integer topicVO);
    public TopicVO findByPrimaryKey(Integer topicVO);
    public List<TopicVO> getAll();
    
	public Set<ArticleVO> getArticlesByTopicno(Integer topicno);//�@��h
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<TopicVO> getAll(Map<String, String[]> map); 

}
