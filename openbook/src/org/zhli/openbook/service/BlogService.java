package org.zhli.openbook.service;

import java.util.List;

import org.zhli.openbook.model.Blog;
import org.zhli.openbook.model.Comment;
import org.zhli.openbook.model.User;

public interface BlogService {
	/**
	 * 通过文章作者名来查询博客
	 * @param name 文章作者
	 * @return 指定作者的博客合集
	 */
	List<Blog> getBlogsByAuthor(User user);

	/**
	 * 通过文章 id 来查询指定的博客
	 * @param name 文章作者
	 * @return 指定作者的博客合集
	 */
	Blog getBlogById(Integer id);
	
	/**
	 * 通过默认方式来查询博客
	 * @return 指定作者的博客合集
	 */
	List<Blog> getBlogsByDefault(int offset, int length);
	
	// 单值检索，检索结果有且只有一条记录
	Object uniqueResult(Object ... objects);
	
	/**
	 * 查询最近更新的 5 篇博客
	 * @return
	 */
	List<Blog> getLastestBlogs();
	
	/**
	 * 查询博客的所有评论
	 * @return
	 */
	List<Comment> getCommentsByBlogId(Blog blog);
	
	/**
	 * 保存评论博客内容
	 * @param comment
	 * @param time 
	 * @param i 
	 * @param userId 
	 */
	void saveComment(Comment comment, String time, int userId, int i);

	/**
	 * 分类获取博客集合
	 * @param i
	 * @param pageSize
	 * @param string
	 * @return
	 */
	List<Blog> getBlogsByCategory(int i, int pageSize, String string);

	/**
	 * 保存博客
	 * @param b
	 */
	void saveBlog(Blog b);

	/**
	 * 更新博文查看的次数
	 * @param bid 
	 */
	void updateViewedTimes(int bid);

	/**
	 * 更新赞数
	 * @param bid
	 */
	void updatePraisedNum(int bid);

	/**
	 * 更新博客
	 * @param editedBlog
	 */
	void updateBlog(Blog editedBlog);
}
