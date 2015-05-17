package org.zhli.openbook;

import java.util.List;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.zhli.openbook.model.Blog;
import org.zhli.openbook.model.Comment;
import org.zhli.openbook.service.BlogService;
import org.zhli.openbook.service.UserService;

public class TestFunction {

	private ApplicationContext context = null;

	{
		/**
		 * 错写成： context = new ClassPathXmlApplicationContext(); 有如下异常
		 * java.lang.IllegalStateException: BeanFactory not initialized or
		 * already closed
		 */
		context = new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	@Test
	public void testDataSource() throws Exception {
		DataSource dataSource = context.getBean(DataSource.class);
		System.out.println(dataSource.getConnection());
	}
	
	@Test
	public void testInsertUser() {
		UserService us = (UserService) context.getBean("userService");
//		User user = new User();
//		user.setEmail("zhli@111.com");
//		user.setPassword("1");
//		us.saveEntity(user);
		
		System.out.println(us.findIdByEmail("zhli_2014@163.com"));
	}
	
	@Test
	public void testQueryBlogs() {
		BlogService bs = (BlogService) context.getBean("blogService");
		List<Blog> blogs = bs.getBlogsByDefault(1, 3);
		for (Blog blog : blogs) {
			System.out.println(blog.getComments());
		}
	}
	
	@Test
	public void testUniqueQueryBlogs() {
		BlogService bs = (BlogService) context.getBean("blogService");
		long count = (long) bs.uniqueResult();
		System.out.println(count);
	}
	
	@Test
	public void testQueryComment() {
		BlogService bs = (BlogService) context.getBean("blogService");
		Comment c = new Comment();
		c.setCommentContent("aa");
		bs.saveComment(c,"2015-04-16 08:10:00",  1, 1);
	}
	
	@Test
	public void aaaa() {
		int i = (int) Math.ceil((double)5/4);
		System.out.println(i);
	}
	
	@Test
	public void testComment() {
		BlogService bs = (BlogService) context.getBean("blogService");
		Blog b = bs.getBlogById(1);
		List<Comment> comments = bs.getCommentsByBlogId(b);
		System.out.println(comments);
	}
	
	@Test
	public void a() {
		String s = "adf\r\nbb";
		s = s.replaceAll("\r\n", "<br>");
		System.out.println(s);
	}
}


