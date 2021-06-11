package com.ticket_type.model;

import java.util.List;

public interface Ticket_typeDAO_interface {
	public void insert(Ticket_typeVO ticket_typeVO);
	public void update(Ticket_typeVO ticket_typeVO);
	public void delete(Integer ticket_type_no);
	public Ticket_typeVO findByPrimaryKey(Integer ticket_type_no);
	public List<Ticket_typeVO> getAll();
	 //�U�νƦX�d��(�ǤJ�Ѽƫ��AMap)(�^�� List)
//  public List<Theater> getAll(Map<String, String[]> map);
}
