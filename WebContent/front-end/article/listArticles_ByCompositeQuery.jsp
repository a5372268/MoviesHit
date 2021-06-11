<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="com.reply.model.*"%>
<%@ page import="com.article.model.*"%>

<%-- �U�νƦX�d��-�i�ѫȤ��select_page.jsp�H�N�W�����Q�d�ߪ���� --%>
<%-- �����u�@���ƦX�d�߮ɤ����G�m�ߡA�i���ݭn�A�W�[�����B�e�X�ק�B�R�����\��--%>

<jsp:useBean id="listArticles_ByCompositeQuery" scope="request" type="java.util.List<ArticleVO>" /> <!-- ��EL����i�ٲ� -->
<jsp:useBean id="articleSvc" scope="page" class="com.article.model.ArticleService" />
<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
<jsp:useBean id="topicSvc" scope="page" class="com.topic.model.TopicService" />
<jsp:useBean id="replyDAO"  scope="page" class="com.reply.model.ReplyDAO" />
<jsp:useBean id="articleDAO" scope="page" class="com.article.model.ArticleDAO" />

<html>
<head><title>�ƦX�d�� - listArticles_ByCompositeQuery.jsp</title>
<!-- <link href="https://i2.bahamut.com.tw/css/basic.css?v=1618977484" rel="stylesheet"> -->
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous"> -->

<style>
   body {  
/*      width: 1200px;   */
     margin: 0 auto;  
     padding: 10px 20px 20px 20px;   
	font-family: "Helvetica Neue", Helvetica, Roboto, Arial, "Lucida Grande", "PingFang TC", "ī�G�פ���", "Apple LiGothic Medium", sans-serif;
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
	margin-top: 0px;
	margin-bottom: 5px;
	
  }
  table, th, td {
/*     border: 1px solid #CCCCFF; */
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
  .forum-body{
  	margin:0px 5px; 
  	padding:0;
}
.forum-nav{
/* 	background-color:#126E7D; */
}
.search-form{
	float:right;
}

.forum-body>.row{
	margin-top:10px;
}
.forum-body #forum>thead>tr>th{
	color:white;
	text-align:center;
}
.forum-body #forum>thead>tr>th,
.forum-body #forum>tbody>tr>td{
	font-size:small;
}
ul.nav-pills > li.active > a.toggle{
	background-color: #51A1B4;
}
table#forum.table>tbody>tr>td{
	padding-top:3px !important;
	padding-bottom:3px! important;
	color:#6c6760;
}
table#forum.table>tbody>tr:hover
{
	background-color:#FFFFDD !important;
 	transform: translateY(-5px); 
     box-shadow: 0 5px 5px rgba(0, 0, 0, 0.15); 
/* 	transition: box-shadow .25s; */
/*     box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 3px 10px 0 rgba(0, 0, 0, 0.19); */
}
table#forum.table>tbody>tr
{
 	box-shadow: 0 0 3px rgba(0, 0, 0, 0.2); 
     transition: 0.2s; 
/*  	transition: box-shadow .25s; */
/*     box-shadow: 0 0px 0px 0 rgba(0, 0, 0, 0.16), 0 1px 5px 0 rgba(0, 0, 0, 0.12); */
}
table#forum.table>tbody>tr>td>a
{
	font-weight:bold;
	color:black;
}
 table#forum.table>tbody>tr>td>a.notJQellipsis
 { 
 	font-weight:bold; 
 } 
table#forum.table>tbody>tr>td>a.JQellipsis
{
	font-weight:200;
	color:#6c6760;
	font-size:small;
}
#forum > tbody + tbody{
	border-top: 1px dotted #ddd;
}
.forum-nav>ul.nav.nav-pills>li>a.toggle{
	font-weight:700;
}

</style>
</head>
<body bgcolor='white'>
<jsp:include page="/front_header.jsp"/>
<!-- <h4> -->
<!-- ���U�νƦX�d��  - �i�ѫȤ�� listAllArticle.jsp �H�N�W�����Q�d�ߪ����<br> -->
<!-- �������@���ƦX�d�߮ɤ����G�m�ߡA<font color=red>�w�W�[�����B�e�X�ק�B�R�����\��</font></h4> -->
<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>�Ҧ����u��� - listAllArticle.jsp</h3> -->
<%-- 		 <h4><a href="<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp"><img src="<%=request.getContextPath()%>/front-end/article/images/back1.gif" width="100" height="32" border="0">�^����</a></h4> --%>
<!-- 	</td></tr> -->
<!-- </table> -->

<div class="container-fluid forum-body" style="min-height:450px;">

<div class="row"  style="margin:5px 0;">
	<h1 class="shadow p-3 mb-1 bg-white rounded" style="background-color:#02a388; display:inline-block;">
			MoviesHit�׾�
	</h1>

</div>
<div class="row"  style="margin:5px 0;">
<div class="col col-md-4 shadow-none p-2 mb-2 bg-light rounded" style="padding:0; margin-top:5px;">
 	<ul class="nav nav-pills">
		<li role="presentation" class="active"><a role="button" class="toggle" onclick="location.href='<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp'">HOME</a></li>
		<li role="presentation" class="active"><a role="button" class="toggle" onclick="location.href='<%=request.getContextPath()%>/topic/topic.do?action=listArticles_ByTopicno_B&topicno=1'">�q�v����</a></li>
		<li role="presentation"><a role="button" class="toggle" onclick="location.href='<%=request.getContextPath()%>/topic/topic.do?action=listArticles_ByTopicno_B&topicno=2'">�@���Q��</a></li>
		<li role="presentation"><a role="button" class="toggle" onclick="location.href='<%=request.getContextPath()%>/topic/topic.do?action=listArticles_ByTopicno_B&topicno=3'">�v������</a> </li>
	</ul>

</div>	


<div class="col col-md-8" style="padding:0; margin-top:5px;">
	   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/article/article.do" name="form1"  style="position: absolute; right: 0; top: 30px;">   
       <b><font color=blue>�j�M�峹:</font></b> 
        <b>��ܧ@��:</b>
        <select size="1" name="member_no" >
          <option value="">�п�ܧ@��</option>
         <c:forEach var="memberVO" items="${memSvc.all}" > 
          <option value="${memberVO.member_no}">${memberVO.mb_name}
         </c:forEach>   
        </select>       
        <b>��J�D�D:</b>
        <input type="text" name="article_headline" value=""  placeholder="�п�J�D�D  ">
		        
       <input type="submit" value="�e�X" class="btn btn-primary" style="border-radius:5px;">
        <input type="hidden" name="action" value="listArticles_ByCompositeQuery">
         <button type="button" class="btn btn-info" onclick="location.href='addArticle.jsp'" style="border-radius:5px;"><i class="fa fa-plus" aria-hidden="true"></i>�s�W�峹</button>
     </FORM>
	</div>
</div>
	
<div class="row" style="margin:5px 0;">
<%@ include file="pages/page1_ByCompositeQuery.file" %>
</div>

<table id="forum" class="table table-hover">
	 <thead style="background-color:#126E7D">
		<tr>
			<th>�s��</th>
			<th>�D�D</th>
			<th>�@��</th>
	<!-- 		<th>�峹���e</th> -->
			<th>�o��ɶ�</th>
	<!-- 		<th>��s�^�_�ɶ�</th> -->
<!-- 			<th>�峹���A</th> -->
			<th>�g��</th>
	<!-- 		<th>�ק�</th> -->
	<!-- 		<th>�R��</th> -->
		</tr>
	</thead>
	<c:forEach var="articleVO" items="${listArticles_ByCompositeQuery}">
<%-- 	 begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" --%>
<%-- 		<tr align='center' valign='middle' ${(ArticleVO.reply_no==param.reply_no) ? 'bgcolor=#CCCCFF':''}><!--�N�ק諸���@���[�J����Ӥw--> --%>
		<tbody>	
			<tr>	
				<td>${articleVO.articleno}<br>
				${topicSvc.getOneTopic(articleVO.articletype).topic}</td>
<%-- 			<tr ${(articleVO.articleno==param.articleno) ? 'bgcolor = green':''}><!--�N�ק諸���@���[�J����Ӥw--> --%>
<%-- 			<td>${articleVO.articleno}</td> --%>
				<td style="text-align:left; font-size:large;">
					<a class="notJQellipsis" href='<%=request.getContextPath()%>/front-end/article/listOneArticle2.jsp?articleno=${articleVO.articleno}'>${articleVO.articleheadline}</a>
					<br><a class="JQellipsis" href='<%=request.getContextPath()%>/front-end/article/listOneArticle2.jsp?articleno=${articleVO.articleno}'>${articleVO.content}</a>
									
				</td>	
<!-- 			<td> -->
<!-- 			<div class="box"> -->
<%-- 				<a class="JQellipsis" href='<%=request.getContextPath()%>/article/listOneArticle2.jsp?articleno=${articleVO.articleno}'>${articleVO.content}</a>				 --%>
<!-- 			</div>	 -->			
<!-- 			</td>	 -->
				<td style="text-align:left;"><img src ="<%=request.getContextPath()%>/MemServlet?action=view_memPic&member_no=${articleVO.memberno}" height= "30px" width="30px" style="margin-bottom:8px; border-radius:10px;"/>
				${memSvc.getOneMem(articleVO.memberno).mb_name}</td>		
				<td><fmt:formatDate value="${articleVO.crtdt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
<%-- 			<td><fmt:formatDate value="${articleVO.updatedt}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
<%-- 				<td>${articleVO.status}</td> --%>
				<td>${articleVO.likecount}</td>	

<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reply/reply.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="�ק�">  -->
<%-- 			     <input type="hidden" name="reply_no"    value="${replyVO.reply_no}"> --%>
<%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--> --%>
<%-- 			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller--> --%>
<!-- 			     <input type="hidden" name="action"	    value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/reply/reply.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="�R��"> -->
<%-- 			     <input type="hidden" name="reply_no"      value="${replyVO.reply_no}"> --%>
<%-- 			     <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller--> --%>
<%-- 			     <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller--> --%>
<!-- 			     <input type="hidden" name="action"     value="delete"></FORM> -->
<!-- 			</td> -->
			</tr>
		</tbody>
	</c:forEach>
</table>
<%-- <%@ include file="pages/page2_ByCompositeQuery.file" %> --%>

<!-- <br>�����������|:<br><b> -->
<%--    <font color=blue>request.getServletPath():</font> <%=request.getServletPath()%><br> --%>
<%--    <font color=blue>request.getRequestURI(): </font> <%=request.getRequestURI()%> </b> --%>
</div>
<jsp:include page="/front_footer_copy.jsp"/>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function(){
    var len = 15; // �W�L15�Ӧr�H"..."���N
    $(".JQellipsis").each(function(i){
        if($(this).text().length>len){
            $(this).attr("title",$(this).text());
            var text=$(this).text().substring(0,len-1)+"......see more...";
            $(this).text(text);
        }
    });
});


$("#forum>tbody>tr>td").mouseover(function(){

	$(this).find(".notJQellipsis").css("color", "#126E7D");
});

$("#forum>tbody>tr>td").mouseleave(function(){
$(this).find(".notJQellipsis").css("color", "black");
});

</script>
</html>