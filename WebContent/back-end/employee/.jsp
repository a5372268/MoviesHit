<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.movie.model.*"%>
<%@ page import="com.comment.model.*"%>

<%
	MovieService movieSvc1 = new MovieService();
	List<MovieVO> list = movieSvc1.getAll();
	pageContext.setAttribute("list", list);
%>
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
                <a class="nav-link dropdown-toggle1" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
            </li>
            <a class="nav-link" href="index.html">
               	 �n�X
            </a>
        </ul>
    </nav>
    
    
    
    
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <img src="<%=request.getContextPath()%>/back-home/img/logo2-1-5.png">
                        <a class="nav-link collapsed" href="tables3.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-alt"></i></div>
                           	 �򥻸��
                        </a>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts1" aria-expanded="false" aria-controls="collapseLayouts1">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-cog"></i></div>
                           	 ���u�޲z�t��
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%=request.getContextPath()%>/back-end/employee/listAllEmployee.jsp">���u�޲z</a>
                                <a class="nav-link" href="layout-sidenav-light.html">���u�v���޲z</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                            <div class="sb-nav-link-icon"><i class="fas fa-video"></i></div>
                         	   �v���򥻸�ƨt��
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="layout-static.html">�����޲z</a>
                                <a class="nav-link" href="<%=request.getContextPath()%>/back-home/table.jsp">�q�v��ƺ޲z</a>
                                <a class="nav-link" href="<%=request.getContextPath()%>/back-end/report_comment/listAllReportComment.jsp">�������|</a>
                                <a class="nav-link" href="layout-sidenav-light.html"> �U�|�޲z</a>
                                <a class="nav-link" href="layout-sidenav-light.html">�y��޲z</a>
                                <a class="nav-link" href="layout-sidenav-light.html">���غ޲z</a>
                                <a class="nav-link" href="layout-sidenav-light.html">�\�I�޲z</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages2" aria-expanded="false" aria-controls="collapsePages2">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-clock"></i></div>
                            	�|���޲z�t��
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages2" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%=request.getContextPath()%>/back-end/mem/listAllMem.jsp">�|����ƺ޲z</a>
                                <a class="nav-link" href="layout-sidenav-light.html">�|���f��</a>
                                <a class="nav-link" href="layout-sidenav-light.html"> �M�~���׼f��</a>
                            </nav>
                        </div>
                        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages3" aria-expanded="false" aria-controls="collapsePages3">
                            <div class="sb-nav-link-icon"><i class="fas fa-ticket-alt"></i></div>
                        	    �Ⲽ�޲z
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages3" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="layout-static.html">�{������</a>
                                <a class="nav-link" href="layout-sidenav-light.html">�d�߽u�W�q��</a>
                            </nav>
                        </div>
           				 <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages4" aria-expanded="false" aria-controls="collapsePages4">
                            <div class="sb-nav-link-icon"><i class="fas fa-user-alt-slash"></i></div>
                          	  ���|�޲z
                          	<div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapsePages4" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="<%=request.getContextPath()%>/back-end/report_comment/listAllReportComment.jsp">�������|</a>
                                <a class="nav-link" href="layout-sidenav-light.html">XXX���|</a>
                            </nav>
                        </div>
                        <a class="nav-link" href="tables1.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-bullhorn"></i></div>
                           	 �޲z�̷s����
                        </a>
                        <a class="nav-link" href="tables2.html">
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
                    <div class="container-fluid">
                        <h1 class="mt-4">��x�s���Ҧ��q�v</h1>
                        <a href="<%=request.getContextPath()%>/back-end/movie/addMovie.jsp" class="btn btn-success" ><i class="material-icons">&#xE147;</i><span>Add New Movie</span></a>
<!--                         <ol class="breadcrumb mb-4"> -->
<!--                             <li class="breadcrumb-item"> -->
                            
<!--                             </li> -->
<!--                         </ol> -->
							<nav class="navbar navbar-light breadcrumb mb-4" style="background-color: #75D9B5;">
							    <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/movie/movie.do" name="form1" class="form-inline my-2 my-lg-0 composite-query">
									<br><div class="form-row">
										�j�M�q�v:&ensp;
										<div class="form-group col-2">
											 <input type="text" name="MOVIE_NAME" value="" class="form-control" placeholder="��J�q�v�W��" size="10"><br>
										</div>
										
<!-- 										<div class="form-group col-2"> -->
<!-- 											<input type="text" name="DIRECTOR" value="" class="form-control" placeholder="�п�J�ɺt" size="10"><br> -->
<!-- 										</div>&ensp; -->
								       
<!-- 								       <div class="form-group col-2"> -->
<!-- 											<input type="text" name="ACTOR" value="" class="form-control" placeholder="�п�J�t��" size="10"><br> -->
<!-- 										</div>&ensp; -->
								      
										<div class="form-group col-2">
								       <select  name="category" class="form-control form-control-sm" style="height:38px;">
											<option value="">�������</option>
											<option value="�ʧ@��">�ʧ@��</option>
											<option value="�_�I��">�_�I��</option>
											<option value="��ۤ�">��ۤ�</option>
											<option value="�Ǹo��">�Ǹo��</option>
											<option value="ĵ���">ĵ���</option>
											<option value="�߼@��">�߼@��</option>
											<option value="�@����">�@����</option>
											<option value="�R����">�R����</option>
								       	</select><br>
								       	</div>
								       	
								       	<div class="form-group col-2">
								       	<select size="1" name="STATUS" class="form-control form-control-sm" style="height:38px;">
											<option value="">��ܹq�v���A</option>
											<option value="0">�W�M��</option>
											<option value="1">���W�M</option>
											<option value="2">�w�U��</option>
							      		</select><br>
							    		</div>
							    		
							    		<div class="form-group col-2">
											<input type="text" name="PREMIERE_DT" id="f_date1" class="form-control" placeholder="��J�W�M���" size="12">&ensp;
							 		       <input type="text" name="OFF_DT" id="f_date2" class="form-control" placeholder="��J�U�M���" size="12"><br> 
										</div>
								       	
							       		<div class="form-group col-2">
							       		<select size="1" name="GRADE" class="form-control form-control-sm" style="height:38px;">
											<option value="">��ܤ���</option>
											<option value="0">���M��</option>
											<option value="1">�O�@��</option>
											<option value="2">���ɯ�</option>
											<option value="3">�����</option>
							       		</select><br>
										</div>
										
										<div class="form-group col-2">
											<input type="hidden" name="action" value="listMovies_ByCompositeQuery_back">
									      	<button class="btn btn-danger btn-sm" type="submit" value="�e�X">�j�M</button>
								      	</div>
									</div><br>
							     </FORM>
							</nav>
                           
                           
                           
                            <div class="card-body">
                                <div class="table-responsive">
<%--                                 <%@ include file="pages/page1.file"%> --%>
                                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                        <thead>
                                            <tr>
                                                <th align="center">�@��1</th>
												<th align="center">�@��2</th>
<!-- 												<th align="center">�ɺt</th> -->
<!-- 												<th align="center">�t��</th> -->
												<th align="center">����</th>
												<th align="center">����</th>
												<th align="center">���A</th>
												<th align="center">�W�M/�U�M</th>
												<th align="center">����</th>
												<th align="center">�w�i��</th>
												<th align="center">�ק�</th>
												<th align="center">�R��</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="movieVO" items="${list}">

										  <tr  ${(movieVO.movieno == param.movieno) ? 'style="background-color:#7d4627;"':''}>
											<td>
												<a href="${pageContext.request.contextPath}/movie/movie.do?action=getOne_For_Display&movieno=${movieVO.movieno}">
												<img src="${pageContext.request.contextPath}/movie/DBGifReader1.do?movieno=${movieVO.movieno}" 
												alt="�|�L�Ϥ�" width="80px;" height="100px" title="${movieVO.moviename}"/> 
												<span  style="text-align: center; display:block; font-size:10px; font-weight:bold;">${movieVO.moviename}</span></a></td>
											<td>
												<a href="${pageContext.request.contextPath}/movie/movie.do?action=getOne_For_Display&movieno=${movieVO.movieno}">
												<img src="${pageContext.request.contextPath}/movie/DBGifReader2.do?movieno=${movieVO.movieno}" 
												alt="�|�L�Ϥ�" width="80px;" height="100px" title="${movieVO.moviename}"/></a></td>
											
<%-- 											<td width="50px;">${movieVO.director}</td> --%>
<%-- 											<td width="50px;">${movieVO.actor}</td> --%>
											<td width="80px;">${movieVO.category}</td>
											
											<c:choose>
												<c:when test="${movieVO.length >0}">
													<td width="90px;">${movieVO.length}����</td>
												</c:when>
												<c:otherwise>
													<td width="90px;">�|�L�ɶ�</td>
												</c:otherwise>
											</c:choose>
											
											<c:choose>
												<c:when test="${movieVO.status.equals('0')}">
													<td width="70px;">�W�M��</td>
												</c:when>
												<c:when test="${movieVO.status.equals('1')}">
													<td width="70px;">���W�M</td>
												</c:when>
												<c:when test="${movieVO.status.equals('2')}">
													<td width="70px;">�w�U��</td>
												</c:when>
												<c:otherwise>
													<td width="70px;">�L�Ī��A</td>
												</c:otherwise>
											</c:choose>
											
											<td width="105px;">
												<fmt:formatDate value="${movieVO.premiredate}" pattern="yyyy-MM-dd" /><br>
												<fmt:formatDate value="${movieVO.offdate}" pattern="yyyy-MM-dd" />
											</td>
											
											<c:choose>
												<c:when test="${movieVO.grade.equals('0')}">
													<td width="70px;">���M��</td>
												</c:when>
												<c:when test="${movieVO.grade.equals('1')}">
													<td width="70px;">�O�@��</td>
												</c:when>
												<c:when test="${movieVO.grade.equals('2')}">
													<td width="70px;">���ɯ�</td>
												</c:when>
												<c:when test="${movieVO.grade.equals('3')}">
													<td width="70px;">�����</td>
												</c:when>
												<c:otherwise>
													<td width="70px;">�|������</td>
												</c:otherwise>
											</c:choose>
												
											<td width="50px;"><a class="w3_play_icon1" href="${movieVO.trailor}">�[��</a></td>
		<!-- 									<td> -->
		<!-- 										<div id="coverImg" onclick="onPlayerReady()">  -->
		<!-- 										<a class="w3_play_icon1" >�[��</a></div>  -->
		<!-- 										<div id="ytplayer" style="display:none"></div> -->
		<!-- 									</td> -->
											
											<td width="50px;">
												<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/movie/movie.do" style="margin-bottom: 0px;">
													<input type="submit" value="�ק�"
													 class="btn btn-outline-danger" style="border:2px #B7B7B7 solid;border-radius:10px; background-color:#73BDBE; font-weight:bold; color:white;"> 
													<input type="hidden" name="movieno" value="${movieVO.movieno}"> 
													<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
													<!--�e�X�����������|��Controller-->
													<input type="hidden" name="whichPage">
													<!--�e�X��e�O�ĴX����Controller-->
													<input type="hidden" name="action" value="getOne_For_Update">
												</FORM>
											</td>
											
											<td width="50px;">
												<FORM METHOD="post" ACTION="<%=request.getContextPath()%>/movie/movie.do" style="margin-bottom: 0px;">
													<input type="submit" value="�R��"
													class="btn btn-outline-danger" style="border:2px #B7B7B7 solid;border-radius:10px; background-color:#FC9C9D; font-weight:bold; color:white;"> 
													<input type="hidden" name="movieno" value="${movieVO.movieno}"> 
													<input type="hidden" name="requestURL" value="<%=request.getServletPath()%>">
													<!--�e�X�����������|��Controller-->
													<input type="hidden" name="whichPage" >
													<!--�e�X��e�O�ĴX����Controller-->
													<input type="hidden" name="action" value="delete">
												</FORM>
											</td>
										</tr>
									</c:forEach>
<!-- 							======��o��===== -->
                                            <tr>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
                                                <td></td>
<!--                                                 <td></td> -->
                                            </tr>
                                         
                                           
                                        </tbody>
                                    </table>
<%--                                     <%@ include file="pages/page2.file"%> --%>
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
    </body>
</html>
