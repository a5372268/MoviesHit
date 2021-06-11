<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.theater.model.*"%>

<html>
<head>
<title>IBM Theater: Home</title>

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
   <tr><td><h3>IBM Theater: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Theater: Home</p>

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
  <li><a href='<%=request.getContextPath()%>/back-end/theater/listAllTheater.jsp'>List</a> all Theaters.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/theater/theater.do" >
        <b>��J�U�|�s�� (�p1):</b>
        <input type="text" name="theater_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="theaterSvc" scope="page" class="com.theater.model.TheaterService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/theater/theater.do" >
       <b>����U�|�s��:</b>
       <select size="1" name="theater_no">
         <c:forEach var="theaterVO" items="${theaterSvc.all}" > 
          <option value="${theaterVO.theater_no}">${theaterVO.theater_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/theater/theater.do" >
       <b>����U�|�W��:</b>
       <select size="1" name="theater_no">
         <c:forEach var="theaterVO" items="${theaterSvc.all}" > 
          <option value="${theaterVO.theater_no}">${theaterVO.theater_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�U�|�޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/back-end/theater/addTheater.jsp'>Add</a> a new Theater.</li>
</ul>

</body>
</html>