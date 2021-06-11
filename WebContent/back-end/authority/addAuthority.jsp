<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.authority.model.*"%>

<%
	AuthorityVO authorityVO = (AuthorityVO) request.getAttribute("authorityVO"); //EmpServlet.java(Concroller), �s�Jreq��authorityVO����
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>���u��Ʒs�W - addAuthority.jsp</title>

<style>
table#table-1 {
	background-color: #CCCCFF;
	border: 2px solid black;
	text-align: center;
}

table#table-1 h4 {
	color: red;
	display: block;
	margin-bottom: 1px;
}

h4 {
	color: blue;
	display: inline;
}
</style>

<style>
table {
	width: 450px;
	background-color: white;
	margin-top: 1px;
	margin-bottom: 1px;
}

table, th, td {
	border: 0px solid #CCCCFF;
}

th, td {
	padding: 1px;
}
</style>

</head>
<body bgcolor='white'>

	<table id="table-1">
		<tr>
			<td>
				<h3>�v����Ʒs�W - addAuthority.jsp</h3>
			</td>
			<td>
				<h4>
					<a href="select_page.jsp">�^����</a>
				</h4>
			</td>
		</tr>
	</table>

	<h3>��Ʒs�W:</h3>

	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color: red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color: red">${message}</li>
			</c:forEach>
		</ul>
	</c:if>

	<FORM METHOD="post" ACTION="authority.do" name="form1">
		<table>
			<tr>
				<td>���u�s��:</td>
				<td><input type="TEXT" name="empno" size="45"
					value="<%=(authorityVO == null) ? "1" : authorityVO.getEmpno()%>" /></td>
			</tr>
			<tr>
				<td>�v���s��:</td>
				<td><input type="TEXT" name="function_no" size="45"
					value="<%=(authorityVO == null) ? "1" : authorityVO.getFunction_no()%>" /></td>
			</tr>
			<tr>
				<td>�b¾���A:</td>
				<td>
				<input type="radio" name="status" value="Y" checked>�ҥ�
				<input type="radio" name="status" value="N">�U�[
				</td>
			</tr>

		</table>
		<br> <input type="hidden" name="action" value="insert"> <input
			type="submit" value="�e�X�s�W">
	</FORM>
</body>
</html>