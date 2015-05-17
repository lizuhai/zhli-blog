package org.zhli.openbook.service;

import java.util.List;

import org.zhli.openbook.model.Message;

public interface MessageService {

	/**
	 * 保存留言
	 * @param m 
	 */
	void saveMessage(Message m);

	/**
	 * 查询所有的留言
	 */
	List<Message> queryMessagesForList();

	/**
	 * 通过指定 id 删除留言
	 * @param messageId
	 */
	void deleteMessageById(Integer messageId);

}
