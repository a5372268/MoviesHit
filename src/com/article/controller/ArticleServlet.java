package com.article.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.mem.model.MemService;

import com.article.model.ArticleDAO;
import com.article.model.ArticleService;
import com.article.model.ArticleVO;
import com.like.model.LikeService;
import com.reply.model.ReplyService;
import com.reply.model.ReplyVO;
@WebServlet("/ArticleServlet")
public class ArticleServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display_Ajax".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
			try {
				int article_no = new Integer(req.getParameter("article_no"));

				ArticleService articleSvc = new ArticleService();
				MemService memSvc = new MemService();
				ArticleVO articleVO= articleSvc.getOneArticle(article_no);
				if (articleVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {

					RequestDispatcher failureView = req
							.getRequestDispatcher("/frontend/mem/memberSys.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}	
				String content = articleVO.getContent();
				String title = articleVO.getArticleheadline();
				String author = memSvc.getOneMem(articleVO.getMemberno()).getMb_name();
				int likecount = articleVO.getLikecount();
				JSONObject jsonobj=new JSONObject();
				try {
					jsonobj.put("content", content);
					jsonobj.put("title", title);
					jsonobj.put("author", author);
					jsonobj.put("likecount", likecount);
					out.print(jsonobj.toString());
					return;
				}catch(JSONException e) {
					e.printStackTrace();
				}finally {
					out.flush();
					out.close();
				}

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/frontend/mem/memberSys.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("articleno");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���u�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/article/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer articleno = null;
				try {
					articleno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���u�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/article/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				ArticleService articleSvc = new ArticleService();
				ArticleVO articleVO = articleSvc.getOneArticle(articleno);
				if (articleVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/article/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("articleVO", articleVO); // ��Ʈw���X��articleVO����,�s�Jreq
				String url = "/front-end/article/listOneArticle.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneArticle.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/article/select_page.jsp");
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
				
				/***************************2.�}�l�d�߸��****************************************/
				ArticleService articleSvc = new ArticleService();
				ArticleVO articleVO = articleSvc.getOneArticle(articleno);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("articleVO", articleVO);         // ��Ʈw���X��articleVO����,�s�Jreq
				String url = "/front-end/article/update_article_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_article_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
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


//				Integer memberno = 1;
//				try {
//memberno = new Integer(req.getParameter("memberno").trim());
//				} catch (NumberFormatException e) {
//					memberno = 0;
//					errorMsgs.add("�|���s���ж�Ʀr.");
//				}
				
				
String articletype = req.getParameter("articletype").trim();
				if (articletype == null || articletype.trim().length() == 0) {
					errorMsgs.add("�峹�����ФŪť�");
				}	
				
String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("�峹���e�ФŪť�");
				}				
				
String articleheadline = req.getParameter("articleheadline").trim();
				if (articleheadline == null || articleheadline.trim().length() == 0) {
					errorMsgs.add("�峹���D�ФŪť�");
				}
				ArticleService articleSvc1 = new ArticleService();
				ArticleVO articleVO1 = articleSvc1.getOneArticle(articleno);
				java.sql.Timestamp crtdt = articleVO1.getCrtdt();
				
//				ArticleDAO dao = new ArticleDAO();
//				ArticleVO articleVO1 = dao.findByPrimaryKey(articleno);
//				
//				java.sql.Timestamp crtdt = articleVO1.getCrtdt();
//				try {
//crtdt = java.sql.Timestamp.valueOf(req.getParameter("crtdt").trim());
//				} catch (IllegalArgumentException e) {
//					crtdt = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}
//				crtdt = new java.sql.Timestamp(System.currentTimeMillis());

				java.sql.Timestamp updatedt = null;
//				try {
//updatedt = java.sql.Timestamp.valueOf(req.getParameter("updatedt").trim());
//				} catch (IllegalArgumentException e) {
//					updatedt = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}
				updatedt = new java.sql.Timestamp(System.currentTimeMillis());
				
				Integer status = 0;
				
//				ArticleService articleSvc1 = new ArticleService();
//				ArticleVO articleVO2 = articleSvc1.getOneArticle(articleno);	
				Integer likecount = articleVO1.getLikecount();
				
//				Integer likecount = 0; 
//Integer status = new Integer(req.getParameter("status").trim());
				
//Integer likecount = new Integer(req.getParameter("likecount").trim());

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


				ArticleVO articleVO = new ArticleVO();

				articleVO.setArticleno(articleno);
				articleVO.setMemberno(memberno);
				articleVO.setArticletype(articletype);
				articleVO.setContent(content);
				articleVO.setArticleheadline(articleheadline);
				articleVO.setCrtdt(crtdt);
				articleVO.setUpdatedt(updatedt);
				articleVO.setStatus(status);
				articleVO.setLikecount(likecount);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("articleVO", articleVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/article/update_article_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�ק���*****************************************/
				ArticleService articleSvc = new ArticleService();
				articleVO = articleSvc.updateArticle(articleno, memberno, articletype, content, articleheadline,crtdt, updatedt,status,likecount);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				req.setAttribute("articleVO", articleVO); // ��Ʈwupdate���\��,���T����articleVO����,�s�Jreq
//				String url = "/article/listOneArticle.jsp";
//				String url = "/front-end/article/listOneArticle2.jsp?articleno=" + articleno;
				String url = req.getParameter("requestURL"); //����update_article_input.jsp���ӷ����}
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneAarticle2.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/article/update_article_input.jsp");
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
//Integer articleno = new Integer(req.getParameter("articleno").trim());

				Integer memberno = null;
				try {
memberno = new Integer(req.getParameter("memberno").trim());
				} catch (NumberFormatException e) {
					memberno = 0;
					errorMsgs.add("�|���s���ж�Ʀr.");
				}
				
String articletype = req.getParameter("articletype").trim();
				if (articletype == null || articletype.trim().length() == 0) {
					errorMsgs.add("�峹�����ФŪť�");
				}	
				
String content = req.getParameter("content").trim();
				if (content == null || content.trim().length() == 0) {
					errorMsgs.add("�峹���e�ФŪť�");
				}				
				
String articleheadline = req.getParameter("articleheadline").trim();
				if (articleheadline == null || articleheadline.trim().length() == 0) {
					errorMsgs.add("�峹���D�ФŪť�");
				}
				
				java.sql.Timestamp crtdt = null;
//				try {
//crtdt = java.sql.Timestamp.valueOf(req.getParameter("crtdt").trim());
//				} catch (IllegalArgumentException e) {
//					crtdt = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}
				crtdt = new java.sql.Timestamp(System.currentTimeMillis());

				java.sql.Timestamp updatedt = null;
//				try {
//updatedt = java.sql.Timestamp.valueOf(req.getParameter("updatedt").trim());
//				} catch (IllegalArgumentException e) {
//					updatedt = new java.sql.Timestamp(System.currentTimeMillis());
//					errorMsgs.add("�п�J���!");
//				}

				Integer status = 0;
//				try {
//status = new Integer(req.getParameter("status").trim());
//				} catch (NumberFormatException e) {
//					status = 0;
//					errorMsgs.add("�峹���A�ж�Ʀr.");
//				}
				Integer likecount = 0;
//				try {
//likecount = new Integer(req.getParameter("likecount").trim());
//				} catch (NumberFormatException e) {
//					likecount = 0;
//					errorMsgs.add("�峹�g�ƽж�Ʀr.");
//				}
				

				ArticleVO articleVO = new ArticleVO();

//				articleVO.setArticleno(articleno);
				articleVO.setMemberno(memberno);
				articleVO.setArticletype(articletype);
				articleVO.setContent(content);
				articleVO.setArticleheadline(articleheadline);
				articleVO.setCrtdt(crtdt);
				articleVO.setUpdatedt(updatedt);
				articleVO.setStatus(status);
				articleVO.setLikecount(likecount);
				
				System.out.println("content =" + content);
				System.out.println("articleheadline =" +articleheadline);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("articleVO", articleVO); // �t����J�榡���~��articleVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/article/addArticle.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				ArticleService articleSvc = new ArticleService();
				articleVO = articleSvc.addArticle(memberno, articletype, content, articleheadline, crtdt, updatedt, status, likecount);				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/front-end/article/listAllArticle.jsp";
//				String url = req.getParameter("requestURL");
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllArticle.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/article/addArticle.jsp");
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
				
				/***************************2.�}�l�R�����***************************************/
				ArticleService articleSvc = new ArticleService();
				articleSvc.deleteArticle(articleno);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/front-end/article/listAllArticle.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
				failureView.forward(req, res);
			}
		}
		if ("listReplys_ByArticleno_A".equals(action) || "listReplys_ByArticleno_B".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				Integer articleno = new Integer(req.getParameter("articleno"));
				
				/*************************** 2.�}�l�d�߸�� ****************************************/			
				ArticleService articleSvc = new ArticleService();
				Set<ReplyVO> set = articleSvc.getReplysByArticleno(articleno);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("listReplys_ByArticleno", set);    // ��Ʈw���X��list����,�s�Jrequest

				String url = null;
				if ("listReplys_ByArticleno_A".equals(action))
					url = "/front-end/article/listReplys_ByArticleno.jsp";        // ���\��� dept/listEmps_ByDeptno.jsp
				else if ("listReplys_ByArticleno_B".equals(action))
					url = "/front-end/article/listAllArticle.jsp";              // ���\��� dept/listAllDept.jsp

				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		if ("getOne_From06".equals(action)) {

			try {
				// Retrieve form parameters.
				Integer articleno = new Integer(req.getParameter("articleno"));

				ArticleDAO dao = new ArticleDAO();
				ArticleVO articleVO = dao.findByPrimaryKey(articleno);

				req.setAttribute("articleVO", articleVO); // ��Ʈw���X��empVO����,�s�Jreq
				
				//Bootstrap_modal
				boolean openModal=true;
				req.setAttribute("openModal",openModal );
				
				// ���X��empVO�e��listOneEmp.jsp
				RequestDispatcher successView = req
						.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
				successView.forward(req, res);
				return;

				// Handle any unusual exceptions
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}
		if ("listArticles_ByCompositeQuery".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
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
				ArticleService articleSvc = new ArticleService();
				List<ArticleVO> list  = articleSvc.getAll(map);
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("listArticles_ByCompositeQuery", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/article/listArticles_ByCompositeQuery.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/article/listAllArticle.jsp");
				failureView.forward(req, res);
			}
		}
	
	}
	
	
}
