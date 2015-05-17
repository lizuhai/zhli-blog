package org.zhli.openbook.utils;

import java.io.InputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.zhli.openbook.model.TextMessage;

import com.thoughtworks.xstream.XStream;

/**
 * 消息格式的转换
 * 		需要 dom4j.jar
 * @author zhli
 *
 */
public class MessageUtil {
	
	/**
	 * 消息的类型
	 */
	public static final String MESSAGE_TEXT = "text";
	public static final String MESSAGE_IMAGE = "image";
	public static final String MESSAGE_VOICE = "voice";
	public static final String MESSAGE_VIDEO = "video";
	public static final String MESSAGE_LINK = "link";
	public static final String MESSAGE_LOCATION = "location";
	public static final String MESSAGE_EVENT = "event";
	public static final String MESSAGE_EVENT_SUBSCRIBE = "subscribe";
	public static final String MESSAGE_EVENT_UNSUBSCRIBE = "unsubscribe";
	public static final String MESSAGE_EVENT_CLICK = "CLICK";
	public static final String MESSAGE_EVENT_VIEW = "VIEW";
	
	
	/**
	 * xml --> map
	 * @param req
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("unchecked")
	public static Map<String, String> xml2Map(HttpServletRequest req) throws Exception {
		Map<String, String> map = new HashMap<>();
		
		SAXReader reader = new SAXReader();
		
		InputStream is = req.getInputStream();
		Document doc = reader.read(is);
		
		Element root = doc.getRootElement();
		
		List<Element> list = root.elements();
		
		for (Element e : list) {
			map.put(e.getName(), e.getText());
		}
		
		is.close();
		return map;
	}
	
	/**
	 * 将对象转换为 xml
	 * @param textMessage
	 * @return
	 */
	public static String textMessage2Xml(TextMessage textMessage) {
		XStream xStream = new XStream();
		// 替换 xml 文件的根节点为 "xml"
		xStream.alias("xml", textMessage.getClass());
		return xStream.toXML(textMessage);
	}
	
	/**
	 * 主菜单
	 * @return
	 */
	public static String menuText() {
		StringBuffer sb = new StringBuffer();
		sb.append("欢迎关注 zhli，请按照如下菜单提示进行操作\n");
		sb.append("welcome to subscribe 'zhli', please follow the menu!\n\n");
		sb.append("回复 1：查看博客\n");
		sb.append("回复 2：查看问题\n\n");
		sb.append("回复 ?：调出菜单");
		return sb.toString();
	}
	
	
	/**
	 * 菜单 1
	 * @return
	 */
	public static String menu1() {
		StringBuffer sb = new StringBuffer();
		sb.append("菜单 1");
		return sb.toString();
	}
	
	/**
	 * 菜单2
	 * @return
	 */
	public static String menu2() {
		StringBuffer sb = new StringBuffer();
		sb.append("菜单2");
		return sb.toString();
	}
	
	/**
	 * 初始化回复文本消息
	 */
	public static String initText(String fromUserName, String toUserName, String content) {
		TextMessage textMessage = new TextMessage();
		textMessage.setToUserName(fromUserName);
		textMessage.setFromUserName(toUserName);
		textMessage.setMsgType(MESSAGE_TEXT);
		textMessage.setCreateTime(new Date().getTime());
		textMessage.setContent(content);
		return textMessage2Xml(textMessage);
	}
}
