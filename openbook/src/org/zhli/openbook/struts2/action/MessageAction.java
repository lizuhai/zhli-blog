package org.zhli.openbook.struts2.action;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.zhli.openbook.model.Message;
import org.zhli.openbook.service.MessageService;

@Controller
@Scope("prototype")
public class MessageAction extends BaseAction<Message> {

	private static final long serialVersionUID = -6261556652228625779L;

	@Resource
	private MessageService messageService;

	@Override
	public Message getModel() {
		return model;
	}

	private Message m;

	public Message getM() {
		return m;
	}
	public void setM(Message m) {
		this.m = m;
	}

	public String saveMessage() {
//		System.out.println(m);
		messageService.saveMessage(m);
		return "contact";
	}
	
	private List<Message> messages;
	public List<Message> getMessages() {
		return messages;
	}
	
	public String toMessageListPage() {
		messages = messageService.queryMessagesForList();
		return "toMessageListPage";
	}
	
	
	private Integer messageId;
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	
	public String delete() {
		messageService.deleteMessageById(messageId);
		return "delete";
	}

}
