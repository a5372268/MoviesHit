package com.ord_food.model;

import java.util.List;

public interface Ord_foodDAO_interface {
	public void insert(Ord_foodVO ord_foodVO);
	public void update(Ord_foodVO ord_foodVO);
	public void delete(Integer order_no, Integer food_no);
	public Ord_foodVO findByPrimaryKey(Integer order_no, Integer food_no);
	public List<Ord_foodVO> getAll();
	 //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<Theater> getAll(Map<String, String[]> map);
	public void insert2(Ord_foodVO ord_foodVO , java.sql.Connection con);
	public List<Ord_foodVO> getAllFoodByOrderno(Integer order_no);
	
}
