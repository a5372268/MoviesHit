<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.group_member.model.*"%>

<%-- �U�νƦX�d��-�i�ѫȤ��select_page.jsp�H�N�W�����Q�d�ߪ���� --%>
<%-- �����u�@���ƦX�d�߮ɤ����G�m�ߡA�i���ݭn�A�W�[�����B�e�X�ק�B�R�����\��--%>

<jsp:useBean id="listMembers_ByCompositeQuery" scope="request" type="java.util.List<Group_MemberVO>" /> <!-- ��EL����i�ٲ� -->
<jsp:useBean id="groupSvc" scope="page" class="com.group.model.GroupService" />


<html>
<head>
<title>�ƦX�d�� - listMembers_ByCompositeQuery.jsp</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>


<style>
  table#table-4 {
	background-color: #5bc0de;
    border: 2px solid black;
    text-align: center;
  }
  table#table-4 h4 {
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
	width: 100%;
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
<body>

<h4>
���U�νƦX�d��  - �i�ѫȤ�� select_page.jsp �H�N�W�����Q�d�ߪ����<br>
�������@���ƦX�d�߮ɤ����G�m�ߡA<font color=red>�w�W�[�����B�e�X�ק�B�R�����\��</font></h4>
<table id="table-4">
	<tr><td>
		 <h3><strong><em>�ƦX�d�� - listMembers_ByCompositeQuery.jsp</em></strong></h3>
		 <h4><a href=""><img src="<%=request.getContextPath()%>/images/back1.gif" width="100" height="32" border="0">�^����</a></h4>
	</td></tr>
</table>


<table class="table  table-bordered">
	<tr class="active">
		<th>����(�s��)</th>
		<th>�|��(�s��)</th>
		<th>�I�ڪ��A</th>
		<th>�|�����A</th>
		<th>�[�J�ɶ�</th>
		<th>�ק�</th>
		<th>�R��</th>
	</tr>
	<%@ include file="pages/page1_ByCompositeQuery.file" %>
	<c:forEach var="group_memberVO" items="${listMembers_ByCompositeQuery}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
		<tr ${(group_memberVO.group_no==param.group_no and group_memberVO.member_no==param.member_no) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw-->
			<td>
			${groupSvc.getOneGroup(group_memberVO.group_no).group_title}(${group_memberVO.group_no })
			</td>
			<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
			<td>
				${memSvc.getOneMem(group_memberVO.member_no).mb_name}
            	(${group_memberVO.member_no })
            	<font color="red"><b>
				<c:if test="${groupSvc.getOneGroup(group_memberVO.group_no).member_no== memSvc.getOneMem(group_memberVO.member_no).member_no}"> 
	                    *
            	</c:if>
            	</b></font>
			</td>
			<td>${group_memberVO.pay_status}</td>
			<td>${group_memberVO.status}</td>
			<td><fmt:formatDate value="${group_memberVO.crt_dt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
						<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/group_member/group_member.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�ק�" class="btn btn-info"> 
			     <input type="hidden" name="group_no"      value="${group_memberVO.group_no}">
			     <input type="hidden" name="member_no"      value="${group_memberVO.member_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action"	    value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/group_member/group_member.do" style="margin-bottom: 0px;">
			     <input type="submit" value="�R��" class="btn btn-danger">
			     <input type="hidden" name="group_no" value="${group_memberVO.group_no}">
			     <input type="hidden" name="member_no" value="${group_memberVO.member_no}">
			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			     <input type="hidden" name="action"     value="delete">
			     </FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="pages/page2_ByCompositeQuery.file" %>

<br>�����������|:<br><b>
   <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br>
   <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b>

</body>
</html>