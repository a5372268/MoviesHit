<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.relationship.model.*"%>
<%@ page import="java.util.*"%>

<%
// 	Set<ReplyVO> listReplys_ByArticleno = (Set<ReplyVO>)request.getAttribute("listReplys_ByArticleno");
%>

<jsp:useBean id="listRelationships_ByMemno" scope="request" type="java.util.Set<RelationshipVO>" /> <!-- ��EL����i�ٲ� -->
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="group_memberSvc" scope="page" class="com.group_member.model.Group_MemberService" />
<jsp:useBean id="relationshipSvc" scope="page" class="com.relationship.model.RelationshipService" />


<html>
<head><title>�|���n�� - listRelationships_ByMemno.jsp</title>

<style>
   body {  
/*      width: 565px;   */
     margin: 0 auto;  
     padding: 10px 20px 20px 20px;  
 	        }  
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
 	width: 100%; 
 	background-color: white; 
 	margin-top: 5px; 
 	margin-bottom: 5px; 
	
   } 
   table, th, td { 
/*       border: 1px solid #CCCCFF;  */
		font-size:25px;
   } 
   th, td { 
     padding: 5px; 
     text-align: center;
/*      color:yellow;  */
	
   } 
   table.table {
   		height: 0px !important;
   }
   
</style>

</head>
<body bgcolor='white'>
<jsp:include page="/front_header.jsp"/>
<div class="container"  style="min-height: 465px;" >

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<div class="row"  style="margin:5px 0;">
	<img src="${pageContext.request.contextPath}/mem/DBGifReader4.do?member_no=${memVO.member_no}"
				alt="�|�L�Ϥ�" class="rounded-circle" width="60px" height="60px" title=""/>
<%--      		�i<font color=orange>${memVO.mb_name}</font>�j --%>
	<h1 class="shadow p-3 mb-1 bg-white rounded" style="background-color:#02a388; display:inline-block;color: white;">
			${memVO.mb_name} ���n�ͱM��
	</h1>

</div>
<div class="row">

	<div class="col col-md-8">
	 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/mem/mem.do" name="form1">   
       <b><font color=blue>�j�M�|���[�n��:</font></b> 
       		<input type="text" name="mb_name" value="" placeholder="�п�J�|���W��">		        
        <input type="submit" value="�e�X" class="btn btn-primary">
        <input type="hidden" name="action" value="listMems_ByCompositeQuery">
     	<br>
     </FORM>
    </div>
	<div class="col col-md-4 btn-group" style="font-size:40px">
	  <button type="button" class="btn btn-success" style="border-radius: 5px 0 0 5px;right:128px;">�n�ͺ޲z</button>
	  <button type="button" class="btn btn-success dropdown-toggle" style="border-radius: 0 5px 5px 0;right:128px;" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	    <span class="caret"></span>&nbsp</button>
	  	<ul class="dropdown-menu">
		    <li><a class="dropdown-item" href="<%=request.getContextPath()%>/mem/mem.do?action=listRelationships_ByMemberno_B&member_no=${memVO.member_no}">�ڪ��n��</a></li>
			<li><a class="dropdown-item" href="<%=request.getContextPath()%>/front-end/relationship/friend_invite.jsp">�n���ܽ�</a></li>
			<li><a class="dropdown-item" href="<%=request.getContextPath()%>/chat.do?action=ueser&userName=${memVO.mb_name}">�}�Ҳ�ѫ�</a></li>
		</ul>
	</div>

	</div>



<table class="table" style="background: cadetblue;">
	 <thead style="background-color:#9e9e9e ;">
		<tr>
			<th style="text-align: center ;color: black;">�ڪ��n�ͦW��</th>
			<th style="text-align: center;color: black;">�n�ͪ��A</th>
		</tr>
	</thead>

	<c:forEach var="relationshipVO" items="${listRelationships_ByMemno}" >		
		<tbody>	
			<tr>
				<td>
					<img src="${pageContext.request.contextPath}/mem/DBGifReader4.do?member_no=${relationshipVO.friend_no}"
						alt="�|�L�Ϥ�" width="96px;" height="108px" title="" style="border: groove;"/>						
					<c:forEach var="memVO" items="${memSvc.all}">
	                 	<c:if test="${relationshipVO.friend_no==memVO.member_no}">
	                   		<font color=orange>${memVO.mb_name}</font>
	                   	 </c:if>
	                </c:forEach>
				</td>								
<%-- 			<td>${relationshipVO.status}</td> --%>
<%-- 			<td>${relationshipVO.isblock}</td> --%>

<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/relationship/relationship.do" style="margin-bottom: 0px;"> --%>
<!-- 			    <input type="submit" value="�ק�">  -->
<%-- 			    <input type="hidden" name="member_no"   value="${relationshipVO.member_no}"> --%>
<%-- 			    <input type="hidden" name="friend_no"   value="${relationshipVO.friend_no}"> --%>
<%-- 			    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--><!-- �ثe�|���Ψ�  --> --%>
<!-- 			    <input type="hidden" name="action"	   value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
				<td style="vertical-align:middle;">
					<c:choose>
						<c:when test="${relationshipSvc.getOneRelationship(relationshipVO.member_no, relationshipVO.friend_no).status == 0}">
						  	<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/relationship/relationship.do" style="margin-bottom: 0px;">
							    <input type="submit" value="���^�n���ܽ�" class="btn btn-danger">
							    <input type="hidden" name="member_no"   value="${relationshipVO.member_no}">
							    <input type="hidden" name="friend_no"   value="${relationshipVO.friend_no}">			    
							    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
							    <input type="hidden" name="action"     value="delete" >
							</FORM>
						</c:when>	
						<c:otherwise>
							<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/relationship/relationship.do" style="margin-bottom: 0px;">
							    <input type="submit" value="�R���n��" class="btn btn-danger">
							    <input type="hidden" name="member_no"   value="${relationshipVO.member_no}">
							    <input type="hidden" name="friend_no"   value="${relationshipVO.friend_no}">			    
							    <input type="hidden" name="requestURL" value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
							    <input type="hidden" name="action"     value="delete1">
							</FORM>
						</c:otherwise>	
					</c:choose>
				</td>
			</tr>
		</tbody>
	</c:forEach>
</table>
</div>
     <div class="w3agile_footer_copy">
        <p>2021 MoviesHit. All rights reserved</p>
    </div>
    <a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>