/*
 *  1. �U�νƦX�d��-�i�ѫȤ���H�N�W�����Q�d�ߪ����
 *  2. ���F�קK�v�T�į�:
 *     �ҥH�ʺA���͸U��SQL������,���d�ҵL�N�ĥ�MetaData���覡,�]�u�w��ӧO��Table�ۦ���ݭn�ӭӧO�s�@��
 * */


package jdbc.util.CompositeQuery;

import java.util.*;

public class jdbcUtil_CompositeQuery_Relationship {

	public static String get_aCondition_For_myDB(String columnName, String value) {

		String aCondition = null;
		if ("member_no".equals(columnName) || "friend_no".equals(columnName)) // �Ω��L
			aCondition = "S0." + columnName + "=" + value;
		else if ("status".equals(columnName) || "isblock".equals(columnName)) // �Ω�varchar
			aCondition = "S0." + columnName + " = " + value;
//		else if ("status".equals(columnName) || "isblock".equals(columnName)) // �Ω�varchar
//			aCondition = "S0." + columnName + " like '%" + value + "%'";
		else if ("mb_name".equals(columnName) ) // �Ω�varchar
			aCondition = getDisassembledCondition("S2", columnName, value);
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
		map.put("member_no", new String[] { "6" });
//		map.put("friend_no", new String[] { "2" });
		map.put("status", new String[] { "0" });
		map.put("isblock", new String[] { "0" });
		map.put("action", new String[] { "getXXX" }); // �`�NMap�̭��|�t��action��key
		map.put("mb_name", new String[] { "�պ뤧�P" }); // �`�NMap�̭��|�t��action��key

		String finalSQL = "select S0.MEMBER_NO, S1.MB_NAME, S0.FRIEND_NO,"
				+ "S2.MB_NAME, S0.STATUS, S0.ISBLOCK from relationship S0 "
				+ "LEFT JOIN `MEMBER` S1 ON S0.MEMBER_NO = S1.MEMBER_NO "
				+ "LEFT JOIN `MEMBER` S2 ON S0.FRIEND_NO = S2.MEMBER_NO "
				+ jdbcUtil_CompositeQuery_Relationship.get_WhereCondition(map)
				+ "order by S0.member_no, S0.friend_no";
		System.out.println("����finalSQL = " + finalSQL);

	}
}
