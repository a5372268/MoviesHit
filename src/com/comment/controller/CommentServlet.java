package com.comment.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.comment.model.*;
import com.expectation.model.ExpectationService;
import com.expectation.model.ExpectationVO;
import com.movie.model.*;
import com.rating.model.RatingService;
import com.rating.model.RatingVO;
import com.mem.model.*;



public class CommentServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");

//		if ("getAll".equals(action)) {
//			/***************************�}�l�d�߸�� ****************************************/
//			CommentService commentSvc = new CommentService();
//			List<CommentVO> list= commentSvc.getAll();
//			
//			/***************************�d�ߧ���,�ǳ����(Send the Success view)*************/
//			HttpSession session = req.getSession();
//			session.setAttribute("list", list);    // ��Ʈw���X��list����,�s�Jsession
//			// Send the Success view
//			String url = "/front-end/comment/listAllComment.jsp";
//			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\���listAllComment2_getFromSession.jsp
//			successView.forward(req, res);
//			return;
//		}


		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_comment_page.jsp���ШD //���g�b�e�� �Ҥp�����d��

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer commentno = new Integer(req.getParameter("commentno"));
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/index.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/index.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				CommentService commentSvc = new CommentService();
				CommentVO commentVO = commentSvc.getOneComment(commentno);
			
				if (commentVO == null) {
					errorMsgs.add("�d�L���");
				}
//				 Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/index.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
//				MovieService movieSvc = new MovieService();
//				MovieVO movieVO = movieSvc.getOneMovie(commentVO.getMovieno());
//				req.setAttribute("movieVO", movieVO);
//				
//				RatingService ratingSvc = new RatingService();
//				RatingVO ratingCount = ratingSvc.getThisMovieToatalRating(commentVO.getMovieno());
//				req.setAttribute("ratingCount", ratingCount);
//
//				ExpectationService expectationSvc = new ExpectationService();
//				ExpectationVO expectationCount = expectationSvc.getThisMovieToatalExpectation(commentVO.getMovieno());
//				req.setAttribute("expectationCount", expectationCount);
//				
//				Integer openModal=0;
//				req.setAttribute("openModal",openModal );
				
				
				req.setAttribute("commentVO", commentVO); // ��Ʈw���X��commentVO����,�s�Jreq
				String url = "/front-end/comment/listOneComment.jsp";
//				String url = "/front-end/movie/listOneMovie.jsp";
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneComment.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/index.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllComment.jsp���ШD  ��  /movie/listComments_ByMovieno.jsp ���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/comment/listAllComment.jsp�j ��  �i/movie/listComments_ByMovieno.jsp�j �� �i /movie/listAllMovie.jsp�j		

			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer commentno = new Integer(req.getParameter("commentno"));
				
				/***************************2.�}�l�d�߸��****************************************/
				CommentService commentSvc = new CommentService();
				CommentVO commentVO = commentSvc.getOneComment(commentno);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("commentVO", commentVO);         // ��Ʈw���X��commentVO����,�s�Jreq
				String url = "/front-end/comment/update_comment_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_comment_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_comment_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/comment/listAllComment.jsp�j ��  �i/movie/listComments_ByMovieno.jsp�j �� �i /movie/listAllMovie.jsp�j		
	
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer commentno = new Integer(req.getParameter("commentno").trim());
				
				Integer movieno = new Integer(req.getParameter("movieno").trim());
				
				String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("���פ��e�ФŪť�");
				}	
				
				CommentVO commentVO = new CommentVO();
								
				commentVO.setCommentno(commentno);
				commentVO.setMovieno(movieno);
				commentVO.setContent(content);
		
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("commentVO", commentVO); // �t����J�榡���~��commentVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/comment/update_comment_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				CommentService commentSvc = new CommentService();
				commentSvc.updateComment(commentno, movieno, content);
				commentVO = commentSvc.getOneComment(commentno);
				
				MovieService movieSvc = new MovieService();
				MovieVO movieVO = movieSvc.getOneMovie(movieno);
				req.setAttribute("movieVO", movieVO);
				
				RatingService ratingSvc = new RatingService();
				RatingVO ratingCount = ratingSvc.getThisMovieToatalRating(commentVO.getMovieno());
				req.setAttribute("ratingCount", ratingCount);

				ExpectationService expectationSvc = new ExpectationService();
				ExpectationVO expectationCount = expectationSvc.getThisMovieToatalExpectation(commentVO.getMovieno());
				req.setAttribute("expectationCount", expectationCount);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("commentVO", commentVO); // ��Ʈwupdate���\��,���T����commentVO����,�s�Jreq
//				String url = "/front-end/comment/listOneComment.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneComment.jsp
//				successView.forward(req, res);
				
				
//				if(requestURL.equals("/front-end/movie/listComments_ByMovieno.jsp") || requestURL.equals("/front-end/movie/listAllMovie.jsp"))
//					req.setAttribute("listCommnets_ByMovieno",movieSvc.getCommentsByMovieno(movieno)); // ��Ʈw���X��list����,�s�Jrequest
//				
//				if(requestURL.equals("/front-end/comment/listComments_ByCompositeQuery.jsp")){
//					HttpSession session = req.getSession();
//					Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
//					List<CommentVO> list  = commentSvc.getAll(map);
//					req.setAttribute("listComments_ByCompositeQuery",list); //  �ƦX�d��, ��Ʈw���X��list����,�s�Jrequest
//				}
                
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);   // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);


				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/comment/update_comment_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addComment.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL");

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				Integer memberno = new Integer(req.getParameter("memberno").trim());
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(memberno);
				String isMovieReview = memVO.getMb_level();
				if(!isMovieReview.equals("2")) {
					errorMsgs.add("�u���v���i�H�g����~�A�u�O�ӷ|�� ��?");
				}
				
				Integer movieno = new Integer(req.getParameter("movieno").trim());
				
				String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("���פ��e�ФŪť�");
				}

				String status = req.getParameter("status").trim();
				if (status.equals("9")) {
					errorMsgs.add("�п�ܵ��ת��A");// ��select�U�Ԧ����Ĥ@�ӯd�ťեΪ�
				}
			
				CommentVO commentVO = new CommentVO();
				commentVO.setMemberno(memberno);
				commentVO.setMovieno(movieno);
				commentVO.setContent(content);
				commentVO.setStatus(status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("commentVO", commentVO);
					
					MovieService movieSvc = new MovieService();
					MovieVO movieVO = movieSvc.getOneMovie(movieno);
					req.setAttribute("movieVO", movieVO);// �t����J�榡���~��commentVO����,�]�s�Jreq
					
					RatingService ratingSvc = new RatingService();
					RatingVO ratingCount = ratingSvc.getThisMovieToatalRating(movieno);
					req.setAttribute("ratingCount", ratingCount);

					ExpectationService expectationSvc = new ExpectationService();
					ExpectationVO expectationCount = expectationSvc.getThisMovieToatalExpectation(movieno);
					req.setAttribute("expectationCount", expectationCount);
					RequestDispatcher failureView = req
							.getRequestDispatcher(requestURL);
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				CommentService commentSvc = new CommentService();
				commentVO = commentSvc.addComment(memberno, movieno, content ,status);
				
				MovieService movieSvc = new MovieService();
				MovieVO movieVO = movieSvc.getOneMovie(movieno);
				req.setAttribute("movieVO", movieVO);
				
				RatingService ratingSvc = new RatingService();
				RatingVO ratingCount = ratingSvc.getThisMovieToatalRating(movieno);
				req.setAttribute("ratingCount", ratingCount);

				ExpectationService expectationSvc = new ExpectationService();
				ExpectationVO expectationCount = expectationSvc.getThisMovieToatalExpectation(movieno);
				req.setAttribute("expectationCount", expectationCount);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				
//				if(requestURL.equals("/front-end/movie/listComments_ByMovieno.jsp")){
					String url = requestURL;
					RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\����^�쥻����
					successView.forward(req, res);	
//				}else {
//					String url = "/front-end/comment/listAllComment.jsp";
//					RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllComment.jsp
//					successView.forward(req, res);	
//				}
							
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/comment/addComment.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllComment.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/comment/listAllComment.jsp�j ��  �i/movie/listComments_ByMovieno.jsp�j �� �i /movie/listAllMovie.jsp�j�� �i /comment/listComments_ByCompositeQuery.jsp�j		
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer commentno = new Integer(req.getParameter("commentno"));
			
				/***************************2.�}�l�R�����***************************************/
				CommentService commentSvc = new CommentService();
				CommentVO commentVO = commentSvc.getOneComment(commentno);
				commentSvc.deleteComment(commentno);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
//				String url = "/front-end/comment/listAllComment.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
//				successView.forward(req, res);
				
				MovieService movieSvc = new MovieService();
//				if(requestURL.equals("/front-end/movie/listComments_ByMovieno.jsp") || requestURL.equals("/front-end/movie/listAllMovie.jsp"))
//					req.setAttribute("listComments_ByMovieno",movieSvc.getCommentsByMovieno(commentVO.getMovieno())); // ��Ʈw���X��list����,�s�Jrequest
//				
//				if(requestURL.equals("/front-end/comment/listComments_ByCompositeQuery.jsp")){
//					HttpSession session = req.getSession();
//					Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
//					List<CommentVO> list  = commentSvc.getAll(map);
//					req.setAttribute("listComments_ByCompositeQuery",list); //  �ƦX�d��, ��Ʈw���X��list����,�s�Jrequest
//				}

				if(requestURL.equals("/front-end/movie/listOneMovie.jsp")){
					req.setAttribute("listComments_ByMovieno",movieSvc.getCommentsByMovieno(commentVO.getMovieno())); // ��Ʈw���X��list����,�s�Jrequest
					MovieVO movieVO = movieSvc.getOneMovie(commentVO.getMovieno());
					req.setAttribute("movieVO", movieVO);
			
					RatingService ratingSvc = new RatingService();
					RatingVO ratingCount = ratingSvc.getThisMovieToatalRating(commentVO.getMovieno());
					req.setAttribute("ratingCount", ratingCount);

					ExpectationService expectationSvc = new ExpectationService();
					ExpectationVO expectationCount = expectationSvc.getThisMovieToatalExpectation(commentVO.getMovieno());
					req.setAttribute("expectationCount", expectationCount);
				}

				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		if ("listComments_ByCompositeQuery".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				/***************************1.�N��J����ରMap**********************************/ 
				//�ĥ�Map<String,String[]> getParameterMap()����k 
				//�`�N:an immutable java.util.Map 
				//Map<String, String[]> map = req.getParameterMap();
				HttpSession session = req.getSession();
				Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
				
				// �H�U�� if �϶��u��Ĥ@������ɦ���
				if (req.getParameter("whichPage") == null){
					Map<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
					session.setAttribute("map",map1);
					map = map1;
				} 
				
				/***************************2.�}�l�ƦX�d��***************************************/
				CommentService commentSvc = new CommentService();
				List<CommentVO> list  = commentSvc.getAll(map);
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				Integer memberno = new Integer(req.getParameter("MEMBER_NO").trim());
				MemVO memVO = new MemService().getOneMem(memberno);
				req.setAttribute("memVO", memVO);
				
				req.setAttribute("listComments_ByCompositeQuery", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/comment/listComments_ByCompositeQuery.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/movie/error.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
//�q�v�s������		
//			if ("getThisMovieComment".equals(action)) { // �Ӧ�select_comment_page.jsp���ШD //���g�b�e�� �Ҥp�����d��
//
//			List<String> errorMsgs = new LinkedList<String>();
//			req.setAttribute("errorMsgs", errorMsgs);
//
//			try {
//				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
//				Integer movieno = new Integer(req.getParameter("thisMovieComments"));
//				/*************************** 2.�}�l�d�߸�� *****************************************/
//				CommentService commentSvc = new CommentService();
//				List<CommentVO> list= commentSvc.getOneMovieComment(movieno);
//				if (list == null) {
//					errorMsgs.add("�d�L���");
//				}
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/movie/select_movie_page.jsp");
//					failureView.forward(req, res);
//					return;// �{�����_
//				}
//				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
//				req.setAttribute("list", list); // ��Ʈw���X��commentVO����,�s�Jreq
//				String url = "/front-end/comment/listOneComment.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneComment.jsp
//				successView.forward(req, res);
//
//				/***************************��L�i�઺���~�B�z*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("�L�k���o���:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/movie/select_movie_page.jsp");
//				failureView.forward(req, res);
//			}
//		}
		
		
		if("delete_for_Ajax".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
			try {
				int comment_no = new Integer(req.getParameter("comment_no"));
				CommentService commSvc = new CommentService();
				commSvc.deleteComment(comment_no);
				out.print("success");

			}
			catch(Exception e) {
				out.print("fail");
				errorMsgs.add("���קR������");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				failureView.forward(req, res);
			}finally {
				out.flush();
				out.close();
			}
		}


if ("getOne_For_Display_Ajax".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
			try {
				System.out.println("1");
				
				System.out.println("2");
				String comment_content = req.getParameter("comment_content");
				System.out.println("3");
				int comment_no = new Integer(req.getParameter("comment_no"));
				System.out.println(comment_no);
				System.out.println(comment_content);

				CommentService commentSvc = new CommentService();
				CommentVO commVO = commentSvc.updateComment_bycommentno(comment_no, comment_content); 
				if (commVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {

					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/mem/memberSys.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}	
				
				try {
					System.out.println("2");
					out.print("success");
					return;
				}catch(Exception e) {
					out.print("fail");
					e.printStackTrace();
				}finally {
					out.flush();
					out.close();
				}

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
