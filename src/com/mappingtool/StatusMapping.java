package com.mappingtool;

public class StatusMapping {
	
	public StatusMapping() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public String dboGroup_GroupStatus(String group_status){
	        String resultString;
	        if("0".equals(group_status))
	        	resultString = "���Τ�";
	        else if ("1".equals(group_status))
	        	resultString = "�T�w�X��!���ݹέ��I�ڤ�";
	        else if("2".equals(group_status))
	        	resultString = "���`�X�ΡA����";
	        else if("3".equals(group_status))
	        	resultString = "���󥢱ѡA����";
	        else
	        	resultString = "���������Ϊ��A";
		return resultString;
	}
	
	public String dboGroup_Member_Pay_Status(String pay_status){
        String resultString;
        if("0".equals(pay_status))
        	resultString = "���I��";
        else if ("1".equals(pay_status))
        	resultString = "�w�I��";
        else
        	resultString = "�������I�ڪ��A";
	return resultString;
	}
	
	
	public String dboGroup_Member_Status(String status){
        String resultString;
        if("0".equals(status))
        	resultString = "�h�X";
        else if ("1".equals(status))
        	resultString = "�w�[�J";
        else
        	resultString = "�������έ����A";
	return resultString;
	}
	
	
	public String dboReport_Group_Status(String status){
        String resultString;
        if("0".equals(status))
        	resultString = "���B�z";
        else if ("1".equals(status))
        	resultString = "�w�B�z";
        else if ("2".equals(status))
        	resultString = "�B�z���q�L";
        else
        	resultString = "���������|���A";
	return resultString;
	}
	
	
	public String dboRelationship_Status(String status){
        String resultString;
        if("0".equals(status))
        	resultString = "�U�u";
        else if ("1".equals(status))
        	resultString = "�W�u";
        else if ("2".equals(status))
        	resultString = "�e�X�ШD�|���Q�P�N";
        else
        	resultString = "�������n�ͪ��A";
	return resultString;
	}
	
	
	public String dboRelationship_IsBlock(String isBlock){
        String resultString;
        if("0".equals(isBlock))
        	resultString = "������";
        else if ("1".equals(isBlock))
        	resultString = "�w����";
        else
        	resultString = "���������ꪬ�A";
	return resultString;
	}
	public String dboOrderStatus(String orderStatus){
		String resultString;
		if("0".equals(orderStatus))
			resultString = "���I��";
		else if ("1".equals(orderStatus))
			resultString = "�w����";
		else if ("2".equals(orderStatus))
			resultString = "������";
		else 
			resultString = "�w����";
		return resultString;
	}
	public String dboOrderType(String orderType){
		String resultString;
		if("0".equals(orderType))
			resultString = "�H�Υd";
		else if ("1".equals(orderType))
			resultString = "�{��";
		else
			resultString = "�{���I��";
		return resultString;
	}
}
