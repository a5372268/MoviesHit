<%@ page contentType="text/html; charset=UTF-8" pageEncoding="Big5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.*"%>
<%@ page import="com.movie.model.*"%>
<%@ page import="com.comment.model.*"%>

<%
	MovieService movieSvc = new MovieService();	
	List<MovieVO> listTopFive = movieSvc.getTopFive();
	pageContext.setAttribute("listTopFive", listTopFive);
	
	List<MovieVO> latestMovie = movieSvc.getLatestMovie();
	pageContext.setAttribute("latestMovie", latestMovie);
%>

<!DOCTYPE html>
<html>
<head>
    <title>MoviesHit</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=big5" />
    <meta name="keywords" content="Movies Pro Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
    Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
    <script type="application/x-javascript">
        addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);

        function hideURLbar() { window.scrollTo(0, 1); }
    </script>
    <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
    <!-- pop-up -->
    <link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />
    <!-- //pop-up -->
    <link href="css/easy-responsive-tabs.css" rel='stylesheet' type='text/css' />
    <link rel="stylesheet" type="text/css" href="css/zoomslider.css" />
    <link rel="stylesheet" type="text/css" href="css/style.css" />
    <link rel="stylesheet" type="text/css" href="css/styleForMH.css" />
    <link href="css/font-awesome.css" rel="stylesheet">
    <script type="text/javascript" src="js/modernizr-2.6.2.min.js"></script>
    <!--/web-fonts-->
    <link href='//fonts.googleapis.com/css?family=Tangerine:400,700' rel='stylesheet' type='text/css'>
    <link href="//fonts.googleapis.com/css?family=Lato:100,100i,300,300i,400,400i,700,700i,900" rel="stylesheet">
    <link href='//fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
    <!--//web-fonts-->
</head>

<body>
    <!--/main-header-->
    <!--/banner-section-->
    <div id="demo-1" data-zs-src='["images/2.jpg", "images/1.jpg", "images/3.jpg","images/4.jpg"]' data-zs-overlay="dots">
        <div class="demo-inner-content">
            <!--/header-w3l-->
            <div class="header-w3-agileits" id="home">
                <div class="inner-header-agile">
                    <nav class="navbar navbar-default">
                        <div class="navbar-header">
                            <!--                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"> -->
                            <!--                            <span class="sr-only">Toggle navigation</span> -->
                            <!--                            <span class="icon-bar"></span> -->
                            <!--                            <span class="icon-bar"></span> -->
                            <!--                            <span class="icon-bar"></span> -->
                            <!--                        </button> -->
                            <h1><a href="<%=request.getContextPath()%>/index.jsp"><span>M</span>ovies<span>H</span>it<img src="images/logo.png" width=40 height=40></a></h1>
                        </div>
                        <!-- navbar-header -->
                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                            <ul class="nav navbar-nav">
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">�|���M�� <b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-2">
                                        <li>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="<%=request.getContextPath()%>/back-end/mem/select_page.jsp">�|���n�J</a></li>
                                                    <li><a href="genre.html">�ӽз|��</a></li>
                                                    <li><a href="genre.html">�q������</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="horror.html">���ά���</a></li>
                                                    <li><a href="genre.html">�|���A��</a></li>
                                                    <li><a href="genre.html">�|��QA</a></li>
                                                </ul>
                                            </div>
                                            <!-- <div class="clearfix"></div> -->
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">�q�v����<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-3">
                                        <li>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="<%=request.getContextPath()%>/front-end/movie/select_movie_page.jsp">�j�M�q�v</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�ʧ@��">�ʧ@��</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�@����">�@����</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�Ǹo��">�Ǹo��</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=���Ƥ�">���Ƥ�</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�߼@��">�߼@��</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�ʵe��">�ʵe��</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="<%=request.getContextPath()%>/front-end/movie/listAllMovie.jsp">�Ҧ��q�v</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�_�I��">�_�I��</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�Ԫ���">�Ԫ���</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=ĵ���">ĵ���</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�宪��">�宪��</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�R����">�R����</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=���֤�">���֤�</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-4">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">���N�v�]</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=��ۤ�">��ۤ�</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�v�֤�">�v�֤�</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�_�ۤ�">�_�ۤ�</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�a�ä�">�a�ä�</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=������">������</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&CATEGORY=�q�R�@">�q�R�@</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">�q�v����<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-2">
                                        <li>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="<%=request.getContextPath()%>/front-end/comment/select_comment_page.jsp">�j�M����</a></li>
                                                    <li><a href="genre.html">����</a></li>
                                                </ul>
                                            </div>
                                        <li>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="<%=request.getContextPath()%>/front-end/comment/listAllComment.jsp">�Ҧ�����</a></li>
                                                    <li><a href="genre.html">�Sԣ�n��</a></li>
                                                </ul>
                                            </div>
                                        <li>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">���γ��<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-2">
                                        <li>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">�j�M����</a></li>
                                                    <li><a href="genre.html">�ֳt����</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">�j�M����</a></li>
                                                    <li><a href="genre.html">�ֳt����</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">�Q�װ�<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-2">
                                        <li>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">�Q��ԣ</a></li>
                                                    <li><a href="genre.html">�Q�קA</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">�Q��ԣ</a></li>
                                                    <li><a href="genre.html">�Q�קA</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">�\��<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-2">
                                        <li>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">�n�Yԣ</a></li>
                                                    <li><a href="genre.html">�Y�˧a</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-6">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">�n�Yԣ</a></li>
                                                    <li><a href="genre.html">�Y�˧a</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="dropdown">
                                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">���i<b class="caret"></b></a>
                                    <ul class="dropdown-menu multi-column columns-1">
                                        <li>
                                            <div class="col-sm-12">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">�v�����i</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-12">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">�v������</a></li>
                                                </ul>
                                            </div>
                                            <div class="col-sm-12">
                                                <ul class="multi-column-dropdown">
                                                    <li><a href="genre.html">�X�@�٦�</a></li>
                                                </ul>
                                            </div>
                                            <div class="clearfix"></div>
                                        </li>
                                    </ul>
                                </li>
                                <li class="active"><a href="index.html">�v������</a></li>
                            </ul>
                        </div>
                        <div class="clearfix"> </div>
                    </nav>
                    <div class="w3ls_search">
						<div class="cd-main-header">
							<ul class="cd-header-buttons">
								<li><a class="cd-search-trigger" href="#cd-search"> <span></span></a></li>
							</ul> <!-- cd-header-buttons -->
						</div>
						<div id="cd-search" class="cd-search">
							<form method="post" action="<%=request.getContextPath()%>/movie/movie.do" name="form1">
								<input type="text" name="MOVIE_NAME" value="" placeholder="�п�J�q�v�W��" onkeydown="if (event.keyCode == 13) sendMessage();">
								<input type="hidden" name="action" value="listMovies_ByCompositeQuery">
							</form>
						</div>
					</div>
                </div>
            </div>
            <!--//header-w3l-->
            <!--/banner-info-->
            <div class="baner-info">
                <h3>�i <span>��</span> �q �v </h3>
                <h4>In space no one can hear you scream.</h4>
                <a class="w3_play_icon1" href="#small-dialog1">
                   	�[ �� �w �i
                </a>
            </div>
            <!--/banner-ingo-->
        </div>
    </div>
    <!--/banner-section-->
    <!--//main-header-->
    <!--/banner-bottom-->
    <div class="w3_agilits_banner_bootm">
        <div class="w3_agilits_inner_bottom">
            <div class="col-md-6 wthree_agile_login">
                <ul>
                    <li><i class="fa fa-phone" aria-hidden="true"></i> (+886) 0912 345 678</li>
                    <li><a href="#" class="login" data-toggle="modal" data-target="#myModal4">�n�J</a></li>
                    <li><a href="#" class="login reg" data-toggle="modal" data-target="#myModal5">���U</a></li>
                </ul>
            </div>
        </div>
    </div>
    <!--//banner-bottom-->
    <!-- Modal1 -->
    <div class="modal fade" id="myModal4" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4>Login</h4>
                    <div class="login-form">
                        <form action="#" method="post">
                            <input type="email" name="email" placeholder="E-mail" required="">
                            <input type="password" name="password" placeholder="Password" required="">
                            <div class="tp">
                                <input type="submit" value="LOGIN NOW">
                            </div>
                            <div class="forgot-grid">
                                <div class="log-check">
                                    <label class="checkbox"><input type="checkbox" name="checkbox">Remember me</label>
                                </div>
                                <div class="forgot">
                                    <a href="#" data-toggle="modal" data-target="#myModal2">Forgot Password?</a>
                                </div>
                                <div class="clearfix"></div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //Modal1 -->
    <!-- Modal1 -->
  
<!--    �q��+�峹�϶��}�l -->
   <section class="booking_area">
   	<div class="container-fluid">
   		<div class="row">
   		
   		 <!-- �q���}�l-->
   			<div class="col-sm-4">
		    	<div class="booking-form">
                	<div class="form-header">
                       <h1>�q��</h1>
                    </div>
                    <form>
                    	<div class="form-group">
                        	<span class="form-label">�q�v</span>
                        	<select class="form-control">
                               <option>���q�p��</option>
                               <option>�Y��ϴ�</option>
                               <option>�P�ڤj�� �Ѧ�̪��U�_</option>
                               <option>���l�u��</option>
                               <option>���N�Ԥj�Ԫ���</option>
                            </select>
                            <span class="select-arrow"></span>
                        </div>
                        <div class="form-group">
                           <span class="form-label">����</span>
                           <select class="form-control">
                               <option>�����@</option>
                               <option>�����G</option>
                               <option>�����T</option>
                               <option>�����|</option>
                               <option>������</option>
                           </select>
                           <span class="select-arrow"></span>
                        </div>
                        <div class="form-group">
                           <span class="form-label">��M�ɶ�</span>
                           <input class="form-control" type="datetime-local" required>
                        </div>
                        <div class="form-btn">
                           <button class="submit-btn">Book Now</button>
                        </div>
                    </form>
            	</div>
   			</div>
   			<!-- �q������-->
			<!--�峹�}�l -->
   			<div class="col-sm-8">
				 <div class="container article-form">
                    <div class="article-table table-responsive">
                        <div class="table-header">
                            <h1>�����峹</h1>
                        </div>
                        <table class="table">
                            <thead class="thead-light">
                                <tr class="success">
                                    <th scope="col">#</th>
                                    <th scope="col">���D</th>
                                    <th scope="col">���e</th>
                                    <th scope="col">�o��ɶ�</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>ť���c�F�j���N���}��</td>
                                    <td>���}��</td>
                                    <td>2021-03-20 00:00</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>�A���W�l�n�n�ݳ�</td>
                                    <td>�G�ƫܷP�H�A�e�����u���C�t���]�ܨ��!</td>
                                    <td>2021-03-20 00:00</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td>�ѯ઺�[��߱o</td>
                                    <td>�ڬݤ�����!!!</td>
                                    <td>2021-03-12 00:00</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td>�s���P�����̷s����</td>
                                    <td>�ڷ|���A�A���ާA�b���̡AGOODLUCK!</td>
                                    <td>2021-03-12 00:00</td>
                                </tr>
                                <tr>
                                    <th scope="row">5</th>
                                    <td>��MOVIESHIT�����q��</td>
                                    <td>���x�e500�I�ơA�A�e�]����!</td>
                                    <td>2021-04-01 00:00</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>   				
   			</div>
   			<!-- �峹����-->
   		</div>
   	</div>
   </section>
	<!--�q��+�峹�϶����� -->


    <div class="modal fade" id="myModal5" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4>Register</h4>
                    <div class="login-form">
                        <form action="#" method="post">
                            <input type="text" name="name" placeholder="Name" required="">
                            <input type="email" name="email" placeholder="E-mail" required="">
                            <input type="password" name="password" placeholder="Password" required="">
                            <input type="password" name="conform password" placeholder="Confirm Password" required="">
                            <div class="signin-rit">
                                <span class="agree-checkbox">
                                    <label class="checkbox"><input type="checkbox" name="checkbox">I agree to your <a class="w3layouts-t" href="#" target="_blank">Terms of Use</a> and <a class="w3layouts-t" href="#" target="_blank">Privacy Policy</a></label>
                                </span>
                            </div>
                            <div class="tp">
                                <input type="submit" value="REGISTER NOW">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <!-- //Modal1 -->
    <!--/content-inner-section-->
    <div class="w3_content_agilleinfo_inner">
        <div class="agile_featured_movies">
            <!--/agileinfo_tabs-->
            <div class="agileinfo_tabs">
                <!--/tab-section-->
                <div id="horizontalTab">
                    <ul class="resp-tabs-list">
                        <li>�W�M��</li>
                        <li>���к]</li>
                        <li>�Y�N�W�M</li>
                    </ul>
                           
                    <div class="resp-tabs-container">
                        <div class="tab1">
                            <div class="tab_movies_agileinfo">
                                <div class="w3_agile_featured_movies">
                                    <div class="col-md-5 video_agile_player">
                                        <div class="video-grid-single-page-agileits">
                                            <div data-video="f2Z65fobH2I" id="video"> <img src="images/11.jpg" alt="" class="img-responsive" /> </div>
                                        </div>
                                        <div class="player-text">
                                            <p class="fexi_header">Force 2</p>
                                            <p class="fexi_header_para"><span class="conjuring_w3">Story Line<label>:</label></span>Presenting the official trailer of Force 2 starring John Abraham, Sonakshi Sinha and Tahir Raj Bhasin
                                                A film by Abhinay Deo, Produced by Vipul Amrutlal Shah, JA entertainment Pvt. Ltd....</p>
                                            <p class="fexi_header_para"><span>Release On<label>:</label></span>Sep 29, 2016 </p>
                                            <p class="fexi_header_para">
                                                <span>Genres<label>:</label> </span>
                                                <a href="genre.html">Drama</a> |
                                                <a href="genre.html">Adventure</a> |
                                                <a href="genre.html">Family</a>
                                            </p>
                                            <p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
                                                <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-7 wthree_agile-movies_list">
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m1.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
<%--                                                 	<td><FORM METHOD="post" ACTION="<%=request.getContextPath()%>/movie/movie.do" --%>
<!-- 														style="margin-bottom: 0px;"> -->
<%-- 													<input type="submit" name="thisMovieComments" value="${movieVO.movieno}" style="border: none;"> <input --%>
<!-- 															type="hidden" name="action" value="getOne_For_Display"> -->
<%-- 													<h6><a href="single.html">${movieVO.moviename} </a></h6> --%>
<!--                                                     </FORM></td> -->
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                       
                                       
                                       
                                       
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m2.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Me Before you</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m3.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Deadpool</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m4.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Rogue One </a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m5.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Storks </a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m6.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Hopeless</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m7.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Mechanic</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m8.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Timeless</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="cleafix"></div>
                            </div>
                        </div>
                        <div class="tab2">
                            <div class="tab_movies_agileinfo">
                                <div class="w3_agile_featured_movies">
                                    <div class="col-md-5 video_agile_player">
                                        <div class="video-grid-single-page-agileits">
                                            <div data-video="fNKUgX8PhMA" id="video1"> <img src="images/22.jpg" alt="" class="img-responsive" /> </div>
                                        </div>
                                        <div class="player-text">
                                            <p class="fexi_header">Me Before You </p>
                                            <p class="fexi_header_para"><span class="conjuring_w3">Story Line<label>:</label></span>Me Before You Official Trailer #2 (2016) - Emilia Clarke, Sam Claflin Movie HD
                                                A girl in a small town forms an unlikely bond with a recently-paralyzed man she's taking care of....</p>
                                            <p class="fexi_header_para"><span>Release On<label>:</label></span>Feb 3, 2016 </p>
                                            <p class="fexi_header_para">
                                                <span>Genres<label>:</label> </span>
                                                <a href="genre.html">Drama</a> |
                                                <a href="genre.html">Adventure</a> |
                                                <a href="genre.html">Family</a>
                                            </p>
                                            <p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
                                                <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-7 wthree_agile-movies_list">
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m9.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Inferno</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m10.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Now You See Me 2</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m11.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Warcraft</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m12.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Money Monster</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m13.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Ghostbuster</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m14.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Rambo 4</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m15.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">RoboCop</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m16.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">X-Men</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="cleafix"></div>
                            </div>
                        </div>
                        <div class="tab3">
                            <div class="tab_movies_agileinfo">
                                <div class="w3_agile_featured_movies">
                                    <div class="col-md-5 video_agile_player">
                                        <div class="video-grid-single-page-agileits">
                                            <div data-video="BXEZFd0RT5Y" id="video2"> <img src="images/44.jpg" alt="" class="img-responsive" /> </div>
                                        </div>
                                        <div class="player-text">
                                            <p class="fexi_header">Storks </p>
                                            <p class="fexi_header_para"><span class="conjuring_w3">Story Line<label>:</label></span>Starring: Andy Samberg, Jennifer Aniston, Ty Burrell Storks Official Trailer 3 (2016) - Andy Samberg Movie the company's top delivery stork, lands in hot water when the Baby Factory produces an adorable....... </p>
                                            <p class="fexi_header_para"><span>Release On<label>:</label></span>Aug 1, 2016 </p>
                                            <p class="fexi_header_para">
                                                <span>Genres<label>:</label> </span>
                                                <a href="genre.html">Drama</a> |
                                                <a href="genre.html">Adventure</a> |
                                                <a href="genre.html">Family</a>
                                            </p>
                                            <p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
                                                <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                                <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                            </p>
                                        </div>
                                    </div>
                                    <div class="col-md-7 wthree_agile-movies_list">
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m1.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Swiss Army Man </a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m2.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Me Before you</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m3.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Deadpool</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m4.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Rogue One </a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m5.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Storks</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m6.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Hopeless</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m7.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Mechanic</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                        <div class="w3l-movie-gride-agile">
                                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m8.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                            </a>
                                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                                <div class="w3l-movie-text">
                                                    <h6><a href="single.html">Timeless</a></h6>
                                                </div>
                                                <div class="mid-2 agile_mid_2_home">
                                                    <p>2016</p>
                                                    <div class="block-stars">
                                                        <ul class="w3l-ratings">
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                        </ul>
                                                    </div>
                                                    <div class="clearfix"></div>
                                                </div>
                                            </div>
                                            <div class="ribben">
                                                <p>NEW</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"> </div>
                                </div>
                                <div class="cleafix"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--//tab-section-->
            <h3 class="agile_w3_title"> Latest <span>Movies</span></h3>
            <!--/movies-->
            <div class="w3_agile_latest_movies">
                <div id="owl-demo" class="owl-carousel owl-theme">
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m5.jpg" title="Movies Pro" class="img-responsive" alt=" " />
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Storks </a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben one">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m6.jpg" title="Movies Pro" class="img-responsive" alt=" " />
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Hopeless</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben one">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m7.jpg" title="Movies Pro" class="img-responsive" alt=" " />
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Mechanic</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben one">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m8.jpg" title="Movies Pro" class="img-responsive" alt=" " />
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Timeless</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben one">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m3.jpg" title="Movies Pro" class="img-responsive" alt=" " />
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Deadpool</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben one">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m11.jpg" title="Movies Pro" class="img-responsive" alt=" " />
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Warcraft</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben one">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m14.jpg" title="Movies Pro" class="img-responsive" alt=" " />
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Rambo 4</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben one">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m13.jpg" title="Movies Pro" class="img-responsive" alt=" " />
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">Ghostbuster</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben one">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="w3l-movie-gride-agile w3l-movie-gride-slider ">
                            <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m15.jpg" title="Movies Pro" class="img-responsive" alt=" " />
                                <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                            </a>
                            <div class="mid-1 agileits_w3layouts_mid_1_home">
                                <div class="w3l-movie-text">
                                    <h6><a href="single.html">RoboCop</a></h6>
                                </div>
                                <div class="mid-2 agile_mid_2_home">
                                    <p>2016</p>
                                    <div class="block-stars">
                                        <ul class="w3l-ratings">
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                            <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                            <div class="ribben one">
                                <p>NEW</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--//movies-->
            <h3 class="agile_w3_title">Requested <span>Movies</span> </h3>
            <!--/requested-movies-->
            <div class="wthree_agile-requested-movies">
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m1.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Swiss Army Man</a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m2.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Me Before you</a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m3.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Deadpool</a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m4.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Rogue One </a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m5.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Storks </a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m6.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Hopeless</a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m7.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Mechanic</a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m8.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Timeless</a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m9.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Inferno</a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="col-md-2 w3l-movie-gride-agile requested-movies">
                    <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m11.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                        <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                    </a>
                    <div class="mid-1 agileits_w3layouts_mid_1_home">
                        <div class="w3l-movie-text">
                            <h6><a href="single.html">Warcraft</a></h6>
                        </div>
                        <div class="mid-2 agile_mid_2_home">
                            <p>2016</p>
                            <div class="block-stars">
                                <ul class="w3l-ratings">
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                </ul>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                    <div class="ribben one">
                        <p>NEW</p>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
            <!--//requested-movies-->
            <!--/top-movies-->
            <h3 class="agile_w3_title">Top<span>Movies</span> </h3>
            <div class="top_movies">
                <div class="tab_movies_agileinfo">
                    <div class="w3_agile_featured_movies two">
                        <div class="col-md-7 wthree_agile-movies_list second-top">
                            <div class="w3l-movie-gride-agile">
                                <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m1.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                </a>
                                <div class="mid-1 agileits_w3layouts_mid_1_home">
                                    <div class="w3l-movie-text">
                                        <h6><a href="single.html">Swiss Army Man</a></h6>
                                    </div>
                                    <div class="mid-2 agile_mid_2_home">
                                        <p>2016</p>
                                        <div class="block-stars">
                                            <ul class="w3l-ratings">
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="ribben">
                                    <p>NEW</p>
                                </div>
                            </div>
                            <div class="w3l-movie-gride-agile">
                                <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m2.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                </a>
                                <div class="mid-1 agileits_w3layouts_mid_1_home">
                                    <div class="w3l-movie-text">
                                        <h6><a href="single.html">Me Before you</a></h6>
                                    </div>
                                    <div class="mid-2 agile_mid_2_home">
                                        <p>2016</p>
                                        <div class="block-stars">
                                            <ul class="w3l-ratings">
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="ribben">
                                    <p>NEW</p>
                                </div>
                            </div>
                            <div class="w3l-movie-gride-agile">
                                <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m3.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                </a>
                                <div class="mid-1 agileits_w3layouts_mid_1_home">
                                    <div class="w3l-movie-text">
                                        <h6><a href="single.html">Deadpool</a></h6>
                                    </div>
                                    <div class="mid-2 agile_mid_2_home">
                                        <p>2016</p>
                                        <div class="block-stars">
                                            <ul class="w3l-ratings">
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="ribben">
                                    <p>NEW</p>
                                </div>
                            </div>
                            <div class="w3l-movie-gride-agile">
                                <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m4.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                </a>
                                <div class="mid-1 agileits_w3layouts_mid_1_home">
                                    <div class="w3l-movie-text">
                                        <h6><a href="single.html">Rogue One </a></h6>
                                    </div>
                                    <div class="mid-2 agile_mid_2_home">
                                        <p>2016</p>
                                        <div class="block-stars">
                                            <ul class="w3l-ratings">
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="ribben">
                                    <p>NEW</p>
                                </div>
                            </div>
                            <div class="w3l-movie-gride-agile">
                                <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m5.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                </a>
                                <div class="mid-1 agileits_w3layouts_mid_1_home">
                                    <div class="w3l-movie-text">
                                        <h6><a href="single.html">Storks </a></h6>
                                    </div>
                                    <div class="mid-2 agile_mid_2_home">
                                        <p>2016</p>
                                        <div class="block-stars">
                                            <ul class="w3l-ratings">
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="ribben">
                                    <p>NEW</p>
                                </div>
                            </div>
                            <div class="w3l-movie-gride-agile">
                                <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m6.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                </a>
                                <div class="mid-1 agileits_w3layouts_mid_1_home">
                                    <div class="w3l-movie-text">
                                        <h6><a href="single.html">Hopeless</a></h6>
                                    </div>
                                    <div class="mid-2 agile_mid_2_home">
                                        <p>2016</p>
                                        <div class="block-stars">
                                            <ul class="w3l-ratings">
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="ribben">
                                    <p>NEW</p>
                                </div>
                            </div>
                            <div class="w3l-movie-gride-agile">
                                <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m7.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                </a>
                                <div class="mid-1 agileits_w3layouts_mid_1_home">
                                    <div class="w3l-movie-text">
                                        <h6><a href="single.html">Mechanic</a></h6>
                                    </div>
                                    <div class="mid-2 agile_mid_2_home">
                                        <p>2016</p>
                                        <div class="block-stars">
                                            <ul class="w3l-ratings">
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="ribben">
                                    <p>NEW</p>
                                </div>
                            </div>
                            <div class="w3l-movie-gride-agile">
                                <a href="single.html" class="hvr-sweep-to-bottom"><img src="images/m8.jpg" title="Movies Pro" class="img-responsive" alt=" ">
                                    <div class="w3l-action-icon"><i class="fa fa-play-circle-o" aria-hidden="true"></i></div>
                                </a>
                                <div class="mid-1 agileits_w3layouts_mid_1_home">
                                    <div class="w3l-movie-text">
                                        <h6><a href="single.html">Timeless</a></h6>
                                    </div>
                                    <div class="mid-2 agile_mid_2_home">
                                        <p>2016</p>
                                        <div class="block-stars">
                                            <ul class="w3l-ratings">
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                                <li><a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                                <div class="ribben">
                                    <p>NEW</p>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-5 video_agile_player second-top">
                            <div class="video-grid-single-page-agileits">
                                <div data-video="BXEZFd0RT5Y" id="video3"> <img src="images/44.jpg" alt="" class="img-responsive" /> </div>
                            </div>
                            <div class="player-text two">
                                <p class="fexi_header">Storks </p>
                                <p class="fexi_header_para"><span class="conjuring_w3">Story Line<label>:</label></span>Starring: Andy Samberg, Jennifer Aniston, Ty Burrell
                                    Storks Official Trailer 3 (2016) - Andy Samberg Movie the company's top delivery stork, lands in hot water when the Baby Factory produces an adorable....... </p>
                                <p class="fexi_header_para"><span>Release On<label>:</label></span>Aug 1, 2016 </p>
                                <p class="fexi_header_para">
                                    <span>Genres<label>:</label> </span>
                                    <a href="genre.html">Drama</a> |
                                    <a href="genre.html">Adventure</a> |
                                    <a href="genre.html">Family</a>
                                </p>
                                <p class="fexi_header_para fexi_header_para1"><span>Star Rating<label>:</label></span>
                                    <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-star" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-star-half-o" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                    <a href="#"><i class="fa fa-star-o" aria-hidden="true"></i></a>
                                </p>
                            </div>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="cleafix"></div>
                </div>
            </div>
            <!--//top-movies-->
        </div>
    </div>
    <!--//content-inner-section-->
    <!--/footer-bottom-->
    <div class="contact-w3ls" id="contact">
        <div class="footer-w3lagile-inner">
            <div class="footer-grids w3-agileits">
                <div class="col-md-2 footer-grid">
                    <h4 class="b-log"><a><span>Y</span>ear</a></h4>
                    <ul>
                        <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByYear&year=2021" title="Release 2021">2021</a></li>
                        <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByYear&year=2020" title="Release 2020">2020</a></li>
                        <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByYear&year=2019" title="Release 2019">2019</a></li>
                        <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByYear&year=2018" title="Release 2018">2018</a></li>
                        <li><a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByYear&year=2017" title="Release 2017">2017</a></li>
                    </ul>
                </div>
                <div class="col-md-2 footer-grid">
                    <h4 class="b-log"><a><span>D</span>irector</a></h4>
                    <div class="footer-grid1">
                        <div class="footer-grid1-left">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&DIRECTOR=Steven Spielberg">
                                <img src="<%=request.getContextPath()%>/images/index/Steven Spielberg.jpg" alt=" " width="40px" height="50px"></a>
                        </div>
                        <div class="footer-grid1-right">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&DIRECTOR=Steven Spielberg">
                                Steven Spielberg</a>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="footer-grid1">
                        <div class="footer-grid1-left">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&DIRECTOR=Michael Bay">
                                <img src="<%=request.getContextPath()%>/images/index/Michael Bay.jpg" alt=" " width="40px" height="50px"></a>
                        </div>
                        <div class="footer-grid1-right">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&DIRECTOR=Michael Bay">
                                Michael Bay</a>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="footer-grid1">
                        <div class="footer-grid1-left">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&DIRECTOR=James Cameron">
                                <img src="<%=request.getContextPath()%>/images/index/James Cameron.jpg" alt=" " width="40px" height="50px"></a>
                        </div>
                        <div class="footer-grid1-right">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&DIRECTOR=James Cameron">
                                James Cameron</a>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="footer-grid1">
                        <div class="footer-grid1-left">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&DIRECTOR=Christopher Nolan">
                                <img src="<%=request.getContextPath()%>/images/index/Christopher Nolan.jpg" alt=" " width="40px" height="50px"></a>
                        </div>
                        <div class="footer-grid1-right">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&DIRECTOR=Christopher Nolan">
                                Christopher Nolan</a>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
                <div class="col-md-2 footer-grid">
                    <h4 class="b-log"><a><span>L</span>atest <span>M</span>ovie</a></h4>
                    <c:forEach var="movieVO" items="${latestMovie}">
                        <div class="footer-grid-instagram">
                            <a href="single.html"><img src="${pageContext.request.contextPath}/movie/DBGifReader4.do?movieno=${movieVO.movieno}" title=" " width="86px" height="103px"></a>
                        </div>
                    </c:forEach>
                    <div class="clearfix"> </div>
                </div>
                <div class="col-md-2 footer-grid">
                    <h4 class="b-log"><a><span>A</span>ctor</a></h4>
                    <div class="footer-grid1">
                        <div class="footer-grid1-left">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&ACTOR=Leonardo DiCaprio">
                                <img src="<%=request.getContextPath()%>/images/index/Leonardo DiCaprio.jpg" alt=" " width="40px" height="50px"></a>
                        </div>
                        <div class="footer-grid1-right">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&ACTOR=Leonardo DiCaprio">
                                Leonardo DiCaprio</a>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="footer-grid1">
                        <div class="footer-grid1-left">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&ACTOR=Tom Cruise">
                                <img src="<%=request.getContextPath()%>/images/index/Tom Cruise.jpg" alt=" " width="40px" height="50px"></a>
                        </div>
                        <div class="footer-grid1-right">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&ACTOR=Tom Cruise">
                                Tom Cruise</a>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="footer-grid1">
                        <div class="footer-grid1-left">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&ACTOR=Emma Stone">
                                <img src="<%=request.getContextPath()%>/images/index/Emma Stone.jpg" alt=" " width="40px" height="50px"></a>
                        </div>
                        <div class="footer-grid1-right">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&ACTOR=Emma Stone">
                                Emma Stone</a>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="footer-grid1">
                        <div class="footer-grid1-left">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&ACTOR=Anne Hathaway">
                                <img src="<%=request.getContextPath()%>/images/index/Anne Hathaway.jpg" alt=" " width="40px" height="50px"></a>
                        </div>
                        <div class="footer-grid1-right">
                            <a href="${pageContext.request.contextPath}/movie/movie.do?action=listMovies_ByCompositeQuery&ACTOR=Anne Hathaway">
                                Anne Hathaway</a>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
                <div class="col-md-2 footer-grid">
                    <h4 class="b-log"><a><span>T</span>op <span>F</span>ive <span>M</span>ovies</a></h4>
                    <ul>
                        <c:forEach var="movieVO" items="${listTopFive}">
                            <li><a href="genre.html">${movieVO.moviename}</a></li>
                        </c:forEach>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
            <h3 class="text-center follow">Connect <span>Us</span></h3>
            <ul class="social-icons1 agileinfo">
                <li><a href="https://zh-tw.facebook.com/"><i class="fa fa-facebook"></i></a></li>
                <li><a href="https://www.youtube.com/"><i class="fa fa-youtube"></i></a></li>
                <li><a href="https://tw.linkedin.com/"><i class="fa fa-linkedin"></i></a></li>
                <li><a href="https://www.google.com/"><i class="fa fa-google"></i></a></li>
                <li><a href="https://github.com/"><i class="fa fa-github"></i></a></li>
            </ul>
        </div>
    </div>
    <div class="w3agile_footer_copy">
        <p>2021 Movies Hit. All rights reserved | Design by <a>CEA103G3</a></p>
    </div>
    <a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
    <script src="js/jquery-1.11.1.min.js"></script>
    <!-- Dropdown-Menu-JavaScript -->
    <script>
        $(document).ready(function() {
            $(".dropdown").hover(
                function() {
                    $('.dropdown-menu', this).stop(true, true).slideDown("fast");
                    $(this).toggleClass('open');
                },
                function() {
                    $('.dropdown-menu', this).stop(true, true).slideUp("fast");
                    $(this).toggleClass('open');
                }
            );
        });
    </script>
    <!-- //Dropdown-Menu-JavaScript -->
    <script type="text/javascript" src="js/jquery.zoomslider.min.js"></script>
    <!-- search-jQuery -->
    <script src="js/main.js"></script>
    <script src="js/simplePlayer.js"></script>
    <script>
        $("document").ready(function() {
            $("#video").simplePlayer();
        });
    </script>
    <script>
        $("document").ready(function() {
            $("#video1").simplePlayer();
        });
    </script>
    <script>
        $("document").ready(function() {
            $("#video2").simplePlayer();
        });
    </script>
    <script>
        $("document").ready(function() {
            $("#video3").simplePlayer();
        });
    </script>
    <!-- pop-up-box -->
    <script src="js/jquery.magnific-popup.js" type="text/javascript"></script>
    <!--//pop-up-box -->
    <div id="small-dialog1" class="mfp-hide">
        <iframe src="https://player.vimeo.com/video/165197924?color=ffffff&title=0&byline=0&portrait=0"></iframe>
    </div>
    <div id="small-dialog2" class="mfp-hide">
        <iframe src="https://player.vimeo.com/video/165197924?color=ffffff&title=0&byline=0&portrait=0"></iframe>
    </div>
    <script>
        $(document).ready(function() {
            $('.w3_play_icon,.w3_play_icon1,.w3_play_icon2').magnificPopup({
                type: 'inline',
                fixedContentPos: false,
                fixedBgPos: true,
                overflowY: 'auto',
                closeBtnInside: true,
                preloader: false,
                midClick: true,
                removalDelay: 300,
                mainClass: 'my-mfp-zoom-in'
            });
            
        });
    </script>
    <script src="js/easy-responsive-tabs.js"></script>
    <script>
        $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
type: 'default', //Types: default, vertical, accordion           
width: 'auto', //auto or any width like 600px
fit: true,   // 100% fit in a container
closed: 'accordion', // Start closed if in accordion view
activate: function(event) { // Callback function if tab is switched
    var $tab = $(this);
    var $info = $('#tabInfo');
    var $name = $('span', $info);
    $name.text($tab.text());
    $info.show();
}
});
            $('#verticalTab').easyResponsiveTabs({
                type: 'vertical',
                width: 'auto',
                fit: true
            });
        });
    </script>
    <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="all">
    <script src="js/owl.carousel.js"></script>
    <script>
        $(document).ready(function() {
            $("#owl-demo").owlCarousel({

                autoPlay: 3000, //Set AutoPlay to 3 seconds
                autoPlay: true,
                navigation: true,

                items: 5,
                itemsDesktop: [640, 4],
                itemsDesktopSmall: [414, 3]

            });

        });
    </script>
    <!--/script-->
    <script type="text/javascript" src="js/move-top.js"></script>
    <script type="text/javascript" src="js/easing.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function($) {
            $(".scroll").click(function(event) {
                event.preventDefault();
                $('html,body').animate({ scrollTop: $(this.hash).offset().top }, 900);
            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function() {
            /*
                            var defaults = {
                                containerID: 'toTop', // fading element id
                                containerHoverID: 'toTopHover', // fading element hover id
                                scrollSpeed: 1200,
                                easingType: 'linear' 
                            };
                            */

            $().UItoTop({ easingType: 'easeOutQuart' });

        });
    </script>
    <!--end-smooth-scrolling-->
    <script src="js/bootstrap.js"></script>
</body>

</html>