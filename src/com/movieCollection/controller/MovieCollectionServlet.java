package com.movieCollection.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.movieCollection.model.MovieCollectionService;

@WebServlet("/MovieCollectionServlet")
public class MovieCollectionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=Big5");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		
		if("insert".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				int member_no = new Integer(req.getParameter("member_no"));
				int movie_no = new Integer(req.getParameter("movie_no"));
				MovieCollectionService movcolSvc = new MovieCollectionService();
				movcolSvc.addMovieCollection(movie_no, member_no);

				//�]session��memVO�A�����J�t�Ϋ�R��
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(member_no);
				req.getSession().setAttribute("memVO", memVO);
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				successView.forward(req, res);
				
			}catch(Exception e) {
				errorMsgs.add("�q�v���÷s�W����");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("delete".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				int member_no = new Integer(req.getParameter("member_no"));
				int movie_no = new Integer(req.getParameter("movie_no"));
				MovieCollectionService movcolSvc = new MovieCollectionService();
				movcolSvc.deleteMovieCollection(movie_no, member_no);;
				out.print("success");
			}
			catch(Exception e) {
				out.print("fail");
				errorMsgs.add("�q�v���çR������");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				failureView.forward(req, res);
			}finally {
				out.flush();
				out.close();
			}
			
		}
		if("list_movcol_by_memno".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				Integer member_no = new Integer(req.getParameter("member_no").trim());
				MovieCollectionService movcolSvc = new MovieCollectionService();

				//�]session��memVO�A�����J�t�Ϋ�R��
				MemService memSvc = new MemService();
				MemVO memVO = memSvc.getOneMem(member_no);
				req.getSession().setAttribute("memVO", memVO);
				
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				successView.forward(req, res);
			}catch(Exception e){
				errorMsgs.add("�d�ݹq�v��������");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				failureView.forward(req, res);
			}
		}
		
	}

}
