<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.message.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
	MessageVO messageVO = (MessageVO) request.getAttribute("messageVO"); //MessageServlet.java(Concroller), �s�Jreq��messageVO����
%>
<%-- <jsp:useBean id="messageVO" scope="request" class="com.message.model.MessageVO"></jsp:useBean> --%>
<html>
<head>
<title>�T����� - listOneMessage.jsp</title>

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
	width: 600px;
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

<table id="table-1">
	<tr><td>
		 <h3>�T����� - ListOneMessage.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/front-end/message/select_page.jsp"><img src="<%=request.getContextPath()%>/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�T���s��</th>
		<th>FROM</th>
		<th>TO</th>
		<th>�T�����e</th>
		<th>�T���ɶ�</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<tr>
		<td><%=messageVO.getMessage_no()%></td>
		<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
			<td>${memSvc.getOneMem(messageVO.from_member_no).mb_name}</td>
			<td>${memSvc.getOneMem(messageVO.to_member_no).mb_name}</td>
		<td><%=messageVO.getMessage_content()%></td>
		<td><%=messageVO.getMessage_time()%></td>

<!-- 	<tr> -->
<%-- 	<td><%=messageVO.getMessage_no()%></td> --%>
<%-- 		<td><c:out value="<%=messageVO.getFrom_member_no() %>" default="default" /></td> --%>
<%-- 		<td><c:out value="${messageVO.to_member_no}" /></td> --%>
<%-- 		<td>${messageVO.message_content}</td> --%>
<%-- 		<td>${messageVO.message_time}</td> --%>
<!-- 	</tr> -->

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/message/message.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="message_no" value="${messageVO.message_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/message/message.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="message_no"  value="${messageVO.message_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
</table>

</body>
</html>