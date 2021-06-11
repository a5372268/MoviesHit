<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.employee.model.*"%>
<%@ page import="com.authority.model.*"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    EmployeeService employeeSvc = new EmployeeService();
    List<EmployeeVO> list = employeeSvc.getAll();
    pageContext.setAttribute("list",list);
%>


<%
    EmployeeVO employeeVO = (EmployeeVO) session.getAttribute("employeeVO");
	Set<AuthorityVO> authList = (Set<AuthorityVO>) session.getAttribute("authList");
%>


<%--
		Integer empno = employeeVO.getEmpno();
		AuthorityService authSvc1 = new AuthorityService(); 
 		List<AuthorityVO> list2 = authSvc1.getOneAuthorityByEmpNo(empno);  
 		for(int i = 0; i < list2.size(); i++){ 
				AuthorityVO authVO = list2.get(i); 
			if(authVO.getAuth_status().equals("N")){ 
				list2.remove(authVO); 
					i--; 
			}else{ 
				System.out.println(authVO.getFunction_no()); 
 			} 
 		}
--%>


<jsp:useBean id="authoritytSvc" scope="page" class="com.authority.model.AuthorityService" />

<!DOCTYPE html>
<html lang="en">
    <head>
    	<title>��x�s���Ҧ��q�v</title>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <link href="<%=request.getContextPath()%>/back-home/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/js/all.min.js" crossorigin="anonymous"></script>
    	
    	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/styleForListAllEmp.css" />
    	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    	<link rel="stylesheet" href="<%=request.getContextPath()%>/back-end/employee/css/style.css">
     	
     	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/back-home/css/back_frontpage.css" />
    
    
    	<style>
/*     	h2 {  */
/* 		    position: absolute;  */
/* 		    top: 0px;  */
/* 		    left: 10;   */
/* 		    width: 100%;  */
/* 			}  */
		span.logo {
    		color: #02a388;
   			font-size: 1em;
   			}	
    	</style>
    </head>
    <body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <a class="navbar-brand" href="index.html">MOVIESHIT��x�t��</a>
        <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
            <div class="input-group">
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ml-auto ml-md-0">
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle1" id="userDropdown" href="<%=request.getContextPath()%>/back-end/employee/empLogin.jsp" role="button"><i class="fas fa-user fa-fw"></i>${employeeVO.empname}</a>
            </li>
            <a class="nav-link" href="<%=request.getContextPath()%>/back-end/employee/empLogout.jsp">
               	 �n�X
            </a>
        </ul>
    </nav>
    
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <img src="<%=request.getContextPath()%>/back-home/img/logo2-1-6.png">
	                         <h1 style="text-align: center;color: white;font-weight: bold ;font-size:35px">
	                         	<span class="logo">M</span>ovies<span class="logo">H</span>it
	                         </h1>
<!--                         <a class="nav-link collapsed" href="tables3.html"> -->
<!--                             <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div> -->
<!--                            	 �򥻸�� -->
<!--                         </a> -->
                        <a id="employee_management" class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts1">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-cog"></i></div>
                           	 ���u�޲z�t��
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/employee/listAllEmployee2.jsp">���u�޲z</a>
                            </nav>
                        </div>
                        <a id="movie_management" class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-video"></i></div>
                         	   �v���򥻸�ƨt��
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/movie/backEndlistAllMovie.jsp">�q�v��ƺ޲z</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/showtime/listAllShowtime.jsp">�����޲z</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/theater/listAllTheater.jsp"> �U�|�޲z</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/ticket_type/listAllTicket_type.jsp">���غ޲z</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/food/listAllFood.jsp">�\�I�޲z</a>
                            </nav>
                        </div>
                        <a id="member_management" class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="false" aria-controls="collapsePages2">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-clock"></i></div>
                            	�|���޲z�t��
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages2" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/mem/listAllMem2.jsp">�|����ƺ޲z</a>
                            </nav>
                        </div>
                        <a id="ticket_management" class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3" aria-expanded="false" aria-controls="collapsePages3">
                            <div class="sb-nav-link-icon"><i class="fas fa-ticket-alt"></i></div>
                        	    �Ⲽ�޲z
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages3" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link function" href="layout-static.html">�{������</a>
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/order/listAllOrder.jsp">�q��޲z</a>
                            </nav>
                        </div>
           				 <a id="comment_management" class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4" aria-expanded="false" aria-controls="collapsePages4">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-alt-slash"></i></div>
                          	  ���|�޲z
                          	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages4" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link function" href="<%=request.getContextPath()%>/back-end/report_comment/listAllReportComment.jsp">�������|</a>
                            </nav>
                        </div>
                        <a id="news_management" class="nav-link function" href="tables1.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-bullhorn"></i></div>
                           	 �޲z�̷s����
                        </a>
                        <a id="customer_service" class="nav-link function" href="tables2.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-hands-helping"></i></div>
                       	     	�^���ȪA�p����
                        </a>
                    </div>
                </div>
            </nav>
        </div>
            
            
            
            
            
<!--       ======�o��K�ۤv���ɮפ��e====== -->
            <div id="layoutSidenav_content">
                <main>
	<%-- ���~��C --%>
	<c:if test="${not empty errorMsgs}">
		<font style="color:red">�Эץ��H�U���~:</font>
		<ul>
			<c:forEach var="message" items="${errorMsgs}">
				<li style="color:red">${message}</li>
			</c:forEach>
		</ul>
		</c:if>
	
	
	<section class="ftco-section">
		<div class="container">  
		<div class="col-sm-6">
						<h2><b>���u�s�W</b></h2>
					</div>
					<div class="col-sm-6">
						<a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Add New Employee</span></a>
					</div>
					<br>
					<br>
			<div>
				<div class="col-sm-6">
					<h2><b>���u�C��</b></h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
						<table class="table myaccordion table-hover" id="accordion">
						  <thead>
						    <tr>
						      <th class="th1">���u�s��</th>
							  <th>���u�m�W</th>
							  <th>�ʧO</th>
							  <th>�q��</th>
							  <th>�q�l�l��</th>
							  <th>¾��</th>
							  <th>���Τ��</th>
							  <th>��¾���</th>
							  <th>�b¾���A</th>
							  <th>�v��</th>
							  <th>�ק�</th>
						    </tr>
						  </thead>
						  <tbody>
						  <%@ include file="page1.file" %> 
	<c:forEach var="employeeVO" varStatus="status" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>" >
						    <tr data-toggle="collapse" data-target="#collapse${status.count}" aria-expanded="true" aria-controls="collapse${status.count}" class="collapsed">
								<td>${employeeVO.empno}</td>
								<td>${employeeVO.empname}</td>
<%-- 								<td>${employeeVO.emppwd}</td> --%>
								<td>${employeeVO.gender eq 1?"�k":"�k"}</td>
								<td>${employeeVO.tel}</td> 
								<td>${employeeVO.email}</td>
								<td>${employeeVO.title}</td>
								<td><fmt:formatDate value="${employeeVO.hiredate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								<td><fmt:formatDate value="${employeeVO.quitdate}" pattern="yyyy-MM-dd HH:mm:ss"/>
								<td>
									 <c:choose>
   									 <c:when test= "${employeeVO.status eq 0}">�w��¾</c:when>
   									 <c:when test= "${employeeVO.status eq 1}">�b¾��</c:when>
   									 <c:when test= "${employeeVO.status eq 2}">�d¾���~</c:when>
   									</c:choose>
								</td>
						      	<td>
						      		<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/employee/employee.do" style="margin-bottom: 0px;">
<!-- 						      			 <i class="fa" aria-hidden="true"></i> -->
<!-- 			   							 <input type="submit" value="�e�X�d��">  -->
									     <input type="submit" class="btn btn-success edit" value="�d��">
			  							 <input type="hidden" name="empno" value="${employeeVO.empno}">
			  							 <input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"><!--�e�X�����������|��Controller-->
			    						 <input type="hidden" name="whichPage"	value="<%=whichPage%>">               <!--�e�X��e�O�ĴX����Controller-->
			   							 <input type="hidden" name="action" value="listAuthority_ByEmpno">
			   						</FORM>
				        		</td>
				        		<td>
				        		 <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/employee/employee.do" style="margin-bottom: 0px;">
			     <input type="hidden" name="empno"  value="${employeeVO.empno}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			     <input type="submit" class="btn btn-success edit" value="Edit">
<!-- 			      <a href="#editEmployeeModal" class="edit" data-toggle="modal"><i class="material-icons" data-toggle="tooltip" title="Edit">&#xE254;</i></a> -->
			      				</FORM>
			</td>
						    </tr>
   							</c:forEach>
						  </tbody>
						</table>
						  <%@ include file="page2.file" %>
					</div>
						<td colspan="6" id="collapse${status.count}" class="collapse acc">
						   <%if (request.getAttribute("listAuths_ByEmpno")!=null){%>
    						 <jsp:include page="listAuths_ByEmpno.jsp" />
							<%} %>
			   			</td>
				</div>
			</div>
	</section>
	
<!-- 	�s�W���umodal -->
		<div id="addEmployeeModal" class="modal fade">
	<div class="modal-dialog">
		<div class="modal-content">
			<form METHOD="post" ACTION="<%=request.getContextPath()%>/back-end/employee/employee.do">
				<div class="modal-header">						
					<h4 class="modal-title">Add Employee</h4>
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">	
								
					<div class="form-group">
						<label>���u�m�W:</label>
						<input type="text" class="form-control" name="empname" size="45" value="�ۯ}��" required>
					</div>
					
					<div class="form-group">
						<label>�ʧO:</label>
						<select size="1" class="form-control" name="gender">
							<option value="1">�k
							<option value="0">�k
						</select>
					</div>
					
					<div class="form-group">
						<label>�q��:</label>
						<input class="form-control" type="TEXT" name="tel" size="45"
					value= "0900123321" required>
					</div>
					
					<div class="form-group">
						<label>�q�l�l��:</label>
						<input type="text" name="email" size="45"
					value="edlevisken@gmail.com" class="form-control" required>
					</div>	
					
					<div class="form-group">
						<label>¾��:</label>
						<input type="text" name="title" size="45"
					value= "��x�޲z��" class="form-control" required>
					</div>	
					
					<div class="form-group">
						<label>���Τ��:</label>
						<input type="text" name="hiredate" id="f_date1" class="form-control" required>
					</div>	
					
					<div class="form-group">
						<label>��¾���:</label>
						<input type="text" name="quitdate" id="f_date2" class="form-control" required>
					</div>	
					
					<div class="form-group">
						<label>�b¾���A:</label><br>
						<input type="radio" name="status" value="0" >�w��¾
						<input type="radio" name="status" value="1" checked>�b¾��
						<input type="radio" name="status" value="2" >�d¾���~
					</div>	
					
					<hr>
					<div class="form-group">
						<label>�v��:</label><br>
						<input type="checkbox"> ���u�޲z  
						<input type="hidden" name="function_no" value="1">
						<input type="hidden" name="auth_status" value="N">
						 &nbsp;&nbsp;
						<input type="checkbox" > �q�v��T�޲z
						<input type="hidden" name="function_no" value="2" >
						<input type="hidden" name="auth_status" value="N">
						 &nbsp;&nbsp;
						<input type="checkbox" > �����޲z
						<input type="hidden" name="function_no" value="3" >
						<input type="hidden" name="auth_status" value="N">
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox" > �U�|�޲z
						<input type="hidden" name="function_no" value="4" > 
						<input type="hidden" name="auth_status" value="N">
						<br>
						<input type="checkbox"> ���غ޲z
						<input type="hidden" name="function_no" value="5" > 
						<input type="hidden" name="auth_status" value="N">
						 &nbsp;&nbsp;
						<input type="checkbox"> �\�I�޲z
						<input type="hidden" name="function_no" value="6" > 
						<input type="hidden" name="auth_status" value="N">
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"> �|����ƺ޲z
						<input type="hidden" name="function_no" value="7" > 
						<input type="hidden" name="auth_status" value="N">
						 &nbsp;&nbsp;
						<input type="checkbox"> �{������
						<input type="hidden" name="function_no" value="8" >
						<input type="hidden" name="auth_status" value="N">
						<br>
						<input type="checkbox"> �q��޲z
						<input type="hidden" name="function_no" value="9" > 
						<input type="hidden" name="auth_status" value="N">
						 &nbsp;&nbsp;
						<input type="checkbox"> ���|�޲z
						<input type="hidden" name="function_no" value="10" > 
						<input type="hidden" name="auth_status" value="N">
						 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="checkbox"> �̷s�����޲z
						<input type="hidden" name="function_no" value="11" >
						<input type="hidden" name="auth_status" value="N">
						 &nbsp;&nbsp;
						<input type="checkbox"> �ȪA�p����
						<input type="hidden" name="function_no" value="12" > 
						<input type="hidden" name="auth_status" value="N">
					</div>	
					
					
									
				</div>
				<div class="modal-footer">
					<input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
					<input type="hidden" name="action" value="insert">
<%-- 					<input type="hidden" name="requestURL"	value="<%=request.getServletPath()%>"> --%>
					<input type="submit" class="btn btn-success" value="Add">
				</div>
			</form>
		</div>
	</div>
</div>

                </main>

            </div>
     
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/back-home/js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="<%=request.getContextPath()%>/css/demo/datatables-demo.js"></script>
    	
<script src="js/jquery.min.js"></script>
<script src="js/popper.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/main.js"></script>
    </body>
    
    


    
	<!-- =========================================�H�U�� datetimepicker �������]�w========================================== -->

<%
	java.sql.Date hiredate = null;
	try {
		hiredate = employeeVO.getHiredate();
	} catch (Exception e) {
		hiredate = new java.sql.Date(System.currentTimeMillis());
	}
%>

<%
	java.sql.Date quitdate = null; 
	try { 
		quitdate = employeeVO.getQuitdate(); 
	} catch (Exception e) { 
		quitdate = new java.sql.Date(System.currentTimeMillis()); 
	} 
%>


<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script
	src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
.xdsoft_datetimepicker .xdsoft_datepicker {
	width: 300px; /* width:  300px; */
}

.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
	height: 151px; /* height:  151px; */
}
</style>


<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=hiredate%>',  // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
           //startDate:	            '2017/07/10',  // �_�l��
           //minDate:               '-1970-01-01', // �h������(���t)���e
           //maxDate:               '+1970-01-01'  // �h������(���t)����
        });
        
        $.datetimepicker.setLocale('zh');
        $('#f_date2').datetimepicker({
	       theme: '',              //theme: 'dark',
	       timepicker:false,       //timepicker:true,
	       step: 1,                //step: 60 (�o�Otimepicker���w�]���j60����)
	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
		   value: '<%=quitdate%>',   // value:   new Date(),
	//disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // �h���S�w���t
	//startDate:	            '2017/07/10',  // �_�l��
	//minDate:               '-1970-01-01', // �h������(���t)���e
	//maxDate:               '+1970-01-01'  // �h������(���t)����
	});
        
    $("input[type=checkbox]").click(function(){
       	if($(this).prop("checked")==true){
	       	$(this).next().next().val("Y");
       	}else{
       		$(this).next().next().val("N");
       	}
    })
        
</script>   

<script>

<c:forEach var="authList" varStatus="status" items="${sessionScope.authList}">
var index = ${authList.getFunction_no()} -1;
var tree = document.getElementsByClassName("nav-link function")[index]
	if(`${authList.getAuth_status()}`=='N'){
		tree.style.display="none";
	}
	
	if(${authList.function_no} == ${status.count}){
		if(${authList.auth_status == "Y"}){
			funno${status.count}= true;
		}else { 
			funno${status.count} = false;
		} 
	}
	
</c:forEach>


if(funno1 == false){
	$("#employee_management").hide();
}

if(funno2 == false && funno3 == false && funno4 == false && funno5 == false && funno6 == false){
	$("#movie_management").hide();
}

if(funno7 == false){
	$("#member_management").hide();
}

if(funno8 == false && funno9 == false){
	$("#ticket_management").hide();
}

if(funno10 == false){
	$("#comment_management").hide();
}

if(funno11 == false){
	$("#news_management").hide();
}

if(funno12 == false){
	$("#customer_service").hide();
}

// var tree = document.getElementsByClassName("nav-link function")
//  document.getElementById("demo").innerHTML = tree.length;

</script>
     
    
</html>
