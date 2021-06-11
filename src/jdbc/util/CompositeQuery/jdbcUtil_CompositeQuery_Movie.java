/*
 *  1. �U�νƦX�d��-�i�ѫȤ���H�N�W�����Q�d�ߪ����
 *  2. ���F�קK�v�T�į�:
 *     �ҥH�ʺA���͸U��SQL������,���d�ҵL�N�ĥ�MetaData���覡,�]�u�w��ӧO��Table�ۦ���ݭn�ӭӧO�s�@��
 * */
package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_Movie {

	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;
		
		if ("MOVIE_NO".equals(columnName) || "LENGTH".equals(columnName)) // �Ω��L
			aCondition = columnName + "=" + value;
		else if (  //"MOVIE_NAME".equals(columnName) || 
				"DIRECTOR".equals(columnName) || "ACTOR".equals(columnName) 
				|| "CATEGORY".equals(columnName) || "STATUS".equals(columnName) || "TRAILOR".equals(columnName) 
				|| "EMBED".equals(columnName) || "GRADE".equals(columnName)) // �Ω�varchar
			aCondition = columnName + " like '%" + value + "%'";
		else if ("MOVIE_NAME".equals(columnName)){
			aCondition = getDisassembledCondition("S0", columnName, value);
		}
		else if ("MOVIE_NAME_INDEX".equals(columnName)){
			aCondition =getDisassembledCondition("S1", "IDX", value);
		}
		else if("RATING".equals(columnName))
			aCondition = columnName + " >= " +value;
		else if("EXPECTATION".equals(columnName))
			aCondition = columnName + " >= " +value;
		else if("PREMIERE_DT".equals(columnName))
			aCondition = columnName + " <= " + "'" + value + "' and OFF_DT >= '" + value + "'"; 
		else if("OFF_DT".equals(columnName))
			aCondition = "PREMIERE_DT <= '" + value + "' and " + columnName + " >= '" + value + "'"; 
//			aCondition = "'" +value + "'" +" between Premiere_dt and off_dt";        //for �䥦DB  �� date
		  //aCondition = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";  //for Oracle �� date
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
		
		for (int i = 0 ; i < str.length(); i++) {
			tmpStr += tableAlias+ "." + columnName + " like '%" + str.charAt(i) + "%'";
			tmpStr = ( i == (str.length()-1) )? tmpStr : tmpStr+" or ";
			
		}
		tmpStr += ")";
		return tmpStr;
	}
	
	public static String get_OnCondition(Map<String, String[]> map) {

		Set<String> keys = map.keySet();
		StringBuffer whereCondition = new StringBuffer();
		int count = 0;
		for (String key : keys) {

			String value = map.get(key)[0];
			if (value != null && value.trim().length() != 0	&& "MOVIE_NAME".equals(key)) {
				
				count++;
				String aCondition = get_aCondition_For_myDB("MOVIE_NAME_INDEX", value.trim());
				whereCondition.append(" and " + aCondition);
			}
		}
		return whereCondition.toString();
	}
	
	public static void main(String argv[]) {

		// �t�X req.getParameterMap()��k �^�� java.util.Map<java.lang.String,java.lang.String[]> ������
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("MOVIE_NO", new String[] { "999" });
//		map.put("MOVIE_NAME", new String[] { "�P�ڤj��" });
//		map.put("DIRECTOR", new String[] { "�d�ç�" });
//		map.put("ACTOR", new String[] { "�d�a��" });
//		map.put("CATEGORY", new String[] { "CRIME" });
//		map.put("LENGTH", new String[] { "90" });
//		map.put("STATUS", new String[] { "1" });
//		map.put("PREMIERE_DT", new String[] { "1981-11-17" });
//		map.put("OFF_DT", new String[] { "1991-11-17" });
//		map.put("TRAILOR", new String[] { "https://www.youtube.com/watch?v=vM-Bja2Gy04&t=1s" });
//		map.put("EMBED", new String[] { "https://www.youtube.com/watch?v=vM-Bja2Gy04&t=1s" });
//		map.put("GRADE", new String[] { "1" });
//		map.put("RATING", new String[] { "9.6" });
//		map.put("EXPECTATION", new String[] { "10" });
//		map.put("action", new String[] { "getXXX" }); // �`�NMap�̭��|�t��action��key

//				String finalSQL = "select * from MOVIE "
//				          + jdbcUtil_CompositeQuery_Movie.get_WhereCondition(map)
//				          + "order by MOVIE_NO";

		
		String finalSQL =
				"WITH B AS( "
			   +" select S0.MOVIE_NO,  COUNT(*) CNT from "
			   +" `movie` S0 LEFT JOIN MOVIE_NAME_INDEX S1 "
			   + " ON S0.MOVIE_NO = S1.MOVIE_NO "
			   + jdbcUtil_CompositeQuery_Movie.get_OnCondition(map)
			   + jdbcUtil_CompositeQuery_Movie.get_WhereCondition(map)
			   +" GROUP BY S0.MOVIE_NO "
			   + ") "			
			   + "select S0.* from movie S0 LEFT JOIN "
			   +" B ON S0.MOVIE_NO = B.MOVIE_NO "
			   + jdbcUtil_CompositeQuery_Movie.get_WhereCondition(map)
			   +" ORDER BY (CASE WHEN B.CNT IS NULL THEN 0 ELSE B.CNT END) DESC, S0.MOVIE_NO"
			   ;

		System.out.println("����finalSQL = " + finalSQL);
	
	}
}
