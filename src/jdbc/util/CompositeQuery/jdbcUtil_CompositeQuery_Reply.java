/*
 *  1. �U�νƦX�d��-�i�ѫȤ���H�N�W�����Q�d�ߪ����
 *  2. ���F�קK�v�T�į�:
 *     �ҥH�ʺA���͸U��SQL������,���d�ҵL�N�ĥ�MetaData���覡,�]�u�w��ӧO��Table�ۦ���ݭn�ӭӧO�s�@��
 * */


package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_Reply {

	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;
		if ("reply_no".equals(columnName) || "member_no".equals(columnName) || "status".equals(columnName) || "article_no".equals(columnName)) // �Ω��L
			aCondition = columnName + "=" + value;
		else if ("content".equals(columnName)) // �Ω�varchar
			aCondition = columnName + " like '%" + value + "%'";
		else if ("crt_dt".equals(columnName) || "modify_dt".equals(columnName))                          // �Ω�date
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
		map.put("reply_no", new String[] { "2" });
		map.put("article_no", new String[] { "1" });
		map.put("member_no", new String[] { "3" });
		map.put("content", new String[] { "�i" });
		map.put("crt_dt", new String[] { "2021-4-26" });
		map.put("modify_dt", new String[] { "2021-4-26" });
		map.put("status", new String[] { "0" });
		map.put("action", new String[] { "getXXX" }); // �`�NMap�̭��|�t��action��key

		String finalSQL = "select * from reply "
				          + jdbcUtil_CompositeQuery_Reply.get_WhereCondition(map)
				          + "order by replyno";
		System.out.println("����finalSQL = " + finalSQL);

	}
}
