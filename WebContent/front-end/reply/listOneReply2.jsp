<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ page import="com.reply.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- �����Ƚm�߱ĥ� Script ���g�k���� --%>

<%-- <% --%>
<!-- 	ReplyVO replyVO = (ReplyVO) request.getAttribute("replyVO"); //ReplServlet.java(Concroller), �s�Jreq��ReplyVO���� -->
<%-- %>  --%>
 
<% 
	Integer reply_no = new Integer(request.getParameter("reply_no")); 
	ReplyService replySvc = new ReplyService();
	ReplyVO replyVO = replySvc.getOneReply(reply_no);
%>

<html>
<head>
<title>���u��� - listOneArticle.jsp</title>

    <style type="text/css">
        html {
            background-color: white;
        }
        body {
            width: 600px;
            margin: 0 auto;
            background-color: #FF9500;
            padding: 0 20px 20px 20px;
            border: 5px solid black;
        }
        h1 {
            margin: 0;
            padding: 20px 0;
            color: #00539F;
        }
    </style>

</head>
<body bgcolor='white'>

<!-- <h4>�����Ƚm�߱ĥ� Script ���g�k����:</h4> -->
<!-- <table id="table-1"> -->
<!-- 	<tr><td> -->
<!-- 		 <h3>���u��� - ListOneArticle.jsp</h3> -->
<!-- 		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">�^����</a></h4> -->
<!-- 	</td></tr> -->
<!-- </table> -->

	    	<h1 align="center">�|���s��:<%=replyVO.getReply_no()%></h1>
    		<h1 align="center"><%=replyVO.getArticle_no()%></h1>
            <hr>
            <h1 align="center"><%=replyVO.getMember_no()%></h1>
            <h1 align="center"><%=replyVO.getContent()%></h1>
            <h1 align="center"><%=replyVO.getStatus()%></h1>

</body>
</html>