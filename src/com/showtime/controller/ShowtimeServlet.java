package com.showtime.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.showtime.model.ShowtimeService;
import com.showtime.model.ShowtimeVO;
import com.theater.model.TheaterService;
import com.theater.model.TheaterVO;


public class ShowtimeServlet extends HttpServlet {
       
	private static final long serialVersionUID = 1L;

	public ShowtimeServlet() {
        super();
    }

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("showtime_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�����s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/showtime/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer showtime_no = null;
				try {
					showtime_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�����s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/showtime/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				ShowtimeService showtimeSvc = new ShowtimeService();
				ShowtimeVO showtimeVO = showtimeSvc.getOneShowtime(showtime_no);
				if (showtimeVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/showtime/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("showtimeVO", showtimeVO); // ��Ʈw���X��empVO����,�s�Jreq
				String url = "/back-end/showtime/listOneShowtime.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/showtime/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllTheater.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer showtime_no = new Integer(req.getParameter("showtime_no"));
				
				/***************************2.�}�l�d�߸��****************************************/
				ShowtimeService showtimeSvc = new ShowtimeService();
				ShowtimeVO showtimeVO = showtimeSvc.getOneShowtime(showtime_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("showtimeVO", showtimeVO);         // ��Ʈw���X��theaterVO����,�s�Jreq
				String url = "/back-end/showtime/update_showtime_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_theater_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/showtime/listAllShowtime.jsp");
				failureView.forward(req, res);
			}
		}
		
//		if ("getOne_For_Update2".equals(action)) { // �Ӧ�listAllTheater.jsp���ШD
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			
//			try {
//				/***************************1.�����ШD�Ѽ�****************************************/
//				Integer showtime_no = new Integer(req.getParameter("showtime_no"));
//				
//				/***************************2.�}�l�d�߸��****************************************/
//				ShowtimeService showtimeSvc = new ShowtimeService();
//				ShowtimeVO showtimeVO = showtimeSvc.getOneShowtime(showtime_no);
//								
//				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
//				req.setAttribute("showtimeVO", showtimeVO);         // ��Ʈw���X��theaterVO����,�s�Jreq
//				String url = "/back-end/showtime/update_showtime_input3.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_theater_input.jsp
//				successView.forward(req, res);
//
//				/***************************��L�i�઺���~�B�z**********************************/
//			} catch (Exception e) {
//				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/back-end/showtime/listAllShowtime.jsp");
//				failureView.forward(req, res);
//			}
//		}
		
		if ("update".equals(action)) { // �Ӧ�update_theater_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				Integer showtime_no = new Integer(req.getParameter("showtime_no"));
				Integer	movie_no = new Integer(req.getParameter("movie_no"));
				Integer	theater_no = new Integer(req.getParameter("theater_no"));
				
				String s[] = req.getParameterValues("seat_no");
				String seat_no = "";
				for(int i = 0; i < s.length; i++) {
					seat_no = seat_no + s[i];
				}
				Timestamp showtime_time;
				try{
					showtime_time = java.sql.Timestamp.valueOf(req.getParameter("showtime_time")+":00");
				}catch (IllegalArgumentException e) {
					showtime_time= new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("�����ɶ��п�J����ɶ�!");
				}
				
				System.out.println(showtime_time);
				String sql = "select showtime_no, showtime_time from showtime where movie_no = " + movie_no 
						+ " and theater_no = " + theater_no + " and showtime_time = '" 
						+ showtime_time + "'";
				
				ShowtimeVO showtimeVO = new ShowtimeVO();
				showtimeVO.setShowtime_no(showtime_no);
				showtimeVO.setMovie_no(movie_no);
				showtimeVO.setTheater_no(theater_no);
				showtimeVO.setSeat_no(seat_no);
				showtimeVO.setShowtime_time(showtime_time);

				ShowtimeService showtimeSvc = new ShowtimeService();
				List<Object[]> list = showtimeSvc.getByHibernate(sql);
				int no = 0;
				if(list.size() >= 1) {
					no = (int) list.get(0)[0];
				}
				if(showtime_no.intValue() != no) {
					if(list.size() >= 1) {
						errorMsgs.add("��������");
					}
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("showtimeVO", showtimeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/showtime/update_showtime_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				
				/***************************2.�}�l�ק���*****************************************/
				showtimeVO = showtimeSvc.updateShowtime(showtime_no, movie_no, theater_no, seat_no, showtime_time);
				
				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				String page = req.getParameter("whichPage");
				System.out.println("page = " + page);
				req.setAttribute("showtimeVO", showtimeVO); // ��Ʈwupdate���\��,���T����theaterVO����,�s�Jreq
				String url = "/back-end/showtime/listAllShowtime.jsp?whichPage="+page;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/showtime/update_showtime_input.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				
				Integer	movie_no = new Integer(req.getParameter("movie_no"));
				Integer	theater_no = new Integer(req.getParameter("theater_no"));
				String seat_no = new TheaterService().getOneTheater(theater_no).getSeat_no();
				
				Timestamp showtime_time;
				try {
					showtime_time = java.sql.Timestamp.valueOf(req.getParameter("showtime_time").trim());
				} catch (IllegalArgumentException e){
					showtime_time = new Timestamp(System.currentTimeMillis()); 
					errorMsgs.add("�п�J����ɶ�!");
				}
				ShowtimeVO showtimeVO = new ShowtimeVO();
				
				showtimeVO.setMovie_no(movie_no);
				showtimeVO.setTheater_no(theater_no);
				showtimeVO.setSeat_no(seat_no);
				showtimeVO.setShowtime_time(showtime_time);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("showtimeVO", showtimeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/back-end/showtime/addShowtime.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}
				
				/***************************2.�}�l�s�W���***************************************/
				ShowtimeService showtimeSvc = new ShowtimeService();
				showtimeVO = showtimeSvc.addShowtime(movie_no, theater_no, seat_no, showtime_time);
				
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
				String url = "/back-end/showtime/listAllShowtime.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllTheater.jsp
				successView.forward(req, res);				
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/showtime/addShowtime.jsp");
				failureView.forward(req, res);
			}
		}
		
        if ("insert2".equals(action)) { // �Ӧ�addEmp.jsp���ШD  
        	List<String> errorMsgs = new LinkedList<String>();
        	// Store this set in the request scope, in case we need to
        	// send the ErrorPage view.
        	req.setAttribute("errorMsgs", errorMsgs);
        	
        	try {
        		/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
        		Integer	movie_no = new Integer(req.getParameter("movie_no"));
        		Integer	theater_no = new Integer(req.getParameter("theater_no"));
        		String seat_no = new TheaterService().getOneTheater(theater_no).getSeat_no();
        		
        		Timestamp showtime_time;
        		String st;
        		
        		String[] showtime_date = req.getParameterValues("showtime_date");
        		String[] showtime =req.getParameterValues("showtime");
        		List<String> result = new ArrayList<>();
        		
        		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        		Date from_date = format.parse(showtime_date[0]); //�}�l���
        		Date to_date = format.parse(showtime_date[1]); //�������
        		Calendar cd = Calendar.getInstance(); 
        		cd.setTime(from_date); //�]�w�}�l���
        		result.add(format.format(from_date)); //��}�l����s�W��result
        		
        		//�s�W�}�l���+1�Ѩ쵲���������result
        		while(cd.getTime().before(to_date)) {
        			cd.add(Calendar.DATE, 1);
        			String str = format.format(cd.getTime());
        			result.add(str);
        		}
        		ShowtimeService showtimeSvc = new ShowtimeService();
//        		List<ShowtimeVO> list_showtime = showtimeSvc.getAllShowtimeByMovie_no(movie_no);
//        		for(int i = 0; i < list_showtime.size(); i++) {
//        			ShowtimeVO showtimeVO2 = list_showtime.get(i);
//        			if(showtimeVO2.getTheater_no() != theater_no) {
//        				list_showtime.remove(showtimeVO2);
//        				i--;
//        			}
//        		}
//        		for(int i = 0; i < result.size(); i++) {
//        			for(int j = 0; j < showtime.length; j++) {
//        				
//        			}
//        		}
        		//��U��VO�s�blist_showtimeVO�̭� �b�@�_�s�W
        		List<ShowtimeVO> list_showtimeVO = new ArrayList<ShowtimeVO>();
        		for(int i = 0; i < result.size(); i++) {
        			for(int j = 0; j < showtime.length; j++) {
	        			st = result.get(i) + " " + showtime[j];
	            		showtime_time = java.sql.Timestamp.valueOf(st);
//	            		for(ShowtimeVO showtimeVO1 : list_showtime) {
//	            			System.out.println(showtimeVO1.getShowtime_time().getTime());
//	            			System.out.println(showtime_time.getTime());
//	            			System.out.println(showtimeVO1.getShowtime_time().getTime() - showtime_time.getTime());
//	            			long dur = showtimeVO1.getShowtime_time().getTime() - showtime_time.getTime();
//	            			int twoHour = 2 * 60 * 60 * 1000;
//	            			int dur_hour = (int) Math.abs(dur/twoHour);
//	            			System.out.println(dur_hour);
//	            			if(dur_hour < 2) {
//	            				errorMsgs.add("�����ɶ�����֩�2�p��,�Э��s�T�{!!");
//	            				break;
//	            			}else {
//	            			}
	            				ShowtimeVO showtimeVO = new ShowtimeVO();
	            				showtimeVO.setMovie_no(movie_no);
	            				showtimeVO.setTheater_no(theater_no);
	            				showtimeVO.setSeat_no(seat_no);
	            				showtimeVO.setShowtime_time(showtime_time);
	            				list_showtimeVO.add(showtimeVO);
	            			
//	            		}
//        				showtimeVO.setMovie_no(movie_no);
//        				showtimeVO.setTheater_no(theater_no);
//        				showtimeVO.setSeat_no(seat_no);
//        				showtimeVO.setShowtime_time(showtime_time);
//        				list_showtimeVO.add(showtimeVO);
        			}
        		}
        		// Send the use back to the form, if there were errors
        		if (!errorMsgs.isEmpty()) {
//        			req.setAttribute("showtimeVO", showtimeVO); // �t����J�榡���~��empVO����,�]�s�Jreq
        			RequestDispatcher failureView = req
        					.getRequestDispatcher("/back-end/showtime/addShowtime.jsp");
        			failureView.forward(req, res);
        			return; //�{�����_
        		}
        		/***************************2.�}�l�s�W���***************************************/
        		showtimeSvc.addShowtimes(list_showtimeVO);
        		/***************************3.�s�W����,�ǳ����(Send the Success view)***********/
        		String url = "/back-end/showtime/listAllShowtime.jsp?whichPage=99999";
        		RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllTheater.jsp
        		successView.forward(req, res);				
        		
        		/***************************��L�i�઺���~�B�z**********************************/
        	} catch (Exception e) {
        		errorMsgs.add(e.getMessage());
        		RequestDispatcher failureView = req
        				.getRequestDispatcher("/back-end/showtime/addShowtime.jsp");
        		failureView.forward(req, res);
        	}
        }
        
		
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer showtime_no = new Integer(req.getParameter("showtime_no"));
				
				/***************************2.�}�l�R�����***************************************/
				ShowtimeService showtimeSvc = new ShowtimeService();
				showtimeSvc.deleteShowtime(showtime_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				String url = "/back-end/showtime/listAllShowtime.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/showtime/listAllShowtime.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("listShowtimes_ByCompositeQuery".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				
				/***************************1.�N��J����ରMap**********************************/ 
				//�ĥ�Map<String,String[]> getParameterMap()����k 
				//�`�N:an immutable java.util.Map 
				Map<String, String[]> map = req.getParameterMap();
				
				/***************************2.�}�l�ƦX�d��***************************************/
				ShowtimeService showtimeSvc = new ShowtimeService();
				List<ShowtimeVO> list  = showtimeSvc.getAll(map);
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("listShowtimes_ByCompositeQuery", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/showtime/listShowtimes_ByCompositeQuery.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/showtime/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if("getOne_For_Showtime".equals(action)) {
			
			try {
				Integer showtime_no = new Integer(req.getParameter("showtime_no"));
				
				ShowtimeService showtimeSvc = new ShowtimeService();
				ShowtimeVO showtimeVO = showtimeSvc.getOneShowtime(showtime_no);
				
				req.setAttribute("showtimeVO", showtimeVO);
				
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/showtime/listAllShowtime.jsp");
				successView.forward(req, res);
				return;
				
			}catch (Exception e) {
				throw new ServletException(e);
			}
		}
		if("getOne_For_Onsite".equals(action)) {
			
			try {
				Integer showtime_no = new Integer(req.getParameter("showtime_no"));
				
				ShowtimeService showtimeSvc = new ShowtimeService();
				ShowtimeVO showtimeVO = showtimeSvc.getOneShowtime(showtime_no);
				
				req.setAttribute("showtimeVO", showtimeVO);
				
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/order/onSite.jsp");
				successView.forward(req, res);
				return;
				
			}catch (Exception e) {
				throw new ServletException(e);
			}
		}
		
		//ajax
		if("getMovieFromHibernate".equals(action)) {
			System.out.println("�ڦ��i��!!!");
			PrintWriter out = res.getWriter();
			
			ShowtimeService showtimeSvc = new ShowtimeService();
			
			List<Object[]> list = showtimeSvc.getAllShowtimeByDate();
			List<Integer> list_movie_no = new ArrayList<Integer>();
			List<String> list_movie_name =  new ArrayList<String>();
			
			for(Object[] object : list) {
				list_movie_no.add((Integer)object[0]);
				list_movie_name.add((String)object[1]);
				System.out.println(object[0]);
				System.out.println(object[1]);
			}
			
			JSONArray movie_no = new JSONArray(list_movie_no);
			JSONArray movie_name = new JSONArray(list_movie_name);
			JSONObject jsonobj=new JSONObject();
			try {
				jsonobj.put("movie_no", movie_no);
				jsonobj.put("movie_name", movie_name);
				out.println(jsonobj);
				return;
			}catch(JSONException e) {
				e.printStackTrace();
			}finally {
				out.flush();
				out.close();
			}
			
		}
		
		if("getDateFromHibernate".equals(action)) {
			
			PrintWriter out = res.getWriter();
			
			Integer movie_no = new Integer(req.getParameter("movie_no"));
			
			String sql = "select distinct date(showtime_time) from showtime"
					+ " where movie_no = " + movie_no + " and showtime_time > now() order by date(showtime_time)";
			ShowtimeService showtimeSvc = new ShowtimeService();
			List<Object[]> list = showtimeSvc.getByHibernate(sql);
			
			JSONArray showtime_date = new JSONArray(list);
			JSONObject jsonobj=new JSONObject();
			try {
				jsonobj.put("showtime_date", showtime_date);
				out.println(jsonobj);
				return;
			}catch(JSONException e) {
				e.printStackTrace();
			}finally {
				out.flush();
				out.close();
			}
		}
		
		if("getTimeFromHibernate".equals(action)) {
			PrintWriter out = res.getWriter();
			
			Integer movie_no = new Integer(req.getParameter("movie_no"));
			String showtime_date =req.getParameter("showtime_date");
			String sql = "select showtime_no, time(showtime_time) from showtime where movie_no = " + movie_no 
					+ " and date(showtime_time) =" + "'" + showtime_date + "'" + " and showtime_time > now() order by time(showtime_time)";
			
			ShowtimeService showtimeSvc = new ShowtimeService();
			List<Object[]> list = showtimeSvc.getByHibernate(sql);
			List<Integer> list_showtimeno = new ArrayList<Integer>();
			List<java.sql.Time> list_showtime_time = new ArrayList<java.sql.Time>();
			 
			for(Object[] object : list) {
				list_showtimeno.add((Integer) object[0]);
				list_showtime_time.add((Time) object[1]);
			}
			
			JSONArray showtime_no = new JSONArray(list_showtimeno);
			JSONArray showtime_time = new JSONArray(list_showtime_time);
			JSONObject jsonobj=new JSONObject();
			try {
				jsonobj.put("showtime_no", showtime_no);
				jsonobj.put("showtime_time", showtime_time);
				out.println(jsonobj);
				return;
			}catch(JSONException e) {
				e.printStackTrace();
			}finally {
				out.flush();
				out.close();
			}
		}
		
		//�ƦX�d��
		if("listByCompositeQuery".equals(action)) {
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
				ShowtimeService showtimeSvc = new ShowtimeService();
				List<ShowtimeVO> list  = showtimeSvc.getAll(map);
				for(int i = 0; i < list.size(); i++) {
					Timestamp now = new Timestamp(System.currentTimeMillis());
					ShowtimeVO showtimeVO = list.get(i);
					if(showtimeVO.getShowtime_time().before(now)) {
						list.remove(i);
						i--;
					}
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("list", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/back-end/order/onSite.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/back-end/order/onSite.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
