<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>IBM Group_Member: Home</title>

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
<body bgcolor='lightgray'>

<table id="table-1">
   <tr><td><h3>IBM Group_Member: Home</h3><h4>( MVC )</h4></td></tr>
</table>

<p>This is the Home page for IBM Group_Member: Home</p>

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
  <li><a href='<%=request.getContextPath()%>/front-end/group_member/listAllGroup_Member.jsp'>List</a> all Group_Members <h4>(byDAO).  </h4></li>

  <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/group_member/group_member.do" >
        <b>�d�ݴ��η|��(��J���νs��):</b>
        <input type="text" name="group_no">
        <input type="hidden" name="action" value="GetMembersByGroup">
        <input type="submit" value="�e�X"> 
    </FORM>
  </li>

  <jsp:useBean id="groupSvc" scope="page" class="com.group.model.GroupService" />
   <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/group_member/group_member.do" >
       <b>�d�ݴ��η|��(��ܴ��νs��):</b>
       <select size="1" name="group_no">
         <c:forEach var="groupVO" items="${groupSvc.all}" > 
          <option value="${groupVO.group_no}">${groupVO.group_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="GetMembersByGroup">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
  
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/group_member/group_member.do" >
       <b>�d�ݴ��η|��(��ܴ��μ��D):</b>
       <select size="1" name="group_no">
         <c:forEach var="groupVO" items="${groupSvc.all}" > 
          <option value="${groupVO.group_no}">${groupVO.group_title}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="GetMembersByGroup">
       <input type="submit" value="�e�X">
    </FORM>
  </li>
<!--   ��ܴ��άd�ݦ���(mvc0403�@�k -->
    <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/group/group.do" >
       <b><font color=orange>��ܴ���(mvc0403�@�k):</font></b>
       <select size="1" name="group_no">
         <c:forEach var="groupVO" items="${groupSvc.all}" > 
          <option value="${groupVO.group_no}">${groupVO.group_title}
         </c:forEach>   
       </select>
       <input type="submit" value="�e�X">
       <input type="hidden" name="action" value="listMembers_ByGroupno_A">
     </FORM>
  </li>
  
  
  
  
  
  <jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
    <li>
    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/group_member/group_member.do" >
        <b>�d�ݷ|���w�[�J����(��J�|���s��):</b>
        <input type="text" name="member_no">
        <input type="hidden" name="action" value="GetGroupsByMember">
        <input type="submit" value="�e�X"> 
    </FORM>
  	</li>
    
    
    <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/group_member/group_member.do" >
       <b>�d�ݷ|���w�[�J����(��ܷ|���s��):</b>
       <select size="1" name="member_no">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.member_no}">${memVO.member_no}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="GetGroupsByMember">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
  
  <li>
     <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/group_member/group_member.do" >
       <b>�d�ݷ|���w�[�J����(��ܷ|���W��):</b>
       <select size="1" name="member_no">
         <c:forEach var="memVO" items="${memSvc.all}" > 
          <option value="${memVO.member_no}">${memVO.mb_name}
         </c:forEach>   
       </select>
       <input type="hidden" name="action" value="GetGroupsByMember">
       <input type="submit" value="�e�X">
     </FORM>
  </li>
  
  
</ul>

<h3>���η|���޲z</h3>

<ul>
  <li><a href='<%=request.getContextPath()%>/front-end/group_member/addGroup_Member.jsp'>Add</a> a new Group_Member.</li>
</ul>

</body>
</html>