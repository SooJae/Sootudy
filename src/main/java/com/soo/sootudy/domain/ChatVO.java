package com.soo.sootudy.domain;

import java.util.Date;

import lombok.Data;

@Data
//@AllArgsConstructor
public class ChatVO {
	
	
	//메시지 타입 : 입장, 채팅
	public enum MessageType{
		JOIN, CHAT, LEAVE
	}
	private MessageType type; //메세지 타입
	private int s_cno; //채팅 번호
	private String roomId; //방번호
	private String sender;
	private String message;
	private Date dt;
	private int chatCnt;
	
}
