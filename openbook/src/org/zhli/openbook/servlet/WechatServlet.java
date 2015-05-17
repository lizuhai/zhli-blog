package org.zhli.openbook.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.zhli.openbook.utils.DataUtil;
import org.zhli.openbook.utils.MessageUtil;

public class WechatServlet extends HttpServlet {

	private static final long serialVersionUID = 1723472967039551022L;

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String signature = req.getParameter("signature");
		String timestamp = req.getParameter("timestamp");
		String nonce = req.getParameter("nonce");
		String echostr = req.getParameter("echostr");
		
		PrintWriter out = resp.getWriter();
		if (checkSignature(signature, timestamp, nonce)) {
//			System.out.println("OK");
			out.print(echostr);
		}
	}
	
	/**
	 * 微信校验
	 *  加密/校验流程如下：
	 *   1. 将token、timestamp、nonce三个参数进行字典序排序
	 *   2. 将三个参数字符串拼接成一个字符串进行sha1加密
	 *   3. 开发者获得加密后的字符串可与signature对比，标识该请求来源于微信
	 */
	private static final String TOKEN = "zhli";
	public static boolean checkSignature(String signature, String timestamp, String nonce) {
		String [] arrs = new String[]{TOKEN, timestamp, nonce};
		// 1. 排序
		Arrays.sort(arrs);
		// 2. 生成字符串
		StringBuffer content = new StringBuffer();
		for (String arr : arrs) {
			content.append(arr);
		}
		// sha1 加密
		String temp = DataUtil.SHA1(content.toString());
		
		return temp.equals(signature);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		PrintWriter writer = resp.getWriter();
		
		try {
			Map<String, String> map = MessageUtil.xml2Map(req);
			String fromUserName = map.get("FromUserName");
			String toUserName = map.get("ToUserName");
//			String createTime = map.get("CreateTime");
			String msgType = map.get("MsgType");
			String content = map.get("Content");
//			String msgId = map.get("MsgId");
//			System.out.println(content);
			
			String message = null;
			if (MessageUtil.MESSAGE_TEXT.equals(msgType)) {
//				System.out.println("text");
				if ("1".equals(content)) {
					message = MessageUtil.initText(fromUserName, toUserName, MessageUtil.menu1());
				} else if ("2".equals(content)) {
					message = MessageUtil.initText(fromUserName, toUserName, MessageUtil.menu2());
				} else if ("?".equals(content) || "？".equals(content)) {
					message = MessageUtil.initText(fromUserName, toUserName, MessageUtil.menuText());
				} 
//				TextMessage textMessage = new TextMessage();
//				textMessage.setToUserName(fromUserName);
//				textMessage.setFromUserName(toUserName);
//				textMessage.setMsgType("text");
//				textMessage.setCreateTime(new Date().getTime());
//				textMessage.setContent("???");
//				
//				message = MessageUtil.textMessage2Xml(textMessage);
				
			} else if(MessageUtil.MESSAGE_EVENT.equals(msgType)) {
				String eventType = map.get("Event");
				if (MessageUtil.MESSAGE_EVENT_SUBSCRIBE.equals(eventType)) {
					message = MessageUtil.initText(fromUserName, toUserName, MessageUtil.menuText());
				}
				
			}
			System.out.println(message);
			
			writer.print(message);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			writer.close();
		}
	}
}
