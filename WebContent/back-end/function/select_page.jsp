<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Function: Home</title>

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
   <tr><td><h3>IBM Function: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Function: Home</p>

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
  <li><a href='listAllFunction.jsp'>List</a> all Function.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="function.do" >
        <b>��J�\��s�� :</b>
        <input type="text" name="function_no">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="functionSvc" scope="page" class="com.function.model.FunctionService" />
   
  <li>
     <FORM METHOD="post" ACTION="function.do" >
       <b>��ܥ\��s��:</b>
       <select size="1" name="function_no">
         <c:forEach var="functionVO" items="${functionSvc.all}" > 
          <option value="${functionVO.function_no}">${functionVO.function_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="function.do" >
       <b>��ܥ\�໡��:</b>
       <select size="1" name="function_no">
         <c:forEach var="functionVO" items="${functionSvc.all}" > 
          <option value="${functionVO.function_no}">${functionVO.function_desc}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>���u�޲z</h3>

<ul>
  <li><a href='addFunction.jsp'>Add</a> a new Function.</li>
</ul>

</body>
</html>