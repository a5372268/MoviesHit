package com.topic.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.article.model.ArticleVO;
import com.topic.model.TopicService;
import com.topic.model.TopicVO;

public class TopicServlet extends HttpServlet {

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
				String str = req.getParameter("topicno");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�Q�ץD�D�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/topic/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer topicno = null;
				try {
					topicno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�Q�ץD�D�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/topic/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				TopicService topicSvc = new TopicService();
				TopicVO topicVO = topicSvc.getOneTopic(topicno);
				if (topicVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/topic/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("topicVO", topicVO); // ��Ʈw���X��topicVO����,�s�Jreq
				String url = "/front-end/topic/listOneTopic.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOnetopic.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/topic/select_page.jsp");
				failureView.forward(req, res);
			}
		}
	
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAlltopic.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer topicno = new Integer(req.getParameter("topicno"));
				
				/***************************2.�}�l�d�߸��****************************************/
				TopicService topicSvc = new TopicService();
				TopicVO topicVO = topicSvc.getOneTopic(topicno);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("topicVO", topicVO);         // ��Ʈw���X��topicVO����,�s�Jreq
				String url = "/front-end/topic/update_topic_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_topic_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/topic/listAllTopic.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // �Ӧ�update_topic_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
Integer topicno = new Integer(req.getParameter("topicno").trim());
								
String topic = req.getParameter("topic").trim();
				if (topic == null || topic.trim().length() == 0) {
					errorMsgs.add("�峹�����ФŪť�");
				}	
				
				TopicVO topicVO = new TopicVO();

				topicVO.setTopicno(topicno);;
				topicVO.setTopic(topic);


				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("topicVO", topicVO); // �t����J�榡���~��topicVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/topic/update_topic_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				TopicService topicSvc = new TopicService();
				topicVO = topicSvc.updateTopic(topicno, topic);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("topicVO", topicVO); // ��Ʈwupdate���\��,���T����topicVO����,�s�Jreq
				String url = "/front-end/topic/listOneTopic.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOnetopic.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/topic/update_topic_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addtopic.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				
String topic = req.getParameter("topic").trim();
				if (topic == null || topic.trim().length() == 0) {
					errorMsgs.add("�峹�����ФŪť�");
				}									
					
					TopicVO topicVO = new TopicVO();
					topicVO.setTopic(topic);
					
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("topicVO", topicVO); // �t����J�榡���~��topicVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/topic/addTopic.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				TopicService topicSvc = new TopicService();
				topicVO = topicSvc.addTopic(topic);				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/front-end/topic/listAllTopic.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllTopic.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/topic/addTopic.jsp");
				failureView.forward(req, res);
				}
			}
               
		if ("delete".equals(action)) { // �Ӧ�listAllTopic.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer topicno = new Integer(req.getParameter("topicno"));
				
				/***************************2.�}�l�R�����***************************************/
				TopicService topicSvc = new TopicService();
				topicSvc.deleteTopic(topicno);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/front-end/topic/listAllTopic.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/topic/listAllTopic.jsp");
				failureView.forward(req, res);
				}
			}
		if ("listArticles_ByTopicno_A".equals(action) || "listArticles_ByTopicno_B".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				Integer topicno = new Integer(req.getParameter("topicno"));
				
				/*************************** 2.�}�l�d�߸�� ****************************************/			
				TopicService topicSvc = new TopicService();
				Set<ArticleVO> set = topicSvc.getArticlesByTopicno(topicno);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("listArticles_ByTopicno", set);    // ��Ʈw���X��list����,�s�Jrequest
				req.setAttribute("topicno", topicno);    // ��Ʈw���X��list����,�s�Jrequest

				String url = null;
				if ("listArticles_ByTopicno_A".equals(action))
					url = "/front-end/topic/listArticles_ByTopicno.jsp";        // ���\��� topic/listArticles_ByTopicno.jsp
				else if ("listArticles_ByTopicno_B".equals(action))
					url = "/front-end/topic/listArticles_ByTopicno.jsp";              // ���\��� topic/listAllTopic.jsp

				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
    }
}
