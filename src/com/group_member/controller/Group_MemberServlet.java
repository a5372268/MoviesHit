package com.group_member.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.apache.catalina.tribes.MembershipService;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.group.model.GroupService;
import com.group.model.GroupVO;
import com.group_member.model.*;

@WebServlet("/Group_MemberServlet")

public class Group_MemberServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=utf-8");
		String action = req.getParameter("action");
		
		if ("getOne_For_Display".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("group_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J���νs��");
				}
				String str2 = req.getParameter("member_no");
				if (str2 == null || (str2.trim()).length() == 0) {
					errorMsgs.add("�п�J�|���s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				Integer group_no = null;
				try {
					group_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("���νs���榡�����T");
				}
				
				Integer member_no = null;
				try {
					member_no = new Integer(str2);
				} catch (Exception e) {
					errorMsgs.add("�|���s���榡�����T");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				Group_MemberService group_memberSvc = new Group_MemberService();
				Group_MemberVO group_memberVO = group_memberSvc.getOneGroup_Member(group_no, member_no);
				
			
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("group_memberVO", group_memberVO); // ��Ʈw���X��group_memberVO����,�s�Jreq
				String url = "/front-end/group_member/listOneGroup_Member.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // �Ӧ�listAllEmp.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j		
			
			try {
				/***************************1.�����ШD�Ѽ�****************************************/
				Integer group_no = new Integer(req.getParameter("group_no"));
				Integer member_no = new Integer(req.getParameter("member_no"));
				/***************************2.�}�l�d�߸��****************************************/
				Group_MemberService group_memberSvc = new Group_MemberService();
				Group_MemberVO group_memberVO = group_memberSvc.getOneGroup_Member(group_no, member_no);
								
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("group_memberVO", group_memberVO);         // ��Ʈw���X��group_memberVO����,�s�Jreq
				String url = "/front-end/group_member/update_group_member_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// ���\��� update_emp_input.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // �Ӧ�update_emp_input.jsp���ШD
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j �� �i /emp/listEmps_ByCompositeQuery.jsp�j
			
			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				//GROUP_NO
				Integer group_no  = null;
				try {
					group_no = new Integer(req.getParameter("group_no").trim());
				} catch(NumberFormatException e) {
					errorMsgs.add("�䤣�촪�νs��");
				}
				
				//MEMBER_NO
				Integer member_no  = null;
				try {
					member_no = new Integer(req.getParameter("member_no").trim());
				} catch(NumberFormatException e) {
					errorMsgs.add("�䤣��|���s��");
				}

				//PAY_STATUS
				String pay_status = req.getParameter("pay_status").trim();
				if (pay_status == "null" || pay_status.trim().length() == 0) {
					pay_status = "0";
					errorMsgs.add("�I�ڪ��A�ФŪť�");
				}

				//STATUS
				String status = req.getParameter("status").trim();
				if (status == "null" || pay_status.trim().length() == 0) {
					status = "0";
					errorMsgs.add("���η|�����A�ФŪť�");
				}
				
				//CRT_DT
				java.sql.Timestamp crt_dt = new java.sql.Timestamp(System.currentTimeMillis());;
				
				
				Group_MemberVO group_memberVO = new Group_MemberVO();
				group_memberVO.setGroup_no(group_no);
				group_memberVO.setMember_no(member_no);
				group_memberVO.setPay_status(pay_status);
				group_memberVO.setStatus(status);
				group_memberVO.setCrt_dt(crt_dt);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("group_memberVO", group_memberVO); // �t����J�榡���~��groupVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group_member/update_group_member_input.jsp");
					failureView.forward(req, res);
					return; //�{�����_
				}

				/***************************2.�}�l�ק���*****************************************/
				Group_MemberService group_memberSvc = new Group_MemberService();
				group_memberVO = group_memberSvc.updateGroup_Member(group_no,
						member_no, pay_status, status, crt_dt);

				/***************************3.�ק粒��,�ǳ����(Send the Success view)*************/
				GroupService groupSvc = new GroupService();
				
				if(requestURL.equals("/front-end/group/listMembers_ByGroupno.jsp") 
						|| requestURL.equals("/front-end/group_member/listAllGroup_Member.jsp")  
						) {
					req.setAttribute("listMembers_ByGroupno", groupSvc.getMembersByGroupno(group_no)); // ��Ʈw���X��list����,�s�Jrequest
				}
				if(requestURL.equals("/front-end/group_member/listGroups_ByMemberno.jsp") ) {
					req.setAttribute("listGroups_ByMemberno", group_memberSvc.getGroups(member_no)); // ��Ʈw���X��list����,�s�Jrequest
					
				}
				if(requestURL.equals("/front-end/group_member/listMembers_ByCompositeQuery.jsp")){
					
					HttpSession session = req.getSession();
					Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
					List<Group_MemberVO> list  = group_memberSvc.getAll(map);
					req.setAttribute("listMembers_ByCompositeQuery",list); //  �ƦX�d��, ��Ʈw���X��list����,�s�Jrequest
				}
				
				String url = requestURL;
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // �ק令�\��,���listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�ק��ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);
			}
		}
		
        if ("insert".equals(action)) { // �Ӧ�`.jsp���ШD  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j �� �i /emp/listEmps_ByCompositeQuery.jsp�j
			
			try {
				/***********************1.�����ШD�Ѽ� - ��J�榡�����~�B�z*************************/
				//GROUP_NO
				Integer group_no  = null;
				try {
					group_no = new Integer(req.getParameter("group_no").trim());
					if(group_no <= 0 ) {
						errorMsgs.add("���νs���ж�>0���Ʀr.");
					}
				} catch(NumberFormatException e) {
					group_no = 1;
					errorMsgs.add("�����s���ж�Ʀr.");
				}
				

				//MEMBER_NO
				Integer member_no  = null;
				try {
					member_no = new Integer(req.getParameter("member_no").trim());
					if(member_no <= 0 ) {
						errorMsgs.add("�D���|���s���ж�>0���Ʀr.");
					}
				} catch(NumberFormatException e) {
					member_no = 1;
					errorMsgs.add("�D���|���s���ж�Ʀr.");
				}
	
				
				Group_MemberVO group_memberVO = new Group_MemberVO();
				group_memberVO.setGroup_no(group_no);
				group_memberVO.setMember_no(member_no);
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("group_memberVO", group_memberVO); // �t����J�榡���~��groupVO����,�]�s�Jreq
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/group_member/addGroup_Member.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.�}�l�s�W���***************************************/
				Group_MemberService group_memberSvc = new Group_MemberService();
				group_memberVO = group_memberSvc.addGroup_Member(group_no, member_no);
				/***************************3.�s�W����,�ǳ����(Send the Success view)***********/

				if("/front-end/group/listAllGroup.jsp".equals(requestURL) || "/front-end/group/group_front_page.jsp".equals(requestURL) ) {
					
					req.setAttribute("action", "getOne_From06"); // ��Ʈw���X��list����,�s�Jrequest
					requestURL = "/group/group.do";
				} else if ("/front-end/group/listOneGroup.jsp".equals(requestURL)){

//					req.setAttribute("group_no", group_no); // ��Ʈw���X��list����,�s�Jrequest
					req.setAttribute("action", "getOne_From06"); // ��Ʈw���X��list����,�s�Jrequest
					requestURL = "/group/group.do";
				}
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);

				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/group_member/addGroup_Member.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // �Ӧ�listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			String requestURL = req.getParameter("requestURL"); // �e�X�ק諸�ӷ��������|: �i�ର�i/emp/listAllEmp.jsp�j ��  �i/dept/listEmps_ByDeptno.jsp�j �� �i /dept/listAllDept.jsp�j �� �i /emp/listEmps_ByCompositeQuery.jsp�j
			
			try {
				/***************************1.�����ШD�Ѽ�***************************************/
				Integer group_no = new Integer(req.getParameter("group_no"));
				Integer member_no = new Integer(req.getParameter("member_no"));
				/***************************2.�}�l�R�����***************************************/
				Group_MemberService group_memberSvc = new Group_MemberService();
				group_memberSvc.deleteGroup_Member(group_no, member_no);
				
				/***************************3.�R������,�ǳ����(Send the Success view)***********/								
				GroupService groupSvc = new GroupService();
				if(requestURL.equals("/front-end/group/listMembers_ByGroupno.jsp") || requestURL.equals("/front-end/group/listAllGroup.jsp")
						|| requestURL.equals("/front-end/group/listOneGroup.jsp")) {
					req.setAttribute("listMembers_ByGroupno",groupSvc.getMembersByGroupno(group_no)); // ��Ʈw���X��list����,�s�Jrequest
					req.setAttribute("group_no", group_no);
				}
				GroupVO groupVO = groupSvc.getOneGroup(group_no);
				req.setAttribute("groupVO", groupVO);
				
				
//				if(requestURL.equals("/front-end/group_member/listGroups_ByMemberno.jsp") ) {
//					req.setAttribute("listGroups_ByMemberno", group_memberSvc.getGroups(member_no)); // ��Ʈw���X��list����,�s�Jrequest
//				}

				if(requestURL.equals("/front-end/group_member/listMembers_ByCompositeQuery.jsp")){
					HttpSession session = req.getSession();
					Map<String, String[]> map = (Map<String, String[]>)session.getAttribute("map");
					List<Group_MemberVO> list  = group_memberSvc.getAll(map);
					req.setAttribute("listMembers_ByCompositeQuery",list); //  �ƦX�d��, ��Ʈw���X��list����,�s�Jrequest
				
				}
				String url = requestURL;
				RequestDispatcher successView = req.getRequestDispatcher(url);// �R�����\��,���^�e�X�R�����ӷ�����
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add("�R����ƥ���:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher(requestURL);
				failureView.forward(req, res);	
			}
		}
		
		
		if ("GetGroupsByMember".equals(action)) { // �Ӧ�select_page.jsp���ШD

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.�����ШD�Ѽ� - ��J�榡�����~�B�z**********************/
				String str = req.getParameter("member_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("�п�J�|���s��");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}

				Integer member_no = null;
				try {
					member_no = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("�|���s���榡�����T");
				}
				
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************2.�}�l�d�߸��*****************************************/
				Group_MemberService group_memberSvc = new Group_MemberService();
				List<Group_MemberVO> list = group_memberSvc.getGroups(member_no);
				if (list == null) {
					errorMsgs.add("�d�L���");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/front-end/select_page.jsp");
					failureView.forward(req, res);
					return;//�{�����_
				}
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)*************/
				req.setAttribute("listGroups_ByMemberno", list);
				String url = "/front-end/group_member/listGroups_ByMemberno.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ���\��� listOneEmp.jsp
				successView.forward(req, res);

				/***************************��L�i�઺���~�B�z*************************************/
			} catch (Exception e) {
				errorMsgs.add("�L�k���o���:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/select_page.jsp");
				failureView.forward(req, res);
			}
		}

		if ("listMembers_ByCompositeQuery".equals(action)) { // �Ӧ�select_page.jsp���ƦX�d�߽ШD

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
				Group_MemberService group_memberSvc = new Group_MemberService();
				List<Group_MemberVO> list  = group_memberSvc.getAll(map);
				
				/***************************3.�d�ߧ���,�ǳ����(Send the Success view)************/
				req.setAttribute("listMembers_ByCompositeQuery", list); // ��Ʈw���X��list����,�s�Jrequest
				RequestDispatcher successView = req.getRequestDispatcher("/front-end/group_member/listMembers_ByCompositeQuery.jsp"); // ���\���listEmps_ByCompositeQuery.jsp
				successView.forward(req, res);
				
				/***************************��L�i�઺���~�B�z**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/select_page.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("checkMemIfExist".equals(action)) { // �Ӧ�select_page.jsp���ШD

			PrintWriter out = res.getWriter();
			Integer group_no = new Integer(req.getParameter("group_no").trim());
			Integer member_no =  new Integer(req.getParameter("member_no").trim());
			Group_MemberService group_memberSvc = new Group_MemberService();
			Group_MemberVO group_memberVO = group_memberSvc.getOneGroup_Member(group_no, member_no);
			out.print((group_memberVO) != null ? "success":"failed");
			out.close();
			return;
			
			}
			
		if ("getGroup_Member_Ajax".equals(action)) { // �Ӧ�listAllEmp.jsp
			res.setCharacterEncoding("utf-8");
			PrintWriter out = res.getWriter();
			Integer group_no = new Integer(req.getParameter("group_no"));
			GroupService groupSvc = new GroupService();
			Set<Group_MemberVO> set = groupSvc.getMembersByGroupno(group_no);
						
			JSONArray memberByGroup_no = new JSONArray(set);  //
			JSONObject jsonobj=new JSONObject();
			try {
				jsonobj.put("memberByGroup_no", memberByGroup_no);
				out.print(jsonobj.toString());
				return;
			}catch(JSONException e) {
				e.printStackTrace();
			}finally {
				out.flush();
				out.close();
			}
		}
		
		
		
		
		
		if("leave_group_for_Ajax".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
			try {
				int group_no = new Integer(req.getParameter("group_no"));
				int member_no = new Integer(req.getParameter("member_no"));
				String status="0";
				String pay_status="0";
				Group_MemberService groupMemSvc = new Group_MemberService();
				groupMemSvc.leaveGroupByMem(status, group_no, member_no, pay_status);
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
		
		
		
		if("getGroupCount_Ajax".equals(action)) {
			List<String> errorMsgs = new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			PrintWriter out = res.getWriter();
			try {
				int group_no = new Integer(req.getParameter("group_no"));
				Group_MemberService groupMemSvc = new Group_MemberService();
				int count = groupMemSvc.getGroupCount(group_no);
				out.print(count);
			}
			catch(Exception e) {
				out.print("fail");
				errorMsgs.add("���o���ΤH�ƥ���");
				RequestDispatcher failureView = req
						.getRequestDispatcher("/front-end/mem/memberSys.jsp");
				failureView.forward(req, res);
			}finally {
				out.flush();
				out.close();
			}
		}
	}
}
