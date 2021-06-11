<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*"%>
<%@ page import="com.reply.model.*"%>
<%@ page import="com.article.model.*"%>
<%@ page import="com.topic.model.*"%>
<%-- �����m�߱ĥ� EL ���g�k���� --%>
	
<%-- <% --%>
<!-- ArticleService articleSvc = new ArticleService(); -->
<!-- List<ArticleVO> list = ArticleSvc.getAll(); -->
<!-- pageContext.setAttribute("list",list); -->
<%-- %> --%>
	<jsp:useBean id="articleSvc" scope="page" class="com.article.model.ArticleService" />
	<jsp:useBean id="memSvc" scope="page" class="com.mem.model.MemService" />
	<jsp:useBean id="topicSvc" scope="page" class="com.topic.model.TopicService" />
	<jsp:useBean id="replyDAO"  scope="page" class="com.reply.model.ReplyDAO" />
	<jsp:useBean id="articleDAO" scope="page" class="com.article.model.ArticleDAO" />	
	
<%-- 	<jsp:useBean id="memVO" scope="session" class="com.mem.model.MemVO" /> --%>
<html>
<head>
<link href="https://i2.bahamut.com.tw/css/basic.css?v=1618977484" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">

<title>�Ҧ��峹��� - listAllArticle.jsp</title>

<style>
   body {  
     width: 1200px;  
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
/*     border: 1px solid #CCCCFF; */
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>


</head>
<body bgcolor='white'>


<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>�Ҧ��峹��� - listAllArticle.jsp</h3> -->
<%-- 		 <h4><a href="<%=request.getContextPath()%>/reply/select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4> --%>
<!-- 	</td></tr> -->
<!-- </table> -->

<%-- ���~��C --%>
<c:if test="${not empty errorMsgs}">
	<font style="color:red">�Эץ��H�U���~:</font>
	<ul>
		<c:forEach var="message" items="${errorMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>
<h1 class="shadow p-3 mb-1 bg-white rounded">
	<span class="badge badge-secondary">
		MoviesHit�Q�װ�
	</span>
	<button type="button" class="btn btn-success" onclick="location.href='<%=request.getContextPath()%>/index.jsp'">�^����</button>
	<button type="button" class="btn btn-info" onclick="location.href='addArticle.jsp'">�s�W�峹</button>
</h1>

<!-- <ul> -->
<%--   <li><a href='<%=request.getContextPath()%>/article/listAllArticle.jsp'>�d�ݥ����峹</a></li> --%>
<!-- </ul> -->
<div class="shadow-none p-2 mb-2 bg-light rounded">	
 	<%-- �U�νƦX�d��-�H�U���-�i�H�N�W�� --%>   
    <button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/front-end/article/listAllArticle.jsp'">HOME</button>
	<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/topic/topic.do?action=listArticles_ByTopicno_B&topicno=1'">�q�v����</button>
	<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/topic/topic.do?action=listArticles_ByTopicno_B&topicno=2'">�@���Q��</button>
	<button type="button" class="btn btn-outline-dark" onclick="location.href='<%=request.getContextPath()%>/topic/topic.do?action=listArticles_ByTopicno_B&topicno=3'">�v������</button>   
 	<b>���� �X �d �� �� �� �p �U �� ��:</b>
</div>
   <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/front-end/article/article.do" name="form1">   
       <b><font color=blue>�j�M�������@�̩Τ峹�D�D:</font></b> 
        <b>��ܤ峹�@��:</b>
        <select size="1" name="member_no" >
          <option value="">
         <c:forEach var="memberVO" items="${memSvc.all}" > 
          <option value="${memberVO.member_no}">${memberVO.mb_name}
         </c:forEach>   
        </select>       
        <b>��J�峹�D�D:</b>
        <input type="text" name="article_headline" value="">
		        
        <input type="submit" value="�e�X" class="btn btn-primary">
        <input type="hidden" name="action" value="listArticles_ByCompositeQuery">
     </FORM>

<!-- <table> -->
<!-- 	<tr> -->
<!-- 		<th>�Q�ץD�D�s��</th> -->
<!-- 		<th>�Q�ץD�D</th>		 -->
<!-- <!-- 		<th>�ק�</th>	 --> 
<!-- <!-- 		<th>�R��</th>	 --> 
<!-- 		<th>�e�X�d��</th>	 -->
		
<!-- 	</tr> -->
<%-- 	<c:forEach var="topicVO" items="${topicSvc.all}"> --%>
		
<!-- 		<tr> -->
<%-- 			<td>${topicVO.topicno}</td> --%>
<%-- 			<td>${topicVO.topic}</td> --%>
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/topic/topic.do" style="margin-bottom: 0px;"> --%>
<!-- 			    <input type="submit" value="�e�X�d��">  -->
<%-- 			    <input type="hidden" name="topicno" value="${topicVO.topicno}"> --%>
<!-- 			    <input type="hidden" name="action" value="listArticles_ByTopicno_B"></FORM> -->
<!-- 			</td> -->
			
			
<!-- 		</tr> -->
<%-- 	</c:forEach> --%>
<!-- </table> -->
<table class="table table-hover">
	 <thead style="background-color:#F0F0F0">
		<tr>		
			<th>�峹�s��</th>
			<th>�o���</th>
			<th>�峹����</th>
	<!-- 	<th>�峹���e</th> -->
			<th>�峹�D�D</th>
			<th>�o��峹�ɶ�</th>
	<!-- 		<th>��s�峹�ɶ�</th> -->
<!-- 			<th>�峹���A</th> -->
			<th>�I�g��</th>
	<!-- 		<th>�ק�</th> -->
	<!-- 		<th>�R��</th> -->
	<!-- 	<th>�d�ߦ^��</th> -->
		</tr>
	</thead>
<%-- 	<%@ include file="page1.file" %>  --%>
	<c:forEach var="articleVO" items="${articleSvc.all}">		
		<tbody>
			<tr>
				<td>${articleVO.articleno}</td>
<%-- 			<tr ${(articleVO.articleno==param.articleno) ? 'bgcolor = green':''}><!--�N�ק諸���@���[�J����Ӥw--> --%>
<%-- 			<td>${articleVO.articleno}</td> --%>
				<td>�i<font color=orange>${memSvc.getOneMem(articleVO.memberno).mb_name}</font>�j</td>			
				<td>�i<font color=orange>${topicSvc.getOneTopic(articleVO.articletype).topic}</font>�j</td>
<!-- 			<td> -->
<!-- 			<div class="box"> -->
<%-- 				<a class="JQellipsis" href='<%=request.getContextPath()%>/article/listOneArticle2.jsp?articleno=${articleVO.articleno}'>${articleVO.content}</a>				 --%>
<!-- 			</div>	 -->			
<!-- 			</td>	 -->
				<td>
			<div class="box">
				<a class="JQellipsis" href='<%=request.getContextPath()%>/front-end/article/listOneArticle2.jsp?articleno=${articleVO.articleno}'>${articleVO.articleheadline}</a>				
			</div>				
				</td>			
				<td><fmt:formatDate value="${articleVO.crtdt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
<%-- 			<td><fmt:formatDate value="${articleVO.updatedt}" pattern="yyyy-MM-dd HH:mm:ss"/></td> --%>
<%-- 				<td>${articleVO.status}</td> --%>
				<td>${articleVO.likecount}</td>
				
				
			
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/article/article.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="�ק�"> -->
<%-- 			     <input type="hidden" name="articleno"  value="${articleVO.articleno}"> --%>
<!-- 			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/article/article.do" style="margin-bottom: 0px;"> --%>
<!-- 			     <input type="submit" value="�R��"> -->
<%-- 			     <input type="hidden" name="articleno"  value="${articleVO.articleno}"> --%>
<!-- 			     <input type="hidden" name="action" value="delete"></FORM> -->
<!-- 			</td> -->
<!-- 			<td> -->
<%-- 			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/article/article.do" style="margin-bottom: 0px;">			     --%>
<!-- 			    <input type="submit" value="�d��" class="btn btn-success">  -->
<%-- 			    <input type="hidden" name="articleno" value="${articleVO.articleno}"> --%>
<!-- 			    <input type="hidden" name="action" value="listReplys_ByArticleno_B"></FORM> -->
<!-- 			</td>			 -->
			</tr>
		</tbody>			
	</c:forEach>
</table>

<%-- <%@ include file="page2.file" %> --%>

<%-- <%if (request.getAttribute("listReplys_ByArticleno")!=null){%> --%>
<%--       <jsp:include page="listReplys_ByArticleno.jsp" /> --%>
<%-- <%} %> --%>

<%-- <% --%>
<%--  if (request.getAttribute("listArticles_ByTopicno")!=null){%> --%>
<%--       <jsp:include page="/topic/listArticles_ByTopicno.jsp" /> --%>
<%-- <%} %> --%>

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
</script>
</html>