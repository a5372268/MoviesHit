package com.report_article.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.report_article.model.Report_ArticleService;
import com.report_article.model.Report_ArticleVO;

public class Report_ArticleServlet extends HttpServlet {

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
				String str = req.getParameter("reportno");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���u�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/report_article/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer reportno = null;
				try {
					reportno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/report_article/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				Report_ArticleService report_articleSvc = new Report_ArticleService();
				Report_ArticleVO report_articleVO = report_articleSvc.getOneReport_Article(reportno);
				if (report_articleVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/report_article/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("report_articleVO", report_articleVO); // ��Ʈw���X��articleVO����,�s�Jreq
				String url = "/back-end/report_article/listOneReport_Article.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneArticle.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/report_article/select_page.jsp");
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
				Integer reportno = new Integer(req.getParameter("reportno"));
				
				/***************************2.�}�l�d�߸��****************************************/
				Report_ArticleService report_articleServiceSvc = new Report_ArticleService();
				Report_ArticleVO report_articleVO = report_articleServiceSvc.getOneReport_Article(reportno);			
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("report_articleVO", report_articleVO);         // ��Ʈw���X��articleVO����,�s�Jreq
				String url = "/back-end/report_article/update_report_article_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_article_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/report_article/listAllReport_Article.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_report_article_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
Integer reportno = new Integer(req.getParameter("reportno").trim());

Integer articleno = new Integer(req.getParameter("articleno").trim());
								
String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("�峹�����ФŪť�");
				}	

				java.sql.Timestamp crtdt = null;
				try {
crtdt = java.sql.Timestamp.valueOf(req.getParameter("crtdt").trim());
				} catch (IllegalArgumentException e) {
					crtdt = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}

Integer memberno = new Integer(req.getParameter("memberno").trim());
				
				java.sql.Timestamp executedt = null;
				try {
executedt = java.sql.Timestamp.valueOf(req.getParameter("executedt").trim());
				} catch (IllegalArgumentException e) {
					executedt = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}
			
Integer status = new Integer(req.getParameter("status").trim());
				
String desc = req.getParameter("desc").trim();
				if (desc == null || desc.trim().length() == 0) {
					errorMsgs.add("�峹�����ФŪť�");
				}

				Report_ArticleVO report_articleVO = new Report_ArticleVO();

				report_articleVO.setReportno(reportno);
				report_articleVO.setArticleno(articleno);
				report_articleVO.setContent(content);
				report_articleVO.setCrtdt(crtdt);
				report_articleVO.setMemberno(memberno);
				report_articleVO.setExecutedt(executedt);
				report_articleVO.setStatus(status);
				report_articleVO.setDesc(desc);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("report_articleVO", report_articleVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/report_article/update_report_article_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				Report_ArticleService report_articleSvc = new Report_ArticleService();
				report_articleVO = report_articleSvc.updateReport_Article(reportno, articleno, content, crtdt, memberno, executedt, status, desc);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("report_articleVO", report_articleVO); // ��Ʈwupdate���\��,���T����articleVO����,�s�Jreq
				String url = "/back-end/report_article/listOneReport_Article.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOnearticle.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/report_article/update_report_article_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addArticle.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				
				Integer articleno = null;
				try {
articleno = new Integer(req.getParameter("articleno").trim());
				} catch (NumberFormatException e) {
					articleno = 0;
					errorMsgs.add("�峹�s���ж�Ʀr.");
				}
String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("���|�����ФŪť�");
				}	
				java.sql.Timestamp crtdt = null;
				try {
crtdt = java.sql.Timestamp.valueOf(req.getParameter("crtdt").trim());
				} catch (IllegalArgumentException e) {
					crtdt = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				}
								
				Integer memberno = null;
				try {
memberno = new Integer(req.getParameter("memberno").trim());
				} catch (NumberFormatException e) {
					memberno = 0;
					errorMsgs.add("�|���s���ж�Ʀr.");
				}
				
				java.sql.Timestamp executedt = null;
				try {
executedt = java.sql.Timestamp.valueOf(req.getParameter("executedt").trim());
				} catch (IllegalArgumentException e) {
					executedt = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�п�J���!");
				
				}	

				Integer status = null;
				try {
status = new Integer(req.getParameter("status").trim());
				} catch (NumberFormatException e) {
					status = 0;
					errorMsgs.add("�峹���A�ж�Ʀr.");
				}
				
String desc = req.getParameter("desc").trim();
				if (desc == null || desc.trim().length() == 0) {
					errorMsgs.add("�峹���D�ФŪť�");
				}
				

				Report_ArticleVO report_articleVO = new Report_ArticleVO();
				
				report_articleVO.setArticleno(articleno);
				report_articleVO.setContent(content);
				report_articleVO.setCrtdt(crtdt);
				report_articleVO.setMemberno(memberno);				
				report_articleVO.setExecutedt(executedt);
				report_articleVO.setStatus(status);
				report_articleVO.setDesc(desc);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("report_articleVO", report_articleVO); // �t����J�榡���~��articleVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/report_article/addReport_Article.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				Report_ArticleService report_articleSvc = new Report_ArticleService();
				report_articleVO = report_articleSvc.addReport_Article(articleno, content, crtdt, memberno, executedt, status, desc);				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/back-end/report_article/listAllReport_Article.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllArticle.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/report_article/addReport_Article.jsp");
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
				Integer reportno = new Integer(req.getParameter("reportno"));
				
				/***************************2.�}�l�R�����***************************************/
				Report_ArticleService report_articleSvc = new Report_ArticleService();
				report_articleSvc.deleteReport_ArticleVO(reportno);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/back-end/report_article/listAllReport_Article.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/report_article/listAllReport_Article.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
