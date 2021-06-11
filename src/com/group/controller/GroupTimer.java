package com.group.controller;

import java.net.URI;
import java.net.URISyntaxException;
import java.sql.Date;
import java.sql.Timestamp;

import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import com.group.model.GroupService;
import com.group.model.GroupVO;
import com.group_member.model.Group_MemberService;

public class GroupTimer extends Timer{
	//instance variables
	private Map<Integer, TimerTask_Dismiss> dismissMap = new HashMap<Integer, TimerTask_Dismiss>();
	private Map<Integer, TimerTask_KickOut> kickOutMap = new HashMap<Integer, TimerTask_KickOut>();
	//�s�W���Υ��ѱƵ{��
	public void addDismissTask(GroupVO groupVO) {
		TimerTask_Dismiss timerTask = new TimerTask_Dismiss(groupVO);
		this.dismissMap.put(timerTask.getGroupVO().getGroup_no(), timerTask);
		System.out.println("�[�J���Υ��ѱƵ{��....");
		System.out.println("���νs��" + timerTask.getGroupVO().getGroup_no() + "�N��Deadline: " + timerTask.getGroupVO().getDeadline_dt() + "�I��");
		this.schedule( timerTask  , groupVO.getDeadline_dt()); 
	}
	//���o���Υ��ѱƵ{��
	public TimerTask_Dismiss getDismissTask(int group_no) {
		return this.dismissMap.get(group_no);
	}
	//�������Υ��ѱƵ{��
	public void cancelDismissTask(int group_no) {
		
		TimerTask_Dismiss dismissTask =getDismissTask(group_no);
		if (dismissTask != null) {
			dismissTask.cancel();
			this.dismissMap.remove(group_no);
			System.out.println("�����s��:" + group_no +" �����Υ��ѱƵ{��");
		}
		else
			System.out.println("�L�s��:" + group_no +" �����Υ��ѱƵ{��");
	}
	//�s�W�簣���I�ڹέ��Ƶ{��
	public void addKickOutTask(GroupVO groupVO) {
		TimerTask_KickOut timerTask = new TimerTask_KickOut(groupVO);
		this.kickOutMap.put(timerTask.getGroupVO().getGroup_no(), timerTask);
		System.out.println("�[�J�簣���I�ڹέ��Ƶ{��...");
		System.out.println("�N��Deadline: " + timerTask.getGroupVO().getDeadline_dt() + "�M�����νs��" + timerTask.getGroupVO().getGroup_no() + "�����I�ڹέ�");
		this.schedule( timerTask  , new Timestamp(System.currentTimeMillis()+10000)); 
	}
	//���o�簣���I�ڹέ��Ƶ{��
	public TimerTask_KickOut getKickTask(int group_no) {
		return this.kickOutMap.get(group_no);
	}
	//�������Υ��ѱƵ{��
		public void cancelKickOutDismissTask(int group_no) {
			System.out.println("�����s��:" + group_no +" ���簣���I�ڹέ��Ƶ{��");
			getKickTask(group_no).cancel();
			this.kickOutMap.remove(group_no);
		}

	@Override
	public void cancel() {
		super.cancel();
		System.out.println("�Ƶ{���w��������!");
	}
	
}
//�Ѵ����αƵ{��Class
class TimerTask_Dismiss extends TimerTask {
	private GroupVO groupVO;
	public GroupVO getGroupVO() {
		return groupVO;
	}
	public void setGroupVO(GroupVO groupVO) {
		this.groupVO = groupVO;
	}
	public TimerTask_Dismiss(GroupVO groupVO) {
		super();
		this.groupVO = groupVO;
	}
	@Override
	public void run() {
		GroupService groupSvc = new GroupService();
		System.out.println("1���νs��: " + this.groupVO.getGroup_no() + "�W�L�I��ɶ�, ���Υ���!!!");
		groupSvc.groupOverDue(this.groupVO.getGroup_no());
		System.out.println("2���νs��: " + this.groupVO.getGroup_no() + "�W�L�I��ɶ�, ���Υ���!!!");
		sendWSMessage("dismissGroup",this.groupVO.getMember_no(), String.valueOf(this.groupVO.getGroup_no()),this.groupVO.getCrt_dt());
	}
	
	
	public void sendWSMessage(String type, int memno, String receiver, Timestamp time) {
		// open websocket
        WebsocketClientEndpoint clientEndPoint;
		try {
			clientEndPoint = new WebsocketClientEndpoint(new URI("ws://localhost:8081/CEA103G3_Project/NotifyWS/-1"));

			if("dismissGroup".equals(type)) {
				// send message to websocket
		        clientEndPoint.sendMessage("{\"type\":\""+type+"\",\"sender\":"+memno+",\"receiver\":\""+receiver+"\",\"message\":\"XXXXXXX\",\"time\":\""+time+"\"}");
			}
	        
			try {
				Thread.sleep(3 * 1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
	}
}

//�𱼥��I�ڹέ��Ƶ{��Class
class TimerTask_KickOut extends TimerTask {
	private GroupVO groupVO;
	public GroupVO getGroupVO() {
		return groupVO;
	}
	public void setGroupVO(GroupVO groupVO) {
		this.groupVO = groupVO;
	}
	public TimerTask_KickOut(GroupVO groupVO) {
		super();
		this.groupVO = groupVO;
	}
	@Override
	public void run() {
		Group_MemberService group_memberSvc = new Group_MemberService();
		group_memberSvc.kickUnpaidMemberOut(this.groupVO.getGroup_no());;
		System.out.println("���νs��: " + this.groupVO.getGroup_no() + "�����I�ڹέ��w�簣����!!!");
		sendWSMessage("kickUnpaid",this.groupVO.getMember_no(), String.valueOf(this.groupVO.getGroup_no()),this.groupVO.getCrt_dt());
	}
	
	public void sendWSMessage(String type, int memno, String receiver, Timestamp time) {
		// open websocket
        WebsocketClientEndpoint clientEndPoint;
		try {
			clientEndPoint = new WebsocketClientEndpoint(new URI("ws://localhost:8081/CEA103G3_Project/NotifyWS/-1"));

			if("kickUnpaid".equals(type)) {
				// send message to websocket
		        clientEndPoint.sendMessage("{\"type\":\""+type+"\",\"sender\":"+memno+",\"receiver\":\""+receiver+"\",\"message\":\"XXXXXXX\",\"time\":\""+time+"\"}");
			}
	        
			try {
				Thread.sleep(3 * 1000);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	       
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

        
	}
}