package org.zhli.openbook.model;

import java.util.Date;

public class Comment {

	/**
	 * 评论编号
	 */
	private Integer id;
	/**
	 * 评论时间
	 */
	private Date commentTime = new Date();
	/**
	 * 评论内容
	 */
	private String commentContent;
	/**
	 * 评论用户
	 */
	private User user;
	/**
	 * 被评论的博客
	 */
	private Blog blog;
	/**
	 * 回复的父回复
	 */
	private Comment parentComment;

/*
	private Set<Comment> childComments;

	public Set<Comment> getChildComments() {
		return childComments;
	}

	public void setChildComments(Set<Comment> childComments) {
		this.childComments = childComments;
	}
*/
	public Comment getParentComment() {
		return parentComment;
	}

	public void setParentComment(Comment parentComment) {
		this.parentComment = parentComment;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(Date commentTime) {
		this.commentTime = commentTime;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Blog getBlog() {
		return blog;
	}

	public void setBlog(Blog blog) {
		this.blog = blog;
	}

	@Override
	public String toString() {
		return "Comment [id=" + id + ", commentTime=" + commentTime
				+ ", commentContent=" + commentContent + ", user=" + user
				+ ", blog=" + blog + ", parentComment=" + parentComment + "]";
	}

}
