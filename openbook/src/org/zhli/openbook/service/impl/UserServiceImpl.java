package org.zhli.openbook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.zhli.openbook.dao.BaseDao;
import org.zhli.openbook.model.User;
import org.zhli.openbook.service.UserService;
import org.zhli.openbook.utils.ValidateUtil;

@Service("userService")
public class UserServiceImpl extends BaseServiceImpl<User> implements UserService {

	/**
	 * 覆盖父类的该方法的注解，指明注入指定的 Dao 对象，不让 Spring 无法确定 注入哪个 dao（有好几个满足条件）
	 */
	@Resource(name="userDao")
	public void setDao(BaseDao<User> dao) {
		super.setDao(dao);
	}

	/**
	 * 判断 email 是否被占用
	 */
	public boolean isRegisted(String email) {
		String hql = "from User u where u.email = ?";
		List<User> list = this.findEntityByHQL(hql, email);
		return ValidateUtil.isValidate(list);
	}

	/**
	 * 验证登陆信息
	 */
	@Override
	public User validateLoginInfo(String email, String md5) {
		String hql = "from User u where u.email = ? and u.password = ?";
		List<User> list = this.findEntityByHQL(hql, email, md5);
		return ValidateUtil.isValidate(list) ? list.get(0) : null;
	}
	
	/**
	 * 根据 email 查询 id
	 * @param email
	 * @return
	 */
	public int findIdByEmail(String email) {
		String hql = "select id from User u where u.email = ?";
		System.out.println(hql);
		return (int) this.uniqueResult(hql, email);
	}
}
