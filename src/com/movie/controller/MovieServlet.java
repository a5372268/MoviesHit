package com.movie.controller;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.movie.model.*;
import com.comment.model.*;
import com.rating.model.*;
import com.expectation.model.*;
import com.mem.model.MemService;
import com.mem.model.MemVO;


@WebServlet("/MovieServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class MovieServlet extends HttpServlet {
//	private MovieTimer movieTimer;
	long count = 0;
	Timer movieTimer = new Timer();
	Calendar cal = new GregorianCalendar(2021, Calendar.MAY, 19, 00, 01);
	
	public void init() throws ServletException {

		movieTimer.scheduleAtFixedRate(new TimerTask() {
			public void run() {
				MovieService movieSvc = new MovieService();
				movieSvc.updateMovieStatus();
				System.out.println("update movie status = " + count);
				System.out.println(new Date(scheduledExecutionTime()));
				count++;
			}
		}, cal.getTime(), 24*60*60*1000);
	}
	
	public void destroy() {
		movieTimer.cancel();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				String str = req.getParameter("movieno");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�q�v�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/movie/error.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				Integer movieno = null;
				try {
					movieno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�q�v�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/movie/error.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}

				/*************************** 2.�}�l�d�߸�� *****************************************/
				MovieService movieSvc = new MovieService();
				MovieVO movieVO = movieSvc.getOneMovie(movieno);
				if (movieVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/front-end/movie/error.jsp");
					failureView.forward(req, res);
					return;// �{�����_
				}
				RatingService ratingSvc = new RatingService();
				RatingVO ratingCount = ratingSvc.getThisMovieToatalRating(movieno);
				req.setAttribute("ratingCount", ratingCount);

				ExpectationService expectationSvc = new ExpectationService();
				ExpectationVO expectationCount = expectationSvc.getThisMovieToatalExpectation(movieno);
				req.setAttribute("expectationCount", expectationCount);
				
//				Integer openModal=1;
//				req.setAttribute("openModal",openModal );

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) *************/
				req.setAttribute("movieVO", movieVO); // ��Ʈw���X��movieVO����,�s�Jreq
				String url = "/front-end/movie/listOneMovie.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���listOneMovie.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/movie/error.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Display_Ajax".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("movieno");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�q�v�s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/mem/memberSys.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer movieno = null;
				try {
					movieno = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�q�v�s���榡�����T");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/mem/memberSys.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				MovieService movieSvc = new MovieService();
				MovieVO movieVO = movieSvc.getOneMovie(movieno);
				CommentService comSvc = new CommentService();
				List<CommentVO> comVO = comSvc.getOneMovieComment(movieno);
				if (movieVO == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {

					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/mem/memberSys.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				MemService memSvc = new MemService();
				double allRating=movieVO.getRating();
				JSONArray allComment = new JSONArray(comVO);  //
				
				for(int i = 0; i< allComment.length(); i++) {
					JSONObject obj = allComment.getJSONObject(i);
					int memberno = obj.getInt("memberno");
					MemVO vo = memSvc.getOneMem(memberno);
					if(vo != null) {
						String mb_name = vo.getMb_name();
						obj.put("mb_name", mb_name);
					}
				}

				
				JSONObject jsonobj=new JSONObject();
				try {
					jsonobj.put("allRating", allRating);
					jsonobj.put("allComment", allComment);
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
						.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllMovie.jsp
			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��
																// �i/dept/listEmps_ByDeptno.jsp�j �� �i
																// /dept/listAllDept.jsp�j

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				Integer movieno = new Integer(req.getParameter("movieno"));

				/*************************** 2.�}�l�d�߸�� ****************************************/
				MovieService movieSvc = new MovieService();
				MovieVO movieVO = movieSvc.getOneMovie(movieno);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("movieVO", movieVO); // ��Ʈw���X��movieVO����,�s�Jreq
				String url = "/back-end/movie/update_movie_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\���update_movie_input.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ************************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", "�ק��ƨ��X�ɥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_movie_input.jsp���ШD

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
//			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllMovie.jsp�j ��
																// �i/dept/listEmps_ByDeptno.jsp�j �� �i
																// /dept/listAllDept.jsp�j

			try {
				/*************************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z **********************/
				Integer movieno = new Integer(req.getParameter("movieno").trim());
				String moviename = req.getParameter("moviename");
				if (moviename == null || moviename.trim().length() == 0) {
					errorMsgs.put("moviename", "�q�v�W��: �ФŪť�");
				}
			
				Part part = req.getPart("moviepicture1");
				String filenameExtension = getServletContext().getMimeType(part.getSubmittedFileName());
				InputStream in = part.getInputStream();
				byte[] moviepicture1 = new byte[in.available()];
				// �P�_�O�_����s�Ϥ�
				if (in.available() == 0) {

					MovieService movieSvc = new MovieService();
					MovieVO movieVO = movieSvc.getOneMovie(movieno);
					moviepicture1 = movieVO.getMoviepicture1();
					in.read(moviepicture1);
					in.close();

				} else {
					if (filenameExtension.equals("image/apng") || filenameExtension.equals("image/avif")
							|| filenameExtension.equals("image/gif") || filenameExtension.equals("image/jpeg")
							|| filenameExtension.equals("image/png") || filenameExtension.equals("image/svg+xml")
							|| filenameExtension.equals("image/webp")) {
						in.read(moviepicture1);
						in.close();
					} else {
						errorMsgs.put("moviepicture1",
								"�W�ǹϤ����ɦW�����O.apng,.avif,.gif,.jpg,.jpeg,.jfif,.pjpeg,.pjp,.png,.svg,.webp");
					}
				}
				
				Part part2 = req.getPart("moviepicture2");
				String filenameExtension2 = getServletContext().getMimeType(part2.getSubmittedFileName());
				InputStream in2 = part2.getInputStream();
				byte[] moviepicture2 = new byte[in2.available()];
				// �P�_�O�_����s�Ϥ�
				if (in2.available() == 0) {
					MovieService movieSvc = new MovieService();
					MovieVO movieVO = movieSvc.getOneMovie(movieno);
					moviepicture2 = movieVO.getMoviepicture2();
					in2.read(moviepicture2);
					in2.close();
				} else {
					if (filenameExtension2.equals("image/apng") || filenameExtension2.equals("image/avif")
							|| filenameExtension2.equals("image/gif") || filenameExtension2.equals("image/jpeg")
							|| filenameExtension2.equals("image/png") || filenameExtension2.equals("image/svg+xml")
							|| filenameExtension2.equals("image/webp")) {
						in2.read(moviepicture2);
						in2.close();
					} else {
						errorMsgs.put("moviepicture2",
								"�W�ǹϤ����ɦW�����O.apng,.avif,.gif,.jpg,.jpeg,.jfif,.pjpeg,.pjp,.png,.svg,.webp");
					}
				}
				String director = req.getParameter("director").trim();
				if (director == null || director.trim().length() == 0) {
					errorMsgs.put("director", "�ɺt�W�r�ФŪť�");
				}

				String actor = req.getParameter("actor").trim();
				if (actor == null || actor.trim().length() == 0) {
					errorMsgs.put("actor", "�t���W�r�ФŪť�");
				}

				String category = "";
				if (req.getParameterValues("category") == null || req.getParameterValues("category").length == 0) {
					errorMsgs.put("category", "�q�v�����ФŪť�");
				} else {
					String values[] = req.getParameterValues("category");
					for (int i = 0; i < values.length; i++) {
						if (i == values.length - 1) {
							category += values[i];
						} else {
							category = category + values[i] + ",";
						}
					}
				}

				Integer length = null;
				try {
					length = new Integer(req.getParameter("length").trim());
				} catch (NumberFormatException e) {
					length = 0;
					errorMsgs.put("length", "�q�v���׽ж�Ʀr.");
				}

				String status = req.getParameter("status").trim();
				if (status == null || status.trim().length() == 0) {
					errorMsgs.put("status", "�q�v���A�ФŪť�");// ��input type="TEXT"�Ϊ�
				} else if (status.equals("9")) {
					errorMsgs.put("status", "�п�ܹq�v���A");// ��select�U�Ԧ����C�@�ӯd�ťեΪ�
				}

				SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
				java.sql.Date premiredate = null;
				java.sql.Date offdate = null;
				try {
					premiredate = java.sql.Date.valueOf(req.getParameter("premiredate").trim());

				} catch (Exception e) {
					premiredate = null;
				}
				try {
					offdate = java.sql.Date.valueOf(req.getParameter("offdate").trim());
				} catch (Exception e) {
					offdate = null;
				}
				if (premiredate == null && offdate == null) {
				} else if (premiredate == null && offdate != null) {
					errorMsgs.put("premiredate", "���U�M����N�n���W�M���");
				} else if (premiredate != null && offdate != null) {
					if (offdate.before(premiredate)) {
						errorMsgs.put("offdate", "�U�M����n��W�M�����");
					}
					if (fmt.format(premiredate).equals(fmt.format(offdate))) {
						errorMsgs.put("offdate", "�W�M��ѴN�U�M,�i�H�o�ˤW�W�U�U��?�i�H��?????");
					}
				}

//				String trailor = req.getParameter("trailor").trim();
//				String embed = req.getParameter("embed").trim();
//				String trailorReg = "^(https?\\:\\/\\/)?(www\\.)?(youtube\\.com|youtu\\.?be)\\/.+$";
//				
//				if(trailor.length() ==0  && embed.length() ==0) {
//					trailor = null;
//					embed = null;
//				}else if(trailor.length() !=0  && embed.length() ==0) {
//					if (!trailor.trim().matches(trailorReg)) {
//						errorMsgs.put("trailor", "�п�J���T�榡���}");
//					}
//					errorMsgs.put("embed", "����J�w�i�����},�O�o���W�u���}");
//				}else if(trailor.length() ==0  && embed.length() !=0) {
//					errorMsgs.put("trailor", "�аO�o��J�w�i�����}");
//				}else if(trailor.length() !=0  && embed.length() !=0) {
//					if (!trailor.trim().matches(trailorReg)) {
//						errorMsgs.put("trailor", "�п�J���T�榡���}");
//					}
//				}
				
				String trailor = req.getParameter("trailor").trim();
				String trailorReg = "^(https?\\:\\/\\/)?(www\\.)?(youtube\\.com|youtu\\.?be)\\/.+$";
				String embed = null;
				if(trailor.length() ==0) {
					trailor = "https://www.youtube.com/watch?v=";
					embed = "26Q8duJW11s";
				}else {
					if (trailor.trim().matches(trailorReg)) {
						if(trailor.equals("https://www.youtube.com/watch?v=")) {
							embed = "26Q8duJW11s";
						}else {
							String[] strs= trailor.split("=");
							int len=strs.length;
							for(int i=0;i<len;i++  ){
								embed = strs[1].toString();
							}
						}
					}else {
						errorMsgs.put("trailor", "�п�J���T�榡���}");
					}
				}


				String grade = req.getParameter("grade").trim();
				if (grade == null || grade.trim().length() == 0) {
					errorMsgs.put("grade", "�q�v���ŽФŪť�");// ��input type="TEXT"�Ϊ�
				} else if (grade.equals("9")) {
					errorMsgs.put("grade", "�п�ܹq�v����");// ��select�U�Ԧ����Ϊ�
				}

				MovieVO movieVO = new MovieVO();
				movieVO.setMovieno(movieno);
				movieVO.setMoviename(moviename);
				movieVO.setMoviepicture1(moviepicture1);
				movieVO.setMoviepicture2(moviepicture2);
				movieVO.setDirector(director);
				movieVO.setActor(actor);
				movieVO.setCategory(category);
				movieVO.setLength(length);
				movieVO.setStatus(status);
				movieVO.setPremiredate(premiredate);
				movieVO.setOffdate(offdate);
				movieVO.setTrailor(trailor);
				movieVO.setEmbed(embed);
				movieVO.setGrade(grade);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("movieVO", movieVO); // �t����J�榡���~��movieVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/movie/update_movie_input.jsp");
					failureView.forward(req, res);
					return; // �{�����_
				}
				/*************************** 2.�}�l�ק��� *****************************************/
				MovieService movieSvc = new MovieService();
				movieVO = movieSvc.updateMovie(movieno, moviename, moviepicture1, moviepicture2, director, actor,
						category, length, status, premiredate, offdate, trailor, embed, grade);

				/*************************** 3.�ק粒��,�ǳ����(Send the Success view) *************/
//				req.setAttribute("movieVO", movieVO); // ��Ʈwupdate���\��,���T����movieVO����,�s�Jreq

				if (requestURL.equals("/back-end/movie/backEndlistMovies_ByCompositeQuery.jsp")) {
					HttpSession session = req.getSession();
					Map<String, String[]> map = (Map<String, String[]>) session.getAttribute("map");
					List<MovieVO> list = movieSvc.getAll(map);
					req.setAttribute("listMovies_ByCompositeQuery", list); // �ƦX�d��, ��Ʈw���X��list����,�s�Jrequest
				}

				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneMovie.jsp
//				RequestDispatcher successView = req.getRequestDispatcher("/back-end/movie/backEndlistAllMovie.jsp");
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z *************************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
System.out.println("updatemovie���F"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/movie/update_movie_input.jsp");
				failureView.forward(req, res);
				
			}
		}

		if ("insert".equals(action)) { // �Ӧ�addMovie.jsp���ШD

			Map<String, String> errorMsgs = new LinkedHashMap<String, String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.�����ШD�Ѽ� - ��J�榡�����~�B�z *************************/
//������
				String moviename = req.getParameter("moviename");
//					String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,30}$";
				if (moviename == null || moviename.trim().length() == 0) {
					errorMsgs.put("moviename", "�q�v�W��: �ФŪť�");
//				} else if(!moviename.trim().matches(enameReg)) { //�H�U�m�ߥ��h(�W)��ܦ�(regular-expression)
//					errorMsgs.add("�q�v�W��: �u��O���B�^��r���B�Ʀr�M_ , �B���ץ��ݦb2��30����");
				}

				Part part = req.getPart("moviepicture1");
				String filenameExtension = getServletContext().getMimeType(part.getSubmittedFileName());
				InputStream in = part.getInputStream();
				byte[] moviepicture1 = new byte[in.available()];
				if (!(in.available() == 0)) {
					if (filenameExtension.equals("image/apng") || filenameExtension.equals("image/avif")
							|| filenameExtension.equals("image/gif") || filenameExtension.equals("image/jpeg")
							|| filenameExtension.equals("image/png") || filenameExtension.equals("image/svg+xml")
							|| filenameExtension.equals("image/webp")) {
						in.read(moviepicture1);
						in.close();
					} else {
						errorMsgs.put("moviepicture1",
								"�W�ǹϤ����ɦW�����O.apng,.avif,.gif,.jpg,.jpeg,.jfif,.pjpeg,.pjp,.png,.svg,.webp");
					}
				}

				Part part2 = req.getPart("moviepicture2");
				String filenameExtension2 = getServletContext().getMimeType(part2.getSubmittedFileName());
				InputStream in2 = part2.getInputStream();
				byte[] moviepicture2 = new byte[in2.available()];
				if (!(in2.available() == 0)) {
					if (filenameExtension2.equals("image/apng") || filenameExtension2.equals("image/avif")
							|| filenameExtension2.equals("image/gif") || filenameExtension2.equals("image/jpeg")
							|| filenameExtension2.equals("image/png") || filenameExtension2.equals("image/svg+xml")
							|| filenameExtension2.equals("image/webp")) {
						in2.read(moviepicture2);
						in2.close();
					} else {
						errorMsgs.put("moviepicture2",
								"�W�ǹϤ����ɦW�����O.apng,.avif,.gif,.jpg,.jpeg,.jfif,.pjpeg,.pjp,.png,.svg,.webp");
					}
				}

				String director = req.getParameter("director").trim();
				if (director == null || director.trim().length() == 0) {
					errorMsgs.put("director", "�ɺt�W�r�ФŪť�");
				}

				String actor = req.getParameter("actor").trim();
				if (actor == null || actor.trim().length() == 0) {
					errorMsgs.put("actor", "�t���W�r�ФŪť�");
				}

				String category = "";
				if (req.getParameterValues("category") == null || req.getParameterValues("category").length == 0) {
					errorMsgs.put("category", "�q�v�����ФŪť�");
				} else {
					String values[] = req.getParameterValues("category");
					for (int i = 0; i < values.length; i++) {
						if (i == values.length - 1) {
							category += values[i];
						} else {
							category = category + values[i] + ",";
						}
					}
				}

				Integer length = null;
				try {
					length = new Integer(req.getParameter("length").trim());
				} catch (NumberFormatException e) {
					length = 0;
					errorMsgs.put("length", "�Э��s��J�q�v����");
				}
//				System.out.println(length.intValue());

				String status = req.getParameter("status").trim();
				if (status == null || status.trim().length() == 0) {
					errorMsgs.put("status", "�q�v���A�ФŪť�");// ��input type="TEXT"�Ϊ�
				} else if (status.equals("9")) {
					errorMsgs.put("status", "�п�ܹq�v���A");// ��select�U�Ԧ����C�@�ӯd�ťեΪ�
				}

				SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
				java.sql.Date premiredate = null;
				java.sql.Date offdate = null;
				try {
					premiredate = java.sql.Date.valueOf(req.getParameter("premiredate").trim());

				} catch (Exception e) {
					premiredate = null;
				}
				try {
					offdate = java.sql.Date.valueOf(req.getParameter("offdate").trim());
				} catch (Exception e) {
					offdate = null;
				}
				if (premiredate == null && offdate == null) {
				} else if (premiredate == null && offdate != null) {
					errorMsgs.put("premiredate", "���U�M����N�n���W�M���");
				} else if (premiredate != null && offdate != null) {
					if (offdate.before(premiredate)) {
						errorMsgs.put("offdate", "�U�M����n��W�M�����");
					}
					if (fmt.format(premiredate).equals(fmt.format(offdate))) {
						errorMsgs.put("offdate", "�W�M��ѴN�U�M,�i�H�o�ˤW�W�U�U��?�i�H��?????");
					}
				}

//				String trailor = req.getParameter("trailor").trim();
//				String embed = req.getParameter("embed").trim();
//				String trailorReg = "^(https?\\:\\/\\/)?(www\\.)?(youtube\\.com|youtu\\.?be)\\/.+$";
//				
//				if(trailor.length() ==0  && embed.length() ==0) {
//					trailor = null;
//					embed = null;
//				}else if(trailor.length() !=0  && embed.length() ==0) {
//					if (!trailor.trim().matches(trailorReg)) {
//						errorMsgs.put("trailor", "�п�J���T�榡���}");
//					}
//					errorMsgs.put("embed", "����J�w�i�����},�O�o���W�u���}");
//				}else if(trailor.length() ==0  && embed.length() !=0) {
//					errorMsgs.put("trailor", "�аO�o��J�w�i�����}");
//				}else if(trailor.length() !=0  && embed.length() !=0) {
//					if (!trailor.trim().matches(trailorReg)) {
//						errorMsgs.put("trailor", "�п�J���T�榡���}");
//					}
//				}
				
				String trailor = req.getParameter("trailor").trim();
				String trailorReg = "^(https?\\:\\/\\/)?(www\\.)?(youtube\\.com|youtu\\.?be)\\/.+$";
				String embed = null;
				if(trailor.length() ==0) {
					trailor = "https://www.youtube.com/watch?v=";
					embed = "26Q8duJW11s";
				}else {
					if (trailor.trim().matches(trailorReg)) {
						if(trailor.equals("https://www.youtube.com/watch?v=")) {
							embed = "26Q8duJW11s";
						}else {
							String[] strs= trailor.split("=");
							int len=strs.length;
							for(int i=0;i<len;i++  ){
								embed = strs[1].toString();
							}
						}
					}else {
						errorMsgs.put("trailor", "�п�J���T�榡���}");
					}
				}

				String grade = req.getParameter("grade").trim();
				if (grade == null || grade.trim().length() == 0) {
					errorMsgs.put("grade", "�q�v���ŽФŪť�");// ��input type="TEXT"�Ϊ�
				} else if (grade.equals("9")) {
					errorMsgs.put("grade", "�п�ܹq�v����");// ��select�U�Ԧ����Ϊ�
				}

				MovieVO movieVO = new MovieVO();
				movieVO.setMoviename(moviename);
				movieVO.setMoviepicture1(moviepicture1);
				movieVO.setMoviepicture2(moviepicture2);
				movieVO.setDirector(director);
				movieVO.setActor(actor);
				movieVO.setCategory(category);
				movieVO.setLength(length);
				movieVO.setStatus(status);
				movieVO.setPremiredate(premiredate);
				movieVO.setOffdate(offdate);
				movieVO.setTrailor(trailor);
				movieVO.setEmbed(embed);
				movieVO.setGrade(grade);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("movieVO", movieVO); // �t����J�榡���~��movieVO����,�]�s�Jreq
					RequestDispatcher failureView = req.getRequestDispatcher("/back-end/movie/addMovie.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.�}�l�s�W��� ***************************************/
				MovieService movieSvc = new MovieService();
				movieVO = movieSvc.addMovie(moviename, moviepicture1, moviepicture2, director, actor, category, length,
						status, premiredate, offdate, trailor, embed, grade);

				/*************************** 3.�s�W����,�ǳ����(Send the Success view) ***********/
				String url = "/back-end/movie/backEndlistAllMovie.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // �s�W���\�����listAllMovie.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.put("Exception", e.getMessage());
System.out.println("insertMovie�X���F"+e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/movie/addMovie.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp �� /dept/listEmps_ByDeptno.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			String requestURL = req.getParameter("requestURL"); // �e�X�R�����ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j

			try {
				/*************************** 1.�����ШD�Ѽ� ***************************************/
				Integer movieno = new Integer(req.getParameter("movieno"));

				/*************************** 2.�}�l�R����� ***************************************/
				MovieService movieSvc = new MovieService();
				movieSvc.deleteMovie(movieno);

				/*************************** 3.�R������,�ǳ����(Send the Success view) ***********/

				String url = "/back-end/movie/backEndlistAllMovie.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/movie/backEndlistAllMovie.jsp");
				failureView.forward(req, res);
			}
		}

		if ("listMovies_ByCompositeQuery".equals(action) || "listMovies_ByCompositeQuery_back".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {

				/*************************** 1.�N��J����ରMap **********************************/
				// �ĥ�Map<String,String[]> getParameterMap()����k
				// �`�N:an immutable java.util.Map
				// Map<String, String[]> map = req.getParameterMap();
				HttpSession session = req.getSession();
				Map<String, String[]> map = (Map<String, String[]>) session.getAttribute("map");

				// �H�U�� if �϶��u��Ĥ@������ɦ���
				if (req.getParameter("whichPage") == null) {
					Map<String, String[]> map1 = new HashMap<String, String[]>(req.getParameterMap());
					session.setAttribute("map", map1);
					map = map1;
				}

				/*************************** 2.�}�l�ƦX�d�� ***************************************/
				MovieService movieSvc = new MovieService();
				List<MovieVO> list = movieSvc.getAll(map);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("listMovies_ByCompositeQuery", list); // ��Ʈw���X��list����,�s�Jrequest
				
				String url = null;
				if ("listMovies_ByCompositeQuery".equals(action)) {
					url = "/front-end/movie/listMovies_ByCompositeQuery.jsp"; 
				}
				else if ("listMovies_ByCompositeQuery_back".equals(action)) {
					url = "/back-end/movie/backEndlistMovies_ByCompositeQuery.jsp"; 
				}//�o�n�令��ݽƦX�d��
					
				
				RequestDispatcher successView = req
						.getRequestDispatcher(url); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/back-end/movie/backEndlistAllMovie.jsp");
				failureView.forward(req, res);
			}
		}

		if ("listComments_ByMovieno_A".equals(action) || "listComments_ByMovieno_B".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.�����ШD�Ѽ� ****************************************/
				Integer movieno = new Integer(req.getParameter("movieno"));

				/*************************** 2.�}�l�d�߸�� ****************************************/
				MovieService movieSvc = new MovieService();
				Set<CommentVO> set = movieSvc.getCommentsByMovieno(movieno);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("listComments_ByMovieno", set); // ��Ʈw���X��list����,�s�Jrequest

				String url = null;
				if ("listComments_ByMovieno_A".equals(action))
					url = "/front-end/movie/listOneMovie.jsp"; // ���\��� dept/listEmps_ByDeptno.jsp
				else if ("listComments_ByMovieno_B".equals(action))
					url = "/front-end/movie/listAllMovie.jsp"; // ���\��� dept/listAllDept.jsp

				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z ***********************************/
			} catch (Exception e) {
				throw new ServletException(e);
			}
		}

		if ("getPicForDisplay".equals(action)) {
			Integer movieno = new Integer(req.getParameter("movieno"));
			MovieService movieSvc = new MovieService();
			MovieVO movieVO = movieSvc.getOneMovie(movieno);
			byte[] moviepicture1 = movieVO.getMoviepicture1();
			if (moviepicture1 != null) {
				res.getOutputStream().write(moviepicture1);
			} else {
				InputStream in = getServletContext().getResourceAsStream("/images/NoData/none2.jpg");
				byte[] b = new byte[in.available()];
				in.read(b);
				res.getOutputStream().write(b);
				in.close();
			}
		}

		if ("listMovies_ByYear".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				String year = req.getParameter("year");
				/*************************** 2.�}�l�ƦX�d�� ***************************************/
				MovieService movieSvc = new MovieService();
				List<MovieVO> list = (List<MovieVO>) req.getAttribute("list");
				list = movieSvc.getYearMovie(year);

				/*************************** 3.�d�ߧ���,�ǳ����(Send the Success view) ************/
				req.setAttribute("list", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/movie/listAllMovie.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);

				/*************************** ��L�i�઺���~�B�z **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/front-end/movie/error.jsp");
				failureView.forward(req, res);
			}
		}

//		if ("getNewExpectation_Ajax".equals(action)) { // �Ӧ�select_page.jsp���ШD
//
//			List<String> errorMsgs = new LinkedList<String>();
//			// Store this set in the request scope, in case we need to
//			// send the ErrorPage view.
//			req.setAttribute("errorMsgs", errorMsgs);
//			PrintWriter out = res.getWriter();
//
//			try {
//				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
//				String str = req.getParameter("movieno");
//				if (str == null || (str.trim()).length() == 0) {
//					errorMsgs.add("�п�J�q�v�s��");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/movie/select_movie_page.jsp");
//					failureView.forward(req, res);
//					return;//�{�����_
//				}
//				
//				Integer movieno = null;
//				try {
//					movieno = new Integer(str);
//				} catch (Exception e) {
//					errorMsgs.add("�q�v�s���榡�����T");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/movie/select_movie_page.jsp");
//					failureView.forward(req, res);
//					return;//�{�����_
//				}
//				
//				/***************************2.�}�l�d�߸��*****************************************/
//				MovieService movieSvc = new MovieService();
//				MovieVO movieVO = movieSvc.getOneMovie(movieno);
////				CommentService comSvc = new CommentService();
////				List<CommentVO> comVO = comSvc.getOneMovieComment(movieno);
//				if (movieVO == null) {
//					errorMsgs.add("�d�L���");
//				}
//				// Send the use back to the form, if there were errors
//				if (!errorMsgs.isEmpty()) {
//
//					RequestDispatcher failureView = req
//							.getRequestDispatcher("/front-end/movie/select_movie_page.jsp");
//					failureView.forward(req, res);
//					return;//�{�����_
//				}
//
//				double newExpectation=movieVO.getExpectation();
//				JSONObject jsonobj=new JSONObject();
//				try {
//					jsonobj.put("newExpectation", newExpectation);
//					out.print(jsonobj.toString());
//					return;
//				}catch(JSONException e) {
//					e.printStackTrace();
//				}finally {
//					out.flush();
//					out.close();
//				}
//
//				/***************************��L�i�઺���~�B�z*************************************/
//			} catch (Exception e) {
//				errorMsgs.add("�L�k���o���:" + e.getMessage());
//				RequestDispatcher failureView = req
//						.getRequestDispatcher("/front-end/movie/select_movie_page.jsp");
//				failureView.forward(req, res);
//			}
//		}
		if ("search_Ajax".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
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
				MovieService movieSvc = new MovieService();
				List<MovieVO> list  = movieSvc.getAll(map);
				
				for( MovieVO movieVO : list) {
					movieVO.setMoviepicture1(null);
					movieVO.setMoviepicture2(null);
				}
				JSONArray results = new JSONArray(list);  //
				JSONObject jsonobj=new JSONObject();
				try {
					jsonobj.put("results", results);
					out.print(jsonobj.toString());
					return;
				}catch(JSONException e) {
					e.printStackTrace();
				}finally {
					out.flush();
					out.close();
				}
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/movie/error.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
