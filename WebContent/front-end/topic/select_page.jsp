<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Topic: Home</title>

<style>
  table#table-1 {
	width: 800px;
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
   <tr><td><h3>IBM Topic: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Topic: Home</p>

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
  <li><a href='<%=request.getContextPath()%>/front-end/topic/listAllTopic.jsp'>List</a> all Topic.  <br><br></li>
  
  
  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/topic/topic.do" >
        <b>��J�Q�ץD�D�s�� (�p1~10):</b>
        <input type="text" name="topicno">
        <input type="hidden" name="action" value="getOne_For_Display">
        <input type="submit" value="�e�X">
    </FORM>
  </li>

  <jsp:useBean id="topicSvc" scope="page" class="com.topic.model.TopicService" />
   
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/topic/topic.do" >
       <b>��ܰQ�ץD�D�s��:</b>
       <select size="1" name="topicno">
         <c:forEach var="topicVO" items="${topicSvc.all}" > 
          <option value="${topicVO.topicno}">${topicVO.topicno}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/topic/topic.do" >
       <b>��ܷ|���s��:</b>
       <select size="1" name="topicno">
         <c:forEach var="topicVO" items="${topicSvc.all}" > 
          <option value="${topicVO.topicno}">${topicVO.topicno}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="getOne_For_Display">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
</ul>


<h3>�峹�޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/topic/addTopic.jsp'>Add</a> a new Topic.</li>
</ul>

<h3><font color=orange>�峹�����޲z</font></h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/topic/listAllTopic.jsp'>List</a> all Topics. </li>
</ul>

</body>
</html>