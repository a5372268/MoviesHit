<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ticket_type.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	Ticket_typeService ticket_typeSvc = new Ticket_typeService();
    List<Ticket_typeVO> list = ticket_typeSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<html>
<head>
<title>�Ҧ�������� - listAllTicket_type.jsp</title>

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

<h4>�����m�߱ĥ� EL ���g�k����:</h4>
<table id="table-1">
	<tr><td>
		 <h3>�Ҧ�������� - listAllTicket_type.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/ticket_type/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/theater/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>

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
		<th>���ؽs��</th>
		<th>����</th>
		<th>����</th>
		<th>���ػ���</th>
	</tr>
	<%@ include file="pages/page1.file" %> 
	<c:forEach var="ticket_typeVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${ticket_typeVO.ticket_type_no}</td>
			<td>
				<c:choose>
					<c:when test="${ticket_typeVO.ticket_type == 0 }">
						2D
					</c:when>
					<c:when test="${ticket_typeVO.ticket_type == 1 }">
						3D
					</c:when>
					<c:when test="${ticket_typeVO.ticket_type == 2 }">
						IMAX
					</c:when>
					<c:when test="${ticket_typeVO.ticket_type == 3 }">
						2D_IMAX
					</c:when>
					<c:when test="${ticket_typeVO.ticket_type == 4 }">
						3D_IMAX
					</c:when>
					<c:when test="${ticket_typeVO.ticket_type == 5 }">
						�Ʀ�
					</c:when>
				</c:choose>
			</td>
			<td>${ticket_typeVO.ticket_price}
			</td>
			<td>${ticket_typeVO.ticket_desc}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ticket_type/ticket_type.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="ticket_type_no"  value="${ticket_typeVO.ticket_type_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ticket_type/ticket_type.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="ticket_type_no"  value="${ticket_typeVO.ticket_type_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2.file" %>

<%-- <%if (request.getAttribute("ticket_typeVO")!=null){%> --%>
<%-- <jsp:include page="listOneTicket_type.jsp" /> --%>
<%-- <%} %> --%>
</body>
</html>