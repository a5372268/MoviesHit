package com.like.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.article.model.ArticleService;
import com.article.model.ArticleVO;
import com.like.model.LikeService;
import com.like.model.LikeVO;
import com.movieRating.model.MovieRatingService;
@WebServlet("/LikeServlet")
public class LikeServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("articleno");
				String str1 = req.getParameter("memberno");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���u�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/like/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer articleno = null;
				Integer memberno = null;
				try {
					articleno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/like/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				try {
					memberno = new Integer(str1);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/like/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				LikeService likeSvc = new LikeService();
				LikeVO likeVO = likeSvc.getOneLike(articleno,memberno);
				if (likeVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/like/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("likeVO", likeVO); // ��Ʈw���X��articleVO����,�s�Jreq
				String url = "/front-end/like/listOneLike.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneArticle.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/like/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllArticle.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer articleno = new Integer(req.getParameter("articleno"));
				Integer memberno = new Integer(req.getParameter("memberno"));
				/***************************2.�}�l�d�߸��****************************************/
				LikeService likeSvc = new LikeService();
				LikeVO likeVO = likeSvc.getOneLike(articleno,memberno);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("likeVO", likeVO);         // ��Ʈw���X��articleVO����,�s�Jreq
				String url = "/front-end/like/update_like_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_article_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/like/listAllLike.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_article_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
Integer articleno = new Integer(req.getParameter("articleno").trim());

Integer memberno = new Integer(req.getParameter("memberno").trim());


				LikeVO likeVO = new LikeVO();

				likeVO.setArticleno(articleno);
				likeVO.setMemberno(memberno);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("likeVO", likeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/like/update_like_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				LikeService likeSvc = new LikeService();
				likeVO = likeSvc.updateLike(articleno, memberno);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("likeVO", likeVO); // ��Ʈwupdate���\��,���T����articleVO����,�s�Jreq
				String url = "/front-end/like/listOneLike.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOnearticle.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/like/update_like_input.jsp");
				failureView.forward(req, res);
			}
		}
        if("insert_Ajax".contentEquals(action)) {
        	List<String> errorMsgs = new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
			try {
				
				Integer articleno = new Integer(req.getParameter("articleno").trim());
				Integer memberno = new Integer(req.getParameter("memberno").trim());
				
				LikeService likeSvc = new LikeService();
				likeSvc.addLike(articleno, memberno);
				
				out.print("success");
			}catch(Exception e) {
				out.print("fail");
				errorMsgs.add("�峹�I�g�ק異��");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				failureView.forward(req, res);
			}finally {
				out.flush();
				out.close();
			}
        	
        }
        if ("insert".equals(action)) { // �Ӧ�addArticle.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL");
			
			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				Integer articleno = null;
				try {
articleno = new Integer(req.getParameter("articleno").trim());
				} catch (NumberFormatException e) {
					articleno = 0;
					errorMsgs.add("�峹�s���ж�Ʀr.");
				}

				Integer memberno = null;
				try {
memberno = new Integer(req.getParameter("memberno").trim());
				} catch (NumberFormatException e) {
					memberno = 0;
					errorMsgs.add("�|���s���ж�Ʀr.");
				}
				
				LikeVO likeVO = new LikeVO();

				likeVO.setArticleno(articleno);
				likeVO.setMemberno(memberno);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("likeVO", likeVO); // �t����J�榡���~��articleVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/like/addLike.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				LikeService likeSvc = new LikeService();
				likeVO = likeSvc.addLike(articleno,memberno);				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
//				String url = "/front-end/like/listAllLike.jsp";
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllArticle.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/like/addLike.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllArticle.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer articleno = new Integer(req.getParameter("articleno"));
				Integer memberno = new Integer(req.getParameter("memberno"));
				/***************************2.�}�l�R�����***************************************/
				LikeService likeSvc = new LikeService();
				likeSvc.deleteLike(articleno, memberno);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/front-end/like/listAllLike.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/like/listAllLike.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
