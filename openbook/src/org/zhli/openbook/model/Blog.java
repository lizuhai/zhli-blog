package org.zhli.openbook.model;

import java.util.Date;
import java.util.Set;

public class Blog {
	/**
	 * 编号
	 */
	private Integer id;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 创作时间
	 */
	private Date writingDate = new Date();
	/**
	 * 最近修改时间
	 */
	private Date lastModifiedTime = new Date();
	/**
	 * 赞数
	 */
	private Integer praisedNumber;
	/**
	 * 查看次数
	 */
	private Integer viewedTimes;
	/**
	 * 文章内容
	 */
	private String content;
	/**
	 * 作者(建立从 Blog 到 User 的多对一关联关系)
	 */
	private User author;

	/**
	 * 文章的标签
	 */
	private String tag;

	/**
	 * 文章所属的类别
	 */
	private String category;

	/**
	 * 评论集合
	 */
	private Set<Comment> comments;

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public User getAuthor() {
		return author;
	}

	public void setAuthor(User author) {
		this.author = author;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getWritingDate() {
		return writingDate;
	}

	public void setWritingDate(Date writingDate) {
		this.writingDate = writingDate;
	}

	public Date getLastModifiedTime() {
		return lastModifiedTime;
	}

	public void setLastModifiedTime(Date lastModifiedTime) {
		this.lastModifiedTime = lastModifiedTime;
	}

	public Integer getPraisedNumber() {
		return praisedNumber;
	}

	public void setPraisedNumber(Integer praisedNumber) {
		this.praisedNumber = praisedNumber;
	}

	public Integer getViewedTimes() {
		return viewedTimes;
	}

	public void setViewedTimes(Integer viewedTimes) {
		this.viewedTimes = viewedTimes;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Blog [id=" + id + ", title=" + title + ", writingDate="
				+ writingDate + ", lastModifiedTime=" + lastModifiedTime
				+ ", praisedNumber=" + praisedNumber + ", viewedTimes="
				+ viewedTimes + ", content=" + content + ", author=" + author
				+ ", tag=" + tag + ", category=" + category + "]";
	}

}
