package com.theater.model;

import java.util.List;

public interface TheaterDAO_interface {
	public void insert(TheaterVO theaterVO);
	public void update(TheaterVO theaterVO);
	public void delete(Integer theater_no);
	public TheaterVO findByPrimaryKey(Integer theater_no);
	public List<TheaterVO> getAll();
//	public TheaterVO findSeat_no(Integer theater_no);
	 //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<Theater> getAll(Map<String, String[]> map);
}
