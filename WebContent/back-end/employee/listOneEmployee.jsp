<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.employee.model.*"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  EmployeeVO employeeVO = (EmployeeVO) request.getAttribute("employeeVO"); //EmpServlet.java(Concroller), �s�Jreq��employeeVO����
%>

<html>
<head>
<title>���u��� - listOneEmployee.jsp</title>

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
	width: 1000px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>���u��� - ListOneEmployee.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>���u�s��</th>
		<th>���u�m�W</th>
		<th>���u�K�X</th>
		<th>�ʧO</th>
		<th>�q��</th>
		<th>�q�l�l��</th>
		<th>¾��</th>
		<th>���Τ��</th>
		<th>��¾���</th>
		<th>�b¾���A</th>
	</tr>
	<tr>
		<td><%=employeeVO.getEmpno()%></td>
		<td><%=employeeVO.getEmpname()%></td>
		<td><%=employeeVO.getEmppwd()%></td>
		<td><%=employeeVO.getGender()%></td>
		<td><%=employeeVO.getTel()%></td>
		<td><%=employeeVO.getEmail()%></td>
		<td><%=employeeVO.getTitle()%></td>
		<td><%=employeeVO.getHiredate()%></td>
		<td><%=employeeVO.getQuitdate()%></td>
		<td><%=employeeVO.getStatus()%></td>
	</tr>
</table>

</body>
</html>