package org.zhli.openbook.struts2.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.zhli.openbook.model.User;
import org.zhli.openbook.service.UserService;
import org.zhli.openbook.utils.DataUtil;
import org.zhli.openbook.utils.ValidateUtil;

@Controller
@Scope("prototype")
public class LoginAction extends BaseAction<User> implements SessionAware {

	private static final long serialVersionUID = 8255117999191145900L;

	@Resource
	private UserService userService;
	
	private Map<String, Object> sessionMap;
	
	@Override
	public User getModel() {
		return model;
	}
	
	/**
	 * 到达登陆页面
	 * 跳过数据验证
	 */
	@SkipValidation
	public String toLoginPage() {
		return "loginPage";
	}
	
	/**
	 * 验证登陆请求的信息正确性
	 */
	@Override
	public void validate() {
		// 验证邮箱和密码不为空
		if (ValidateUtil.isValidate(model.getEmail())) {
			if (!ValidateUtil.isValidate(model.getPassword())) {
				addFieldError("password", "亲，没有密码你是想要每个人都可以 ‘上’ 吗？");
				return;
			}
		} else {
			addFieldError("email", "亲，邮箱连鸡毛都没有，我咋晓得你是哪个！");
			return;
		}
		// 验证邮箱和密码是否相符
		if(userService.isRegisted(model.getEmail())) {
			User user = userService.validateLoginInfo(model.getEmail(), DataUtil.md5(model.getPassword()));
			System.out.println(user);
			if (user == null) {
				addFieldError("password", "亲，我裤子都脱了准备欢迎您，您却密码输入错误");
			} else {
				sessionMap.put("user", user);
			}
		} else {
			addFieldError("email", "亲，我裤子都脱了准备欢迎您，您却没有注册!");
		}
	}
	
	/**
	 * 处理登陆请求
	 */
	public String doLogin() {
		return SUCCESS;
	}
	
	/**
	 * 处理登陆请求
	 */
	public String safeExit() {
		// 销毁session
		sessionMap.clear();
		return SUCCESS;
	}

	@Override
	public void setSession(Map<String, Object> arg0) {
		sessionMap = arg0;
	}

}
