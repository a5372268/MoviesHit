package com.reply.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.article.model.ArticleService;
import com.reply.model.ReplyDAO;
import com.reply.model.ReplyService;
import com.reply.model.ReplyVO;

public class ReplyServlet extends HttpServlet {

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
				String str = req.getParameter("reply_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�^�_�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/reply/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer reply_no = null;
				try {
					reply_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�^�_�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/reply/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				ReplyService replySvc = new ReplyService();
				ReplyVO replyVO = replySvc.getOneReply(reply_no);
				if (replyVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/reply/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("replyVO", replyVO); // ��Ʈw���X��replyVO����,�s�Jreq
				String url = "/front-end/reply/listOneReply.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneArticle.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/reply/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllArticle.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j	
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer reply_no = new Integer(req.getParameter("reply_no"));
				/***************************2.�}�l�d�߸��****************************************/
				ReplyService replySvc = new ReplyService();
				ReplyVO replyVO = replySvc.getOneReply(reply_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("replyVO", replyVO);         // ��Ʈw���X��articleVO����,�s�Jreq
				String url = "/front-end/reply/update_reply_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_article_input.jsp
				successView.forward(req, res);
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_article_input.jsp���ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
Integer reply_no = new Integer(req.getParameter("reply_no").trim());

Integer article_no = new Integer(req.getParameter("articleno").trim());


//Integer member_no = 1;
Integer member_no = new Integer(req.getParameter("member_no").trim());
//				Integer memberno = null;
//				try {
//memberno = new Integer(req.getParameter("memberno").trim());
//				} catch (NumberFormatException e) {
//					memberno = 0;
//					errorMsgs.add("�|���s���ж�Ʀr.");
//				}
				
				
String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("�^�Ф��e�ФŪť�");
				}					
				
				java.sql.Timestamp crt_dt = null;
//				try {
//crt_dt = java.sql.Timestamp.valueOf(req.getParameter("crt_dt").trim());
//				} catch (IllegalArgumentException e) {
//					crt_dt = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}

				java.sql.Timestamp modify_dt = null;
//				try {
//modify_dt = java.sql.Timestamp.valueOf(req.getParameter("modify_dt").trim());
//				} catch (IllegalArgumentException e) {
//					modify_dt = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}
				modify_dt = new java.sql.Timestamp(System.currentTimeMillis());;

Integer status =0;				
//Integer status = new Integer(req.getParameter("status").trim());
				

//				Integer status = null;
//				try {
//status = new Integer(req.getParameter("status").trim());
//				} catch (NumberFormatException e) {
//					status = 0;
//					errorMsgs.add("�峹���A�ж�Ʀr.");
//				}
//				
//				Integer likecount = null;
//				try {
//likecount = new Integer(req.getParameter("likecount").trim());
//				} catch (NumberFormatException e) {
//					likecount = 0;
//					errorMsgs.add("�峹�g�ƽж�Ʀr.");
//				}


				ReplyVO replyVO = new ReplyVO();

				replyVO.setReply_no(reply_no);
				replyVO.setArticle_no(article_no);
				replyVO.setMember_no(member_no);
				replyVO.setContent(content);
				replyVO.setCrt_dt(crt_dt);
				replyVO.setModify_dt(modify_dt);
				replyVO.setStatus(status);			
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("replyVO", replyVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/reply/update_reply_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				
		
		
				/***************************2.�}�l�ק���*****************************************/
				ReplyService replySvc = new ReplyService();
				replyVO = replySvc.updateArticle(reply_no, article_no, member_no, content, crt_dt, modify_dt, status);
				
		
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
//				req.setAttribute("replyVO", replyVO); // ��Ʈwupdate���\��,���T����ReplyVO����,�s�Jreq
//				String url = "/reply/listOneReply.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneReply.jsp
//				successView.forward(req, res);
				ArticleService articleSvc = new ArticleService();
				if(requestURL.equals("/front-end/article/listReplys_ByArticleno.jsp") || requestURL.equals("/front-end/article/listAllArticle.jsp"))
					req.setAttribute("listReplys_ByArticleno",articleSvc.getReplysByArticleno(article_no)); // ��Ʈw���X��list����,�s�Jrequest
				
				//requestURL = /front-end/article/listOneArticle2.jsp
                String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);   // �ק令�\��,���^�e�X�ק諸�ӷ�����
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/reply/update_reply_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addReply.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
//Integer reply_no = new Integer(req.getParameter("reply_no").trim());

				Integer article_no = null;
				try {
article_no = new Integer(req.getParameter("article_no").trim());
				} catch (NumberFormatException e) {
					article_no = 0;
					errorMsgs.add("�^�_�s���ж�Ʀr.");
				}
				Integer member_no = null;
				try {
member_no = new Integer(req.getParameter("member_no").trim());
			} catch (NumberFormatException e) {
				member_no = 0;
				errorMsgs.add("�|���s���ж�Ʀr.");
			}
				
String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("���e�����ФŪť�");
				}	
				
				java.sql.Timestamp crt_dt = new java.sql.Timestamp(System.currentTimeMillis());
//				try {
//crt_dt = java.sql.Timestamp.valueOf(req.getParameter("crt_dt").trim());
//				} catch (IllegalArgumentException e) {
//					crt_dt = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}

				java.sql.Timestamp modify_dt = null;
//				try {
//modify_dt = java.sql.Timestamp.valueOf(req.getParameter("modify_dt").trim());
//				} catch (IllegalArgumentException e) {
//					modify_dt = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}

				Integer status = 0;
//				try {
//status = new Integer(req.getParameter("status").trim());
//				} catch (NumberFormatException e) {
//					status = 0;
//					errorMsgs.add("�峹���A�ж�Ʀr.");
//				}

				
				ReplyVO replyVO = new ReplyVO();

//				articleVO.setArticleno(reply_no);
				replyVO.setArticle_no(article_no);
				replyVO.setMember_no(member_no);
				replyVO.setContent(content);
				replyVO.setCrt_dt(crt_dt);
				replyVO.setModify_dt(modify_dt);
				replyVO.setStatus(status);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("replyVO", replyVO); // �t����J�榡���~��articleVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/reply/addReply.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				ReplyService replySvc = new ReplyService();
				replyVO = replySvc.addArticle(article_no,member_no ,content, crt_dt, modify_dt,status);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
//				String url = "/reply/listAllReply.jsp";
				String url = "/front-end/article/listOneArticle2.jsp?articleno=" + article_no;				
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllArticle.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/reply/addReply.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllArticle.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			String requestURL = req.getParameter("requestURL"); // �e�X�R�����ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j �� �i /emp/listEmps_ByCompositeQuery.jsp�j
			
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer reply_no = new Integer(req.getParameter("reply_no"));
				
				/***************************2.�}�l�R�����***************************************/
				ReplyService replySvc = new ReplyService();
				ReplyVO replyVO = replySvc.getOneReply(reply_no);
				replySvc.deleteReply(reply_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				ArticleService articleSvc = new ArticleService();
				if(requestURL.equals("/front-end/article/listReplys_ByArticleno.jsp") || requestURL.equals("/front-end/article/listAllArticle.jsp"))
					req.setAttribute("listReplys_ByArticleno",articleSvc.getReplysByArticleno(replyVO.getArticle_no())); // ��Ʈw���X��list����,�s�Jrequest
				
//				if(requestURL.equals("/reply/listReplys_ByCompositeQuery.jsp")){
//					HttpSession session = req.getSession();
//					Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
//					List<replyVO> list  = replySvc.getAll(map);
//					req.setAttribute("listEmps_ByCompositeQuery",list); //  �ƦX�d��, ��Ʈw���X��list����,�s�Jrequest
//				}
				
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/reply/listAllReply.jsp");
				failureView.forward(req, res);
			}		
		}
		if ("listReplys_ByCompositeQuery".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
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
				ReplyService replySvc = new ReplyService();
				List<ReplyVO> list  = replySvc.getAll(map);
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("listReplys_ByCompositeQuery", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/reply/listReplys_ByCompositeQuery.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/reply/select_page.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
