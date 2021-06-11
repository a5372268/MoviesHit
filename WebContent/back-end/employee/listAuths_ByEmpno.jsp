<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.authority.model.*"%>
<%@ page import="com.function.model.*"%>
<%@ page import="com.employee.model.*"%>

<%-- <% --%>
<!-- // 	FunctionService functionSvc1 = new FunctionService(); -->
<!-- // 	System.out.println(functionSvc1.getOneFunction(12).getFunction_desc()); -->

<%-- %> --%>

<%-- <jsp:useBean id="listAuths_ByEmpno" scope="request" type="java.util.Set<AuthorityVO>" /> <!-- ��EL����i�ٲ� --> --%>
<jsp:useBean id="authoritytSvc" scope="page" class="com.authority.model.AuthorityService" />
<jsp:useBean id="functionSvc" scope="page" class="com.function.model.FunctionService" />
<jsp:useBean id="employeeSvc" scope="page" class="com.employee.model.EmployeeService" />


<html>
<head><title>�������u - listAuths_ByEmpno.jsp</title>

<style>
  table#table-2 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-2 h4 {
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
	width: 800px;
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


<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<table>
<tr>
<th>���u�G<font color="blue">${employeeSvc.getOneEmp(empno).empname} </font> �v���C��</th>
</tr>
</table>

 <table>
	<tr>
		<th>�\��s�� </th>
		<th>�\��W��</th>
		<th>�v�����A</th>
<!-- 		<th>�ק�</th> -->
<!-- 		<th>�R��</th> -->
	</tr>
	
	<c:forEach var="authorityVO" items="${listAuths_ByEmpno}" >
		<tr>
			<td>${authorityVO.function_no}</td>
			<td>${functionSvc.getOneFunction(authorityVO.function_no).function_desc}</td>
			<td>
			<c:if test="${authorityVO.auth_status eq 'Y'}">
			<font color="red"><b>${authorityVO.auth_status}</b></font>
			</c:if>
			<c:if test="${authorityVO.auth_status eq 'N'}">
			<font color="black">${authorityVO.auth_status}</font>
			</c:if>
			</td>
<%-- 			<td><c:forEach var="deptVO" items="${deptSvc.all}"> --%>
<%--                     <c:if test="${authorityVO.deptno==deptVO.deptno}"> --%>
<%-- 	                    ${deptVO.deptno}�i<font color=orange>${deptVO.dname}</font> - ${deptVO.loc}�j --%>
<%--                     </c:if> --%>
<%--                 </c:forEach> --%>
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" style="margin-bottom: 0px;"> --%>
<!-- 			    <input type="submit" value="�ק�">  -->
<%-- 			    <input type="hidden" name="empno"      value="${authorityVO.empno}"> --%>
<%-- 			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  --> --%>
<!-- 			    <input type="hidden" name="action"	   value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/emp/emp.do" style="margin-bottom: 0px;"> --%>
<!-- 			    <input type="submit" value="�R��"> -->
<%-- 			    <input type="hidden" name="empno"      value="${authorityVO.empno}"> --%>
<%-- 			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--> --%>
<!-- 			    <input type="hidden" name="action"     value="delete"></FORM> -->
<!-- 			</td> -->
		</tr>
	</c:forEach>
</table>

<!-- <br>�����������|:<br><b> -->
<%--    <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br> --%>
<%--    <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b> --%>

</body>
</html>