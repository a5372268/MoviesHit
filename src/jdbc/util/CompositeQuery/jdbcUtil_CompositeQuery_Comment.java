/*
 *  1. �U�νƦX�d��-�i�ѫȤ���H�N�W�����Q�d�ߪ����
 *  2. ���F�קK�v�T�į�:
 *     �ҥH�ʺA���͸U��SQL������,���d�ҵL�N�ĥ�MetaData���覡,�]�u�w��ӧO��Table�ۦ���ݭn�ӭӧO�s�@��
 * */


package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_Comment {

	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;

		if ("COMMENT_NO".equals(columnName) || "MEMBER_NO".equals(columnName) || "MOVIE_NO".equals(columnName)) // �Ω��L
			aCondition = columnName + "=" + value;
		else if ("CONTENT".equals(columnName) || "STATUS".equals(columnName)) // �Ω�varchar
			aCondition = columnName + " like '%" + value + "%'";
		else if ("CRT_DT".equals(columnName) || "MODIFY_DT".equals(columnName))         // �Ω�date
			aCondition = columnName + "=" + "'"+ value +"'";                          //for �䥦DB  �� date
//		    aCondition = "to_char(" + columnName + ",'yyyy-mm-dd')='" + value + "'";  //for Oracle �� date
		
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

	public static void main(String argv[]) {

		// �t�X req.getParameterMap()��k �^�� java.util.Map<java.lang.String,java.lang.String[]> ������
		Map<String, String[]> map = new TreeMap<String, String[]>();
		map.put("COMMENT_NO", new String[] { "1" });
		map.put("MEMBER_NO", new String[] { "1" });
		map.put("MOVIE_NO", new String[] { "1" });
		map.put("CONTENT", new String[] { "cool" });
		map.put("CRT_DT", new String[] { "1981-11-17" });
		map.put("MODIFY_DT", new String[] { "1981-11-17" });
		map.put("STATUS", new String[] { "1" });
		map.put("action", new String[] { "getXXX" }); // �`�NMap�̭��|�t��action��key

		String finalSQL = "select * from COMMENT "
				          + jdbcUtil_CompositeQuery_Comment.get_WhereCondition(map)
				          + "order by COMMENT_NO";
		System.out.println("����finalSQL = " + finalSQL);

	}
}
