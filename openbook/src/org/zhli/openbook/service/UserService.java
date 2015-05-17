package org.zhli.openbook.service;

import org.zhli.openbook.model.User;

/**
 * 
 * UserService
 *
 */
public interface UserService extends BaseService<User> {

	/**
	 * 验证注册信息，判断 email 是否被占用
	 * @param 
	 *    		验证字符串是否已存在于数据库中	
	 * @return 
	 * 			true if already used
	 */
	public boolean isRegisted(String email);
	
	/**
	 * 验证登陆信息
	 */
	public User validateLoginInfo(String email, String md5);

	/**
	 * 根据 email 查询 id
	 * @param email
	 * @return
	 */
	public int findIdByEmail(String email);
}
