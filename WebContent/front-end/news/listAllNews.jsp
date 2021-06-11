<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.news.model.*"%>
<%
	NewsService newsSvc = new NewsService();
	List<NewsVO> list = newsSvc.getAll();
	pageContext.setAttribute("list", list);
	
%>
<!DOCTYPE html>
<html>
<head>


<meta charset="BIG5">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
   body {  
/*      width: 1200px;   */
     margin: 0 auto;  
     padding: 10px 20px 20px 20px;   
	font-family: "Helvetica Neue", Helvetica, Roboto, Arial, "Lucida Grande", "PingFang TC", "ī�G�פ���", "Apple LiGothic Medium", sans-serif;
 	        }  
  table#table-1 {
	background-color: #CCCCFF;
    border: 1px solid black;
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
div.container.bulletin-container{
	 border:1px solid red; 
	 font-size:50px; 
	 width:80%;
	 min-height:450px;
	 margin-bottom:20px;
}
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

.search-form{
	float:right;
}

.forum-body>.row{
	margin-top:10px;
}
.forum-body #bulletin>thead>tr>th{
	color:white;
	text-align:center;
}
.forum-body #bulletin>thead>tr>th,
.forum-body #bulletin>tbody>tr>td{
	font-size:small;
}

table#bulletin.table>tbody>tr>td{
	padding-top:3px !important;
	padding-bottom:3px! important;
	color:#6c6760;
}
table#bulletin.table>tbody>tr:hover
{
	background-color:#FFFFDD !important;
 	transform: translateY(-5px); 
     box-shadow: 0 5px 5px rgba(0, 0, 0, 0.15); 
/* 	transition: box-shadow .25s; */
/*     box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 3px 10px 0 rgba(0, 0, 0, 0.19); */
}
table#bulletin.table>tbody>tr
{
 	box-shadow: 0 0 3px rgba(0, 0, 0, 0.2); 
     transition: 0.2s; 
/*  	transition: box-shadow .25s; */
/*     box-shadow: 0 0px 0px 0 rgba(0, 0, 0, 0.16), 0 1px 5px 0 rgba(0, 0, 0, 0.12); */
}
table#bulletin.table>tbody>tr>td>a
{
	font-weight:bold;
	color:black;
}
 table#bulletin.table>tbody>tr>td>a.notJQellipsis
 { 
 	font-weight:bold; 
 } 
table#bulletin.table>tbody>tr>td>a.JQellipsis
{
	font-weight:200;
	color:#6c6760;
	font-size:small;
}
#bulletin > tbody + tbody{
	border-top: 1px dotted #ddd;
}
div.row.head{
	margin: 0 5px;
}

</style>
</head>
<body>
<jsp:include page="/front_header.jsp"/>

<div class="container bulletin-container">
	<div class="row head">
		�]�޼v�����i<i class="fa fa-bullhorn fa-fw" title="���i"></i>
	</div>
		<table id="bulletin" class="table table-hover">
<!-- 			 <thead style="background-color:#126E7D"> -->
<!-- 				<tr>		 -->
<!-- 					<th>���</th> -->
<!-- 					<th>�D�D</th> -->
<!-- 				</tr> -->
<!-- 			</thead> -->
			<tbody>
			<c:forEach var="newsVO" items="${list}">		
				
					<tr>
						<td style="font-size:medium; width:15%;"><fmt:formatDate value="${newsVO.publish_date}" pattern="yyyy-MM-dd"/></td>

						<td style="text-align:left; font-size:large; width:85%;" >
							<a class="notJQellipsis" >${newsVO.getNews_title()}</a>
							<br><a class="JQellipsis">${newsVO.getNews_desc()}</a>		
						</td>		
					</tr>
						
			</c:forEach>
			</tbody>	
		</table>

	</div>  
</body>
<script>
	$(function(){
//     var len = 50; // �W�L15�Ӧr�H"..."���N
//     $(".JQellipsis").each(function(i){
//         if($(this).text().length>len){
//             $(this).attr("title",$(this).text());
//             var text=$(this).text().substring(0,len-1)+"<a href=" + $(this).attr('href') + ">......see more...<a>";
            
//             $(this).html(text);
//         }
//     });
	$(".JQellipsis").hide();
});

$("#bulletin>tbody>tr>td").mouseover(function(){
		$(this).find(".notJQellipsis").css("color", "#126E7D");
});

$("#bulletin>tbody>tr>td").mouseleave(function(){
	$(this).find(".notJQellipsis").css("color", "black");
});

$("#bulletin>tbody>tr>td").click(function(){
	var isOn = $(this).find("a.JQellipsis").is(":hidden");
	$(".JQellipsis").hide();
	
	console.log();
	if(isOn){
		$(this).find("a.JQellipsis").show();
	} else{
		$(this).find("a.JQellipsis").hide();
	}
	window.scrollTo(0, document.body.scrollHeight);
});
</script>

</html>