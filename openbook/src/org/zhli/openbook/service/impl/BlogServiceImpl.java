package org.zhli.openbook.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.zhli.openbook.dao.BaseDao;
import org.zhli.openbook.model.Blog;
import org.zhli.openbook.model.Comment;
import org.zhli.openbook.model.User;
import org.zhli.openbook.service.BlogService;

@Service("blogService")
@SuppressWarnings("unchecked")
public class BlogServiceImpl implements BlogService {

	@Resource(name="blogDao")
	private BaseDao<Blog> blogDao;
	
	@Resource(name="commentDao")
	private BaseDao<Comment> commentDao;
	
	/**
	 * 通过文章作者名来查询博客
	 * @param user 文章作者
	 * @return 指定作者的博客合集
	 */
	@Override
	public List<Blog> getBlogsByAuthor(User user) {
		String hql = "from Blog b where b.author = ?";
		return blogDao.findEntityByHQL(hql, user.getId());
	}
	
	/**
	 * 通过默认方式来查询博客（所有的博客，按时间降序排列）
	 * @return 指定作者 ——zhli 的博客合集，赞数降序，被看的次数降序，评论次数降序排列
	 */
	@Override
	public List<Blog> getBlogsByDefault(int offset, int length) {
		String sql = "SELECT id, title, WRITING_DATE, LAST_MODIFIED_TIME, PRAISED_NUMBER, "
				+ "VIEWED_TIMES, tag, category, content, USER_ID FROM OPENBOOK_BLOGS"
				+ " ORDER BY VIEWED_TIMES DESC, PRAISED_NUMBER DESC, VIEWED_TIMES DESC limit ?,?";
		return (List<Blog>) blogDao.executeSQLQuery(Blog.class, sql, offset, length);
	}
	
	/**
	 * 查询最近更新的 5 篇博客
	 */
	@Override
	public List<Blog> getLastestBlogs() {
		String sql = "SELECT id, title, WRITING_DATE, LAST_MODIFIED_TIME, PRAISED_NUMBER, "
				+ "VIEWED_TIMES, tag, category, content, USER_ID FROM OPENBOOK_BLOGS"
				+ " ORDER BY LAST_MODIFIED_TIME DESC limit 0,5";
		return (List<Blog>) blogDao.executeSQLQuery(Blog.class, sql);
	}
	
	/**
	 * 查询共有多少条记录，即多少篇博客
	 */
	@Override
	public Object uniqueResult(Object ... objects) {
		String hql;
		if (objects.length == 0) {
			hql = "select count(*) from Blog";
			return blogDao.uniqueResult(hql);
		} else {
			hql = "select count(*) from Blog where category = ?";
			return blogDao.uniqueResult(hql, objects);
		}
	}

	@Override
	public Blog getBlogById(Integer id) {
		String hql = "from Blog b where b.id = ?";
		return (Blog) blogDao.uniqueResult(hql, id);
	}
	
	public List<Comment> getCommentsByBlogId(Blog blog) {
		String hql = "from Comment c where c.blog = ? order by commentTime desc";
		return commentDao.findEntityByHQL(hql, blog);
	}

	@Override
	public void saveComment(Comment comment, String time, int userId, int i) {
		String sql = "insert into openbook_comments(COMMENT_CONTENT, COMMENT_TIME, user_id, blog_id) values('" 
				+ comment.getCommentContent() + "', ?, ?, ?)";
		commentDao.executeSQL(sql, time, userId, i);
	}

	@Override
	public List<Blog> getBlogsByCategory(int offset, int length, String category) {
		String sql = "SELECT id, title, WRITING_DATE, LAST_MODIFIED_TIME, PRAISED_NUMBER,"
				+ " VIEWED_TIMES, tag, category, content, USER_ID FROM OPENBOOK_BLOGS"
				+ " WHERE CATEGORY = ? ORDER BY VIEWED_TIMES DESC, PRAISED_NUMBER DESC, VIEWED_TIMES DESC limit ?,?";
//		System.out.println(offset + " - " + length);
		return (List<Blog>) blogDao.executeSQLQuery(Blog.class, sql, category, offset, length);
	}

	@Override
	public void saveBlog(Blog blog) {

		blogDao.saveEntity(blog);
	}

	@Override
	public void updateViewedTimes(int bid) {
		String sql = "UPDATE OPENBOOK_BLOGS SET VIEWED_TIMES = VIEWED_TIMES + 1 WHERE ID = ?";
		blogDao.executeSQL(sql, bid);
	}

	@Override
	public void updatePraisedNum(int bid) {
		String sql = "UPDATE OPENBOOK_BLOGS SET PRAISED_NUMBER = PRAISED_NUMBER + 1 WHERE ID = ?";
		blogDao.executeSQL(sql, bid);
	}

	@Override
	public void updateBlog(Blog editedBlog) {
//		String sql = "UPDATE OPENBOOK_BLOGS SET PRAISED_NUMBER = PRAISED_NUMBER + 1 WHERE ID = ?";
		blogDao.saveOrUpdateEntity(editedBlog);
	}
}
