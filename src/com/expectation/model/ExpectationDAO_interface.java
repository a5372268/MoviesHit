package com.expectation.model;

import java.util.*;

import com.rating.model.RatingVO;

public interface ExpectationDAO_interface {
	
	public void insert(ExpectationVO expectationVO);
    public void update(ExpectationVO expectationVO);
    public void delete(Integer memberno , Integer movieno);
    public ExpectationVO findByPrimaryKey(Integer memberno, Integer movieno);
    public List<ExpectationVO> findByMovieNo(Integer movieno);
    public List<ExpectationVO> getAllByMovieNo();
    //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<ExpectationVo> getAll(Map<String, String[]> map); 
    public void insertOrUpdateExpectationAndUpdateMovieExpectation (ExpectationVO expectationVO);
    public ExpectationVO getThisMovieToatalExpectation (Integer movieno);

    

}
