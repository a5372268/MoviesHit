/*
 *  1. �U�νƦX�d��-�i�ѫȤ���H�N�W�����Q�d�ߪ����
 *  2. ���F�קK�v�T�į�:
 *     �ҥH�ʺA���͸U��SQL������,���d�ҵL�N�ĥ�MetaData���覡,�]�u�w��ӧO��Table�ۦ���ݭn�ӭӧO�s�@��
 * */


package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_Group {

	public static String get_aCondition_For_myDB(String columnName, String value) {
		String aCondition = null;
		// �Ω��L
		if ("group_no".equals(columnName) || "showtime_no".equals(columnName) || 
				"member_no".equals(columnName) || "required_cnt".equals(columnName) ||
				 "member_cnt".equals(columnName)) 
			aCondition = "S0." + columnName + "=" + value;
		// �Ω�varchar
		else if ("group_title".equals(columnName) ) 
			aCondition = getDisassembledCondition("S0", columnName, value);
		//for �䥦DB  �� date
		else if ("crt_dt".equals(columnName) || "modify_dt".equals(columnName)|| "deadline_dt".equals(columnName))                          // �Ω�date
			aCondition = "S0." + columnName + "=" + "'"+ value +"'";   
		else if ("mb_name".equals(columnName))                         
//			aCondition = "S3." + columnName + "=" + "'"+ value +"'";      
			aCondition = getDisassembledCondition("S3", columnName, value);
		else if ("movie_name".equals(columnName) )                          
			aCondition = "S2." + columnName + "=" + "'"+ value +"'"; 
		else if ("showtime_time".equals(columnName))                          // �Ω�date
			aCondition = "DATE(S1." + columnName + ") =" + "DATE('"+ value +"')";   
		else if ("category".equals(columnName))            // �Ω�category
			aCondition = getDisassembledCondition("S2", columnName, value);
		
		//for Oracle �� date
		//aCondition = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";  
		return aCondition + " ";
	}

	public static String get_WhereCondition(Map<String, String[]> map) {
		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {
			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& !"action".equals(key)) {
				count++;
				String aCondition = get_aCondition_For_myDB(key, value.trim());

				if (count == 1)
					whereCondition.append(" where " + aCondition);
				else
					whereCondition.append(" and " + aCondition);

				System.out.println("���e�X�d�߸�ƪ�����count = " + count);
			}
		}

		return whereCondition.toString();
	}
	
	public static String getDisassembledCondition(String tableAlias, String columnName, String str) {
		String tmpStr = "(";
		tableAlias += ".";
		for (int i = 0 ; i < str.length(); i++) {
			tmpStr += tableAlias + columnName + " like '%" + str.charAt(i) + "%'";
			tmpStr = ( i == (str.length()-1) )? tmpStr : tmpStr+" or ";
			System.out.println("tmpStr = " + tmpStr);
		}
		tmpStr += ")";
		return tmpStr;
	}
	


	public static void main(String argv[]) {

		// �t�X req.getParameterMap()��k �^�� java.util.Map<java.lang.String,java.lang.String[]> ������
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("group_no", new String[] { "1" });
		map.put("member_no", new String[] { "3" });
		map.put("showtime_no", new String[] { "1" });
		map.put("group_title", new String[] { "���_��" });
		map.put("required_cnt", new String[] { "2" });
		map.put("member_cnt", new String[] { "2" });
		map.put("group_status", new String[] { "1" });
		map.put("crt_dt", new String[] { "2021-03-27 00:00:00" });
		map.put("modify_dt", new String[] { "2021-03-28 00:00:00" });
		map.put("deadline_dt", new String[] { "2021-03-31 00:00:00" });
		map.put("action", new String[] { "getXXX" }); // �`�NMap�̭��|�t��action��key

		String finalSQL = 
				"select S0.GROUP_NO, S0.SHOWTIME_NO,S0.MEMBER_NO, S3.MB_NAME, "
				+ "S1.SHOWTIME_TIME, S1.MOVIE_NO, S2.MOVIE_NAME, "
				+ " S0.GROUP_TITLE, S0.REQUIRED_CNT, S0.MEMBER_CNT, S0.GROUP_STATUS, "
				+ "S0.`DESC`, S0.CRT_DT, S0.MODIFY_DT, S0.DEADLINE_DT "
				+ "from `group` S0 "
				+ "LEFT JOIN SHOWTIME S1 ON S0.SHOWTIME_NO = S1.SHOWTIME_NO "
				+ "LEFT JOIN MOVIE S2 ON S1.MOVIE_NO = S2.MOVIE_NO "
				+ "LEFT JOIN `MEMBER` S3 ON S0.MEMBER_NO = S3.MEMBER_NO "
				+ jdbcUtil_CompositeQuery_Group.get_WhereCondition(map)
				+ " order by group_no";
		System.out.println("����finalSQL = " + finalSQL);
	}
}
