package org.zhli.openbook.struts2.action;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.interceptor.ParameterAware;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.zhli.openbook.model.Blog;
import org.zhli.openbook.model.Comment;
import org.zhli.openbook.model.Page;
import org.zhli.openbook.model.User;
import org.zhli.openbook.service.BlogService;

@Controller
@Scope("prototype")
public class BlogAction extends BaseAction<Blog> implements ParameterAware, SessionAware {

	private static final long serialVersionUID = -8443621077610570808L;

	@Resource
	private BlogService blogService;

	// 博客集合
	private List<Blog> blogs;
	
	/**
	 * 最新博客集合
	 */
	private List<Blog> lastestBlogs;

	public List<Blog> getBlogs() {
		return blogs;
	}

	public List<Blog> getLastestBlogs() {
		return lastestBlogs;
	}

	@Override
	public Blog getModel() {
		return model;
	}

	/**
	 * 分页 每页大小设置为 10 条博客, 当前页为第一页
	 */
	private Page<Blog> page;

	public Page<Blog> getPage() {
		return page;
	}

	private String[] categories;
	public String[] getCategories() {
		return categories;
	}
	
	public String toBlogPage() {
		categories = parameterMap.get("category");
		String categ = "";
		if (categories != null) {
			categ = categories[0].trim();
		}
		page = new Page<>(1, 10);
		if(categ == "") {
			if (page.getTotalItemNumber() == 0) {
				page.setTotalItemNumber((long) blogService.uniqueResult());
			}
			if (parameterMap.containsKey("pageNo") && parameterMap.get("pageNo").length > 0) {
				String pageNo = parameterMap.get("pageNo")[0];
				page.setPageNo(Integer.parseInt(pageNo));
			}
			
			blogs = blogService.getBlogsByDefault(page.getPageSize() * (page.getPageNo() - 1), page.getPageSize());
			lastestBlogs = blogService.getLastestBlogs();
			
			return "blogPage";
		} else {
			long totalItem = (long) blogService.uniqueResult(categories[0]);
			page.setTotalItemNumber(totalItem);
			if (totalItem > 0) {
				if (parameterMap.containsKey("pageNo") && parameterMap.get("pageNo").length > 0) {
					String pageNo = parameterMap.get("pageNo")[0];
					page.setPageNo(Integer.parseInt(pageNo));
				} 
				blogs = blogService.getBlogsByCategory(page.getPageSize() * (page.getPageNo() - 1), page.getPageSize(), categories[0]);
			}
			lastestBlogs = blogService.getLastestBlogs();
			return "blogPage";
		}
		
	}

	Map<String, String[]> parameterMap;

	public Map<String, String[]> getParameterMap() {
		return parameterMap;
	}
	public void setParameterMap(Map<String, String[]> parameterMap) {
		this.parameterMap = parameterMap;
	}

	@Override
	public void setParameters(Map<String, String[]> arg0) {
		parameterMap = arg0;
	}
	
	/**
	 * 博客详细内容
	 */
	private Blog blogDetail;
	public Blog getBlogDetail() {
		return blogDetail;
	}

	/**
	 * 评论集合
	 */
	private List<Comment> detailComments;
	
	public List<Comment> getDetailComments() {
		return detailComments;
	}

	public String toDetailPage() {
		String blogId = parameterMap.get("blogId")[0];
		if (blogId == null || blogId.trim().length() == 0) {
			return "input";
		}
		int bid = Integer.parseInt(blogId);
		blogDetail = blogService.getBlogById(bid);
		
		detailComments = blogService.getCommentsByBlogId(blogDetail);
		lastestBlogs = blogService.getLastestBlogs();
		
		// 博文查看次数 +1
		blogService.updateViewedTimes(bid);
		
		return "detailPage";
	}

	private Comment comment;
	
	public void setComment(Comment comment) {
		this.comment = comment;
	}

	private String blogId;
	
	public void setBlogId(String blogId) {
		this.blogId = blogId;
	}

	public String saveComment() {
		User u = (User) sessionMap.get("user");
		int bid = Integer.parseInt(blogId);
		String time =  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(comment.getCommentTime());
		blogService.saveComment(comment, time, u.getId(), bid);
		return "saveComment";
	}

	private Map<String, Object> sessionMap;
	@Override
	public void setSession(Map<String, Object> arg0) {
		sessionMap = arg0;
	}
	
	public void setBlogDetail(Blog blogDetail) {
		this.blogDetail = blogDetail;
	}

	private Blog b = new Blog();
	public void setB(Blog b) {
		this.b = b;
	}
	public Blog getB() {
		return b;
	}
	
	public String saveBlog() {
//		System.out.println(b);
		User u = (User) sessionMap.get("user");
		b.setAuthor(u);
//		System.out.println();
		
		// 替换 \r\n 为 <br>
		b.setContent(b.getContent().replaceAll("\r\n", "<br/>").replaceAll(" ", "&nbsp;"));
		b.setTitle(b.getTitle().replaceAll("\r\n", "<br/>").replaceAll(" ", "&nbsp;"));
		b.setTag(b.getTag().replaceAll("，", ","));
		
		blogService.saveBlog(b);
		return "saveBlog";
	}

	public String updatePraisedNum() {
		blogId = parameterMap.get("blogId")[0];
//		System.out.println(blogId);
		blogService.updatePraisedNum(Integer.parseInt(blogId));
		return "updatePraisedNum";
	}
	
	
	private Blog editedBlog;
	public void setEditedBlog(Blog editedBlog) {
		this.editedBlog = editedBlog;
	}
	public Blog getEditedBlog() {
		return editedBlog;
	}
	
	public String toEditBlogPage() {
		blogId = parameterMap.get("blogId")[0];
		editedBlog = blogService.getBlogById(Integer.parseInt(blogId));
//		System.out.println(editedBlog);
		editedBlog.setTitle(editedBlog.getTitle().replaceAll("<br/>", "\r\n").replaceAll("&nbsp;", " "));
		editedBlog.setContent(editedBlog.getContent().replaceAll("<br/>", "\r\n").replaceAll("&nbsp;", " "));

		return "editBlogPage";
	}
	
	public String saveEditedBlog() {
//		System.out.println(editedBlog);
		editedBlog.setTitle(editedBlog.getTitle().replaceAll("\r\n", "<br/>").replaceAll(" ", "&nbsp;"));
		editedBlog.setContent(editedBlog.getContent().replaceAll("\r\n", "<br/>").replaceAll(" ", "&nbsp;"));
		editedBlog.setTag(editedBlog.getTag().replaceAll("，", ","));
		blogService.updateBlog(editedBlog);
		return "updateBlog";
	}
}
