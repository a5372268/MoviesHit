//01�� �u���d��

package com.report_comment.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.json.JSONException;
import org.json.JSONObject;

import com.comment.model.CommentService;
import com.comment.model.CommentVO;
import com.expectation.model.ExpectationService;
import com.expectation.model.ExpectationVO;
import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.movie.model.MovieService;
import com.movie.model.MovieVO;
import com.rating.model.RatingService;
import com.rating.model.RatingVO;
import com.report_comment.model.*;

public class ReportCommentServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");

		if ("getAll".equals(action)) {
			/***************************�}�l�d�߸�� ****************************************/
			ReportCommentService reportCommentSvc = new ReportCommentService();
			List<ReportCommentVO> list= reportCommentSvc.getAll();

			/***************************�d�ߧ���,�ǳ����(Send the Success view)*************/
			HttpSession session = req.getSession();
			session.setAttribute("list", list);    // ��Ʈw���X��list����,�s�Jsession
			// Send the Success view
			String url = "/back-end/report_comment/listAllReportComment.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\���listAllComment2_getFromSession.jsp
			successView.forward(req, res);
			return;
		}
		
		if ("getAllOrderByReportno".equals(action)) {
			/***************************�}�l�d�߸�� ****************************************/
			ReportCommentService reportCommentSvc = new ReportCommentService();
			List<ReportCommentVO> list= reportCommentSvc.getAllOrderByReportno();

			/***************************�d�ߧ���,�ǳ����(Send the Success view)*************/
			HttpSession session = req.getSession();
			session.setAttribute("list", list);    // ��Ʈw���X��list����,�s�Jsession
			// Send the Success view
			String url = "/back-end/report_comment/listAllReportComment.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);// ���\���listAllComment2_getFromSession.jsp
			successView.forward(req, res);
			return;
		}


		if ("insert".equals(action)) { // �Ӧ�addComment.jsp���ШD  

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
			
//			String requestURL = req.getParameter("requestURL");

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/

				Integer commentno = new Integer(req.getParameter("commentno"));
		
				String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.put("content","���|��]�ФŪť�");
				}

				Integer memberno = new Integer(req.getParameter("memberno").trim());

				ReportCommentVO reportCommentVO = new ReportCommentVO();
				
				reportCommentVO.setCommentno(commentno);
				reportCommentVO.setContent(content);
				reportCommentVO.setMemberno(memberno);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("reportCommentVO", reportCommentVO);

					int problem= 1;
					JSONObject jsonobj = new JSONObject();
					try {
						jsonobj.put("problem",problem);
						out.print(jsonobj.toString());
						return;
					}catch(JSONException e) {
						e.printStackTrace();
					}finally {
						out.flush();
						out.close();
					}
				
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/report_comment/addReportComment.jsp");
//					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				ReportCommentService reportCommentSvc = new ReportCommentService();
				reportCommentVO = reportCommentSvc.addReportComment(commentno, content, memberno);
				
				CommentService commentSvc = new CommentService();
				Integer movieno = commentSvc.getOneComment(commentno).getMovieno(); 
				
				MovieService movieSvc = new MovieService();
				MovieVO movieVO = movieSvc.getOneMovie(movieno);
				req.setAttribute("movieVO", movieVO);
				
				RatingService ratingSvc = new RatingService();
				RatingVO ratingCount = ratingSvc.getThisMovieToatalRating(movieno);
				req.setAttribute("ratingCount", ratingCount);

				ExpectationService expectationSvc = new ExpectationService();
				ExpectationVO expectationCount = expectationSvc.getThisMovieToatalExpectation(movieno);
				req.setAttribute("expectationCount", expectationCount);
				
//				//�N�̷s�����ݫץ�^�h
				int problem= 0;
				JSONObject jsonobj = new JSONObject();
				try {
					jsonobj.put("problem",problem);
					out.print(jsonobj.toString());
					return;
				}catch(JSONException e) {
					e.printStackTrace();
				}finally {
					out.flush();
					out.close();
				}
				
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
//				String url = requestURL;
//				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\����^�쥻����
//				successView.forward(req, res);	
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/report_comment/addReportComment.jsp");
				failureView.forward(req, res);
			}
		}
		 
		 
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllComment.jsp���ШD  ��  /movie/listComments_ByMovieno.jsp ���ШD
			
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/comment/listAllComment.jsp�j ��  �i/movie/listComments_ByMovieno.jsp�j �� �i /movie/listAllMovie.jsp�j		
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer reportno = new Integer(req.getParameter("reportno"));
				/***************************2.�}�l�d�߸��****************************************/
				ReportCommentService reportCommentSvc = new ReportCommentService();
				ReportCommentVO reportCommentVO = reportCommentSvc.getOneReportComment(reportno);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("reportCommentVO", reportCommentVO);       
				String url = "/back-end/report_comment/update_reportcomment_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
	
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception","�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { // �Ӧ�update_comment_input.jsp���ШD
			
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/comment/listAllComment.jsp�j ��  �i/movie/listComments_ByMovieno.jsp�j �� �i /movie/listAllMovie.jsp�j		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer reportno = new Integer(req.getParameter("reportno").trim());
				
				Integer commentno = new Integer(req.getParameter("commentno").trim());
				
				Integer memberno = new Integer(req.getParameter("memberno").trim());
				
				String content = req.getParameter("content").trim();
				
				java.sql.Timestamp creatdate = null;
				try {
					creatdate = java.sql.Timestamp.valueOf(req.getParameter("creatdate").trim());
				} catch (Exception e) {
					creatdate = null;
				}
			
				java.sql.Timestamp executedate = null;
				try {
					executedate = java.sql.Timestamp.valueOf(req.getParameter("executedate").trim());
				} catch (Exception e) {
					executedate = null;
				}
				
				String status = req.getParameter("status").trim();
				if (status == null || status.trim().length() == 0) {
					errorMsgs.put("status", "�B�z���A�ФŪť�");// ��input type="TEXT"�Ϊ�
				} else if (status.equals("9")) {
					errorMsgs.put("status", "�п�ܳB�z���A");// ��select�U�Ԧ����C�@�ӯd�ťեΪ�
				}	
				
				String desc = "";
				if (req.getParameter("desc") == null || req.getParameter("desc").trim().length() == 0) {
					desc = null;
				}else {
					desc = req.getParameter("desc").trim();
				}

				ReportCommentVO reportCommentVO = new ReportCommentVO();
				reportCommentVO.setReportno(reportno);		
				reportCommentVO.setCommentno(commentno);
				reportCommentVO.setMemberno(memberno);
				reportCommentVO.setContent(content);
				reportCommentVO.setCreatdate(creatdate);
				reportCommentVO.setExecutedate(executedate);
				reportCommentVO.setStatus(status);
				reportCommentVO.setDesc(desc);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("reportCommentVO", reportCommentVO); // �t����J�榡���~��commentVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/report_comment/update_reportcomment_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				ReportCommentService reportCommentSvc = new ReportCommentService();
				reportCommentSvc.updateAllReportFromThisComment(commentno, status, desc);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);   // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);


				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/report_comment/update_reportcomment_input.jsp");
				failureView.forward(req, res);
			}
		}
		 
	}
}
