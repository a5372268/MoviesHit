package com.rating.model;

import java.util.*;

public interface RatingDAO_interface {
	
	public void insert(RatingVO ratingVO);
    public void update(RatingVO ratingVO);
    public void delete(Integer memberno , Integer movieno);
    public RatingVO findByPrimaryKey(Integer memberno, Integer movieno);
    public List<RatingVO> findByMovieNo(Integer movieno);
    public List<RatingVO> getAllByMovieNo();
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<RatingVo> getAll(Map<String, String[]> map); 
    public void insertOrUpdateRatingtAndUpdateMovieRating (RatingVO ratingVO);
    public RatingVO getThisMovieToatalRating (Integer movieno);

    

}
