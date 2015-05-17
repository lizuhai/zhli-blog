package org.zhli.openbook.struts2.action;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.validation.SkipValidation;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.zhli.openbook.model.User;
import org.zhli.openbook.service.UserService;
import org.zhli.openbook.utils.DataUtil;
import org.zhli.openbook.utils.ValidateUtil;

@Controller
@Scope("prototype")
public class RegAction extends BaseAction<User> {
	
	private static final long serialVersionUID = 1L;
	
	// 注入 userService
	@Resource
	private UserService userService;
	
	@Override
	public User getModel() {
		return model;
	}
	
	/**
	 * 处理用户登陆
	 */
	public String doLogin() {
		System.out.println("hehe");
		return SUCCESS;
	}
	
	/**
	 * 到达注册页面
	 * 跳过验证
	 */
	@SkipValidation
	public String toRegPage() {
		System.out.println("toRegPage");
		return "regPage";
	}
	
	/**
	 * 校验注册数据
	 * 1. not null
	 * 2. email 是否占用
	 */
	 @Override
	public void validate() {
		// validate not null
		if(!ValidateUtil.isValidate(model.getEmail())) {
			addFieldError("email", "亲，没有电子邮件我怎么 ‘私信’ 你呀！");
		}
		if(!ValidateUtil.isValidate(model.getPassword())) {
			addFieldError("password", "亲，没有密码你是想要每个人都可以 ‘上’ 吗？");
		}
		if(!ValidateUtil.isValidate(model.getName())) {
			addFieldError("name", "亲，取个霸气侧漏(萌萌)的小名吧！自己看着 ‘爽’ ！");
		}
		if(hasErrors()) 
			return ;
		// email 是否占用
		if(userService.isRegisted(model.getEmail())) {
			addFieldError("email", "亲，您的邮箱已经注册了哦，忘记密码请点击登陆界面相应的链接");
		}
	}
	
	
	/**
	 * 处理注册数据
	 */
	public String doReg() {
		model.setPassword(DataUtil.md5(model.getPassword()));
		userService.saveEntity(model);
		return SUCCESS;
	}
	
}
