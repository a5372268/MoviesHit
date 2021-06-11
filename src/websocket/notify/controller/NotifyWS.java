package websocket.notify.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;

import javax.websocket.CloseReason;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


import com.google.gson.Gson;
import com.group.model.GroupService;
import com.group.model.GroupVO;
import com.group_member.model.Group_MemberService;
import com.group_member.model.Group_MemberVO;
import com.mem.model.MemService;
import com.movie.model.MovieService;

import websocket.jedis.JedisHandleMessage;
import websocket.notify.model.Notify;

@ServerEndpoint("/NotifyWS/{userName}")
public class NotifyWS {
	private static Map<Integer, Session> sessionsMap = new ConcurrentHashMap<>();

	Gson gson = new Gson();
	

	@OnOpen
	public void onOpen(@PathParam("userName") int userName, Session userSession) throws IOException {
		sessionsMap.put(userName, userSession);
		System.out.println("�ڬO: "+userName);
		System.out.println("�ڪ�session: "+ userSession);
	}
	
	@OnMessage
	public void onMessage(Session userSession, String message) {
		Group_MemberService gmSvc = new Group_MemberService();
		GroupService gSvc = new GroupService();
		MovieService movieSvc = new MovieService();
		MemService memSvc = new MemService();
	
		Notify notify = gson.fromJson(message, Notify.class);
		int sender = notify.getSender();
		String receiver = notify.getReceiver();
		String timeStr = notify.getTime();
		String read = "N";
		
		//�e�X�n���ܽ�
		if("addFriend".equals(notify.getType())){
			
			Session receiverSession = sessionsMap.get(new Integer(receiver));
			
			String sendName = memSvc.getOneMem(sender).getMb_name();
			String receiveName = memSvc.getOneMem(new Integer(receiver)).getMb_name();
			
			String receiverText = sendName+"�ܽЧA�����n��";
			String senderText = "�z�w�ܽ�"+receiveName+"�����n��";
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);
			Notify receiverMsg = new Notify(notify.getType(),sender, receiver, receiverText, timeStr, read);
			String receiverMsgJson = gson.toJson(receiverMsg);
			JedisHandleMessage.saveChatMessage(String.valueOf(sender), notify.getType(), senderMsgJson);
			JedisHandleMessage.saveChatMessage(String.valueOf(receiver), notify.getType(), receiverMsgJson);
			
			
			if (receiverSession != null && receiverSession.isOpen()) {
			receiverSession.getAsyncRemote().sendText(receiverMsgJson);
			userSession.getAsyncRemote().sendText(senderMsgJson);
			}
			return;
		}
		
		//�έ��[�J����(receiver:group_no)
		if("addGroup".equals(notify.getType())){

			String group_name = gSvc.getOneGroup(new Integer(receiver)).getGroup_title();
			String sender_name = memSvc.getOneMem(sender).getMb_name();
			
			List<Group_MemberVO> list = gmSvc.getMembers(new Integer(receiver));
			List<Integer> gmList = new ArrayList<Integer>();
			Set<Integer> memNOs = sessionsMap.keySet();  //���X�Τ��Ҧ�����
			
			for(Group_MemberVO gmVO : list) {
				for(int memNO:memNOs) {
					if(gmVO.getMember_no()==memNO) {
						gmList.add(memNO);
					}
				}
			}
			String receiverText = sender_name+"�w�[�J����:"+group_name;
			String senderText = "�z�w�[�J����:"+group_name;
			
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);
			Notify receiverMsg = new Notify(notify.getType(),sender, receiver, receiverText, timeStr, read);
			String receiverMsgJson = gson.toJson(receiverMsg);
			//�s��������[�J���ΰT���æs�bredis
			JedisHandleMessage.saveChatMessage(String.valueOf(sender), notify.getType(), senderMsgJson);
			//��l�έ��Q�q�����s�έ��[�J�æs�bredis
			for(Integer memno:gmList) {
				JedisHandleMessage.saveChatMessage(String.valueOf(memno), notify.getType(), receiverMsgJson);
			}
			
			userSession.getAsyncRemote().sendText(senderMsgJson);
			for(int i = 0 ; i<gmList.size();i++) {
				Session receiverSession = sessionsMap.get(gmList.get(i));
				if (receiverSession != null && receiverSession.isOpen()) {
				receiverSession.getAsyncRemote().sendText(receiverMsgJson);
				}
			}
			
			return;
		}
		
		//�I���T�{�w�w�q�v��(�٥��I��)
		if("buyTicket".equals(notify.getType())){
			
			String movieName = movieSvc.getOneMovie(new Integer(receiver)).getMoviename();

			String senderText = "�z�w���\�w�q�q�v:"+movieName+"�A�Цb�}�t�e�b�p�ɥI�ڡA����!";
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);
			JedisHandleMessage.saveChatMessage(String.valueOf(sender), notify.getType(), senderMsgJson);


			userSession.getAsyncRemote().sendText(senderMsgJson);
			return;
		}
		
		//�������ܽ��I��T�{
		if("response".equals(notify.getType())){
			
			Session receiverSession = sessionsMap.get(new Integer(receiver));
			
			String sendName = memSvc.getOneMem(sender).getMb_name();
			String receiveName = memSvc.getOneMem(new Integer(receiver)).getMb_name();

			String receiverText = sendName+"�w�����z������ܽ�";
			String senderText = "�z�P"+receiveName+"�w�����n��";
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);
			Notify receiverMsg = new Notify(notify.getType(),sender, receiver, receiverText, timeStr, read);
			String receiverMsgJson = gson.toJson(receiverMsg);
			JedisHandleMessage.saveChatMessage(String.valueOf(sender), notify.getType(), senderMsgJson);
			JedisHandleMessage.saveChatMessage(String.valueOf(receiver), notify.getType(), receiverMsgJson);

			
			if (receiverSession != null && receiverSession.isOpen()) {
			receiverSession.getAsyncRemote().sendText(receiverMsgJson);
			userSession.getAsyncRemote().sendText(senderMsgJson);
			}
			return;
			
		}
		
		//�ΥD�s�W����
		if("createGroup".equals(notify.getType())){

			String senderText = "�z�w���\�إߴ���:"+receiver;
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);
			JedisHandleMessage.saveChatMessage(String.valueOf(sender), notify.getType(), senderMsgJson);

			userSession.getAsyncRemote().sendText(senderMsgJson);
			return;
			
		}
		
		//��deadline�ΥD���I���X�ΥX�{�Ѵ����γq��
		if("dismissGroup".equals(notify.getType())){
			String group_name = gSvc.getOneGroup(new Integer(receiver)).getGroup_title();
			//�N���Ǯɶ��Otimestamp�榡����@��h��
//			SimpleDateFormat dateformatAll= new SimpleDateFormat("yyyy-MM-dd HH:mm");
//			String timeStrr = dateformatAll.format(timeStr);
			
			List<Group_MemberVO> list = gmSvc.getMembers(new Integer(receiver));
			List<Integer> gmList = new ArrayList<Integer>();
			Set<Integer> memNOs = sessionsMap.keySet();  //���X�Ҧ��s�u��
			
			for(Group_MemberVO gmVO : list) {
				for(int memNO:memNOs) {
					if(gmVO.getMember_no()==memNO) {
						gmList.add(memNO);
					}
				}
			}
			String senderText = "����:"+group_name+"�]���b�I���e�X�Τw�Q����";
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);

			for(Integer memno : gmList) {
				JedisHandleMessage.saveChatMessage(String.valueOf(memno), notify.getType(), senderMsgJson);
			}
			
			//�Ҧ��έ��ҷ|����Ѵ����γq��
			for(Integer memno:gmList) {
				for(Integer userName: sessionsMap.keySet()) {
					if(memno==userName) {
						Session sendSession = sessionsMap.get(userName);
						if (sendSession != null && sendSession.isOpen()) {
								sendSession.getAsyncRemote().sendText(senderMsgJson);
						}
					}
					
				} 
				
			}
			return;
			
		}
		
		//�ΥD�X�γq��
		if("goGroup".equals(notify.getType())){
			String group_name = gSvc.getOneGroup(new Integer(receiver)).getGroup_title();
			List<Group_MemberVO> list = gmSvc.getMembers(new Integer(receiver));
			List<Integer> gmList = new ArrayList<Integer>();
			Set<Integer> memNOs = sessionsMap.keySet();  //���X�Ҧ��s�u��
			
			for(Group_MemberVO gmVO : list) {
				for(int memNO:memNOs) {
					if(gmVO.getMember_no()==memNO) {
						gmList.add(memNO);
					}
				}
			}
			String senderText = "����:"+group_name+"�w�X�ΡA�Цb�����}�t�e�@�p�ɥI�ڡA����!";
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);

			for(Integer memno : gmList) {
				JedisHandleMessage.saveChatMessage(String.valueOf(memno), notify.getType(), senderMsgJson);
			}
			
			//�Ҧ��έ��ҷ|����Ѵ����γq��
			for(Integer memno:gmList) {
				for(Integer userName: sessionsMap.keySet()) {
					if(memno==userName) {
						Session sendSession = sessionsMap.get(userName);
						if (sendSession != null && sendSession.isOpen()) {
								sendSession.getAsyncRemote().sendText(senderMsgJson);
						}
					}
					
				} 
				
			}
			return;
			
		}
		
		//�ΥD��ﴪ�α���A�Ҧ��έ��Q��X
		if("kickoffGroup".equals(notify.getType())){
			String group_name = gSvc.getOneGroup(new Integer(receiver)).getGroup_title();
			List<Group_MemberVO> list = gmSvc.getMembers(new Integer(receiver));
			List<Integer> gmList = new ArrayList<Integer>();
			Set<Integer> memNOs = sessionsMap.keySet();  //���X�Ҧ��s�u��
			
			for(Group_MemberVO gmVO : list) {
				for(int memNO:memNOs) {
					if(gmVO.getMember_no()==memNO) {
						gmList.add(memNO);
					}
				}
			}
			String senderText = "����:"+group_name+"����w�Q�ק�A�Э��s�[�J���ΡA����!";
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);
			
			for(Integer memno : gmList) {
				JedisHandleMessage.saveChatMessage(String.valueOf(memno), notify.getType(), senderMsgJson);
			}
			
			//�Ҧ��έ��ҷ|����Ѵ����γq��
			for(Integer memno:gmList) {
				for(Integer userName: sessionsMap.keySet()) {
					if(memno==userName) {
						Session sendSession = sessionsMap.get(userName);
						if (sendSession != null && sendSession.isOpen()) {
							sendSession.getAsyncRemote().sendText(senderMsgJson);
						}
					}
					
				} 
				
			}
			return;
			
		}
		
		//��}�t�e�@�p�ɥ��I�ڡA�N���I�ڹέ��簣
		if("kickUnpaid".equals(notify.getType())){
			String group_name = gSvc.getOneGroup(new Integer(receiver)).getGroup_title();
			
			//�N���Ǯɶ��Otimestamp�榡����@��h��
//			SimpleDateFormat dateformatAll= new SimpleDateFormat("yyyy-MM-dd HH:mm");
//			String timeStrr = dateformatAll.format(timeStr);
			List<Group_MemberVO> list = gmSvc.getKickOutUnpaidMembers(new Integer(receiver));
			int kick_cnt = list.size();
			List<Integer> gmList = new ArrayList<Integer>();
			Set<Integer> memNOs = sessionsMap.keySet();  //���X�Ҧ��s�u��
			
			for(Group_MemberVO gmVO : list) {
				for(int memNO:memNOs) {
					if(gmVO.getMember_no()==memNO) {
						gmList.add(memNO);
					}
				}
			}
			//�ΥD���쪺�q��
			String senderText = "�z������:"+group_name+"��"+kick_cnt+"��έ��A�]�b�}�t�e���I�ڤw�Q��";
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);
			
			//�Q�簣�έ����쪺�q��
			String receiverText = "�z���b�q�v�}�t�e�@�p�ɥI�ڡA�w�Q�𰣴���:"+group_name;
			Notify receiverMsg = new Notify(notify.getType(),sender, receiver, receiverText, timeStr, read);
			String receiverMsgJson = gson.toJson(receiverMsg);
			
			//�ΥD�s��redis
			JedisHandleMessage.saveChatMessage(String.valueOf(sender), notify.getType(), senderMsgJson);
			
			//�Q�簣�έ��s��redis
			for(Integer memno : gmList) {
				JedisHandleMessage.saveChatMessage(String.valueOf(memno), notify.getType(), receiverMsgJson);
			}
			
			//�ǰe�ΥD�q��
			Session masterSession = sessionsMap.get(sender);
			masterSession.getAsyncRemote().sendText(senderMsgJson);
			
			//�Ҧ����I�ڹέ��ҷ|����簣���γq��
			for(Integer memno:gmList) {
				for(Integer userName: sessionsMap.keySet()) {
					if(memno==userName) {
						Session sendSession = sessionsMap.get(userName);
						if (sendSession != null && sendSession.isOpen()) {
							sendSession.getAsyncRemote().sendText(receiverMsgJson);
						}
					}
					
				} 
				
			}
			return;
			
		}
		
		if("reminder".equals(notify.getType())){
			
			Session receiverSession = sessionsMap.get(new Integer(receiver));
			
			String sendName = memSvc.getOneMem(sender).getMb_name();
			String receiveName = memSvc.getOneMem(new Integer(receiver)).getMb_name();
			
			String receiverText = "�����z�A�Цb�q�v�}�t�e�@�p�ɥI�ڡA����";
			String senderText = "�w�e�X�z���I�ڴ�����"+receiveName;
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);
			Notify receiverMsg = new Notify(notify.getType(),sender, receiver, receiverText, timeStr, read);
			String receiverMsgJson = gson.toJson(receiverMsg);
			JedisHandleMessage.saveChatMessage(String.valueOf(sender), notify.getType(), senderMsgJson);
			JedisHandleMessage.saveChatMessage(String.valueOf(receiver), notify.getType(), receiverMsgJson);
			
			
			if (receiverSession != null && receiverSession.isOpen()) {
			receiverSession.getAsyncRemote().sendText(receiverMsgJson);
			userSession.getAsyncRemote().sendText(senderMsgJson);
			}
			return;
		}
		
		//�ΥD�D�ʸѴ����γq��
		if("activeDismissGroup".equals(notify.getType())){
			String masterName = memSvc.getOneMem(gSvc.getOneGroup(new Integer(receiver)).getMember_no()).getMb_name();
			String group_name = gSvc.getOneGroup(new Integer(receiver)).getGroup_title();
			List<Group_MemberVO> list = gmSvc.getMembers(new Integer(receiver));
			List<Integer> gmList = new ArrayList<Integer>();
			Set<Integer> memNOs = sessionsMap.keySet();  //���X�Ҧ��s�u��
			
			for(Group_MemberVO gmVO : list) {
				for(int memNO:memNOs) {
					if(gmVO.getMember_no()==memNO) {
						gmList.add(memNO);
					}
				}
			}
			String senderText = "�ΥD:"+masterName+"�w�Ѵ�����:"+group_name;
			Notify senderMsg = new Notify(notify.getType(),sender, receiver, senderText, timeStr, read);
			String senderMsgJson = gson.toJson(senderMsg);

			for(Integer memno : gmList) {
				JedisHandleMessage.saveChatMessage(String.valueOf(memno), notify.getType(), senderMsgJson);
			}
			
			//�Ҧ��έ��ҷ|����Ѵ����γq��
			for(Integer memno:gmList) {
				for(Integer userName: sessionsMap.keySet()) {
					if(memno==userName) {
						Session sendSession = sessionsMap.get(userName);
						if (sendSession != null && sendSession.isOpen()) {
								sendSession.getAsyncRemote().sendText(senderMsgJson);
						}
					}
					
				} 
				
			}
			return;
			
		}
		
		
		
	}
	
	@OnError
	public void onError(Session userSession, Throwable e) {
		System.out.println("Error: " + e.toString());
	}

	@OnClose
	public void onClose(Session userSession, CloseReason reason) {
		Set<Integer> userNames = sessionsMap.keySet();
		for (int userName : userNames) {
			if (sessionsMap.get(userName).equals(userSession)) {
				sessionsMap.remove(userName);
				break;
			}
		}

		String text = String.format("session ID = %s, disconnected; close code = %d%nusers: %s", userSession.getId(),
				reason.getCloseCode().getCode(), userNames);
		System.out.println(text);
	}


}


