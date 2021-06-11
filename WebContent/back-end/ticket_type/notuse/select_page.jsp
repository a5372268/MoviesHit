<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.ticket_type.model.*"%>

<html>
<head>
<title>IBM Ticket_type: Home</title>

<style>
  table#table-1 {
	width: 450px;
	background-color: #CCCCFF;
	margin-top: 5px;
	margin-bottom: 10px;
    border: 3px ridge Gray;
    height: 80px;
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

</head>
<body bgcolor='white'>

<table id="table-1">
   <tr><td><h3>IBM Ticket_type: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Ticket_type: Home</p>

<h3>��Ƭd��:</h3>
	
<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
	    <c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<ul>
  <li><a href='<%=request.getContextPath()%>/back-end/ticket_type/listAllTicket_type.jsp'>List</a> all ticket_types.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ticket_type/ticket_type.do" >
        <b>��J���ؽs�� (�p1):</b>
        <input type="text" name="ticket_type_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="ticket_typeSvc" scope="page" class="com.ticket_type.model.Ticket_typeService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ticket_type/ticket_type.do" >
       <b>��ܲ��ؽs��:</b>
       <select size="1" name="ticket_type_no">
         <c:forEach var="ticket_typeVO" items="${ticket_typeSvc.all}" > 
          <option value="${ticket_typeVO.ticket_type_no}">${ticket_typeVO.ticket_type_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/ticket_type/ticket_type.do" >
       <b>��ܲ���:</b>
       <select size="1" name="ticket_type_no">
         <c:forEach var="ticket_typeVO" items="${ticket_typeSvc.all}" > 
          <option value="${ticket_typeVO.ticket_type_no}">${ticket_typeVO.ticket_desc}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
</ul>


<h3>���غ޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/back-end/ticket_type/addTicket_type.jsp'>Add</a> a new Ticket_type.</li>
</ul>

</body>
</html>