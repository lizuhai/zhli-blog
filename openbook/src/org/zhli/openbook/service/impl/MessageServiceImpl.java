package org.zhli.openbook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.zhli.openbook.dao.BaseDao;
import org.zhli.openbook.model.Message;
import org.zhli.openbook.service.MessageService;

@Service("messageService")
public class MessageServiceImpl extends BaseServiceImpl<Message> implements MessageService {

	@Resource(name="messageDao")
	@Override
	public void setDao(BaseDao<Message> dao) {
		super.setDao(dao);
	}

	@Override
	public void saveMessage(Message m) {
		this.saveEntity(m);
	}

	@Override
	public List<Message> queryMessagesForList() {
		String hql = "from Message m";
		return this.findEntityByHQL(hql);
	}

	@Override
	public void deleteMessageById(Integer messageId) {
		String sql = "delete from openbook_messages where id = ?";
		this.executeSQL(sql, messageId);
	}
	
	
}
