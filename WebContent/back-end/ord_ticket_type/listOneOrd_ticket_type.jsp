<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.ord_ticket_type.model.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%
  Ord_ticket_typeVO ord_ticket_typeVO = (Ord_ticket_typeVO) request.getAttribute("ord_ticket_typeVO"); //Tikcet_typeServlet.java(Concroller), �s�Jreq��theaterVO����
%>

<html>
<head>
<title>�q�沼�ظ�� - listOneOrd_tikcet_type.jsp</title>

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
	width: 700px;
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
		 <h3>�q�沼�ظ�� - ListOneTikcet_type.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/ord_ticket_type/select_page.jsp"><img src="/CEA103G3/back-end/theater/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

<table>
	<tr>
		<th>�q��s��</th>
		<th>���ؽs��</th>
		<th>���ؼƶq</th>
		<th>���ػ���</th>
	</tr>
	
	<tr>
			<td>${ord_ticket_typeVO.order_no}</td>
			<td>${ord_ticket_typeVO.ticket_type_no}</td>
			<td>${ord_ticket_typeVO.ticket_count}</td>
			<td>${ord_ticket_typeVO.price}</td>
	</tr>
</table>
	
</body>
</html>