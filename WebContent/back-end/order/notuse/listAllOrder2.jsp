<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.order.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>

<%
	OrderService orderSvc = new OrderService();
    List<OrderVO> list = orderSvc.getAll();
    pageContext.setAttribute("list",list);
%>

<% 
	java.text.DateFormat df = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");; 
	pageContext.setAttribute("df",df);
%>

<html>
<head>
<title>�Ҧ�������� - listAllOrder.jsp</title>

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
		 <h3>�Ҧ��q���� - listAllOrder.jsp</h3>
		 <h4><a href="<%=request.getContextPath()%>/back-end/order/select_page.jsp"><img src="<%=request.getContextPath()%>/back-end/theater/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
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
		<th>�q��s��</th>
		<th>�|���s��</th>
		<th>�����s��</th>
		<th>���߮ɶ�</th>
		<th>�q�檬�A</th>
		<th>�q�����</th>
		<th>�I�ڤ覡</th>
		<th>�q���`��</th>
		<th>�y��</th>
	</tr>
	<%@ include file="page1.file" %> 
	<c:forEach var="orderVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		
		<tr>
			<td>${orderVO.order_no}</td>
			<td>${orderVO.member_no}</td>
			<td>${orderVO.showtime_no}</td>
			<td>${df.format(orderVO.crt_dt)}</td>
			<td>
				<c:choose>
					<c:when test="${orderVO.order_status == 0 }">
						���I��
					</c:when>
					<c:when test="${orderVO.order_status == 1 }">
						�w�I��
					</c:when>
					<c:when test="${theaterVO.theater_type == 2 }">
						�w����
					</c:when>
				</c:choose>
			</td>
			<td>${orderVO.order_type == 0 ? "�{��" : "�u�W"}</td>
			<td>
				<c:choose>
					<c:when test="${orderVO.payment_type == 0 }">
						�H�Υd
					</c:when>
					<c:when test="${orderVO.payment_type == 1 }">
						�{��
					</c:when>
					<c:when test="${orderVO.payment_type == 2 }">
						�{���I��
					</c:when>
				</c:choose>
			</td>
			<td>${orderVO.total_price }</td>
			<td>${orderVO.seat_name}</td>
			
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�d��">
			     <input type="hidden" name="order_no"  value="${orderVO.order_no}">
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">
			     <input type="hidden" name="action"	value="getOne_For_Order"></FORM>
<%-- 				${orderVO.seat_no} --%>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�">
			     <input type="hidden" name="order_no"  value="${orderVO.order_no}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/order/order.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��">
			     <input type="hidden" name="order_no"  value="${orderVO.order_no}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

<%if (request.getAttribute("orderVO")!=null){%>
<%-- <jsp:include page="listOneOrder.jsp" /> --%>
<%} %>
</body>
</html>