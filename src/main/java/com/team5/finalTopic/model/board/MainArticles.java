package com.team5.finalTopic.model.board;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name = "MainArticles")
public class MainArticles {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "main_id")
	private Integer main_id;

	@Column(name = "category", columnDefinition = "nvarchar(MAX)", nullable = false)
	private String category;

	@Column(name = "access", columnDefinition = "nvarchar(10)", nullable = false)
	private String access;

//	@Column(name="author_id", nullable = false)
//	private Integer author_id;

	@Column(name = "title", columnDefinition = "nvarchar(50)", nullable = false)
	private String title;

	@Column(name = "content", columnDefinition = "nvarchar(Max)", nullable = false)
	private String content;

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "updatedatetime", columnDefinition = "datetime")
	private Date updatedatetime;

	public Integer getMain_id() {
		return main_id;
	}

	public void setMain_id(Integer main_id) {
		this.main_id = main_id;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getAccess() {
		return access;
	}

	public void setAccess(String access) {
		this.access = access;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getUpdatedatetime() {
		return updatedatetime;
	}

	public void setUpdatedatetime(Date updatedatetime) {
		this.updatedatetime = updatedatetime;
	}

	public Date getCreatedatetime() {
		return createdatetime;
	}

	public void setCreatedatetime(Date createdatetime) {
		this.createdatetime = createdatetime;
	}

	public Set<SubArticles> getSubarticles() {
		return subarticles;
	}

	public void setSubarticles(Set<SubArticles> subarticles) {
		this.subarticles = subarticles;
	}

	public Set<MainArticleMessages> getMainarticlemessages() {
		return mainarticlemessages;
	}

	public void setMainarticlemessages(Set<MainArticleMessages> mainarticlemessages) {
		this.mainarticlemessages = mainarticlemessages;
	}

	public Set<MainArticleLikes> getMainarticlelikes() {
		return mainarticlelikes;
	}

	public void setMainarticlelikes(Set<MainArticleLikes> mainarticlelikes) {
		this.mainarticlelikes = mainarticlelikes;
	}

	public Member getAuthor_idforMA() {
		return author_idforMA;
	}

	public void setAuthor_idforMA(Member author_idforMA) {
		this.author_idforMA = author_idforMA;
	}

	@PrePersist
	public void onCreate() {
		if (updatedatetime == null && createdatetime == null) {
			createdatetime = new Date();
		} 
		updatedatetime = createdatetime;
	}
	
	 @PreUpdate
	    public void onUpdate() {
	        updatedatetime = new Date();
	    }

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "createdatetime", columnDefinition = "datetime")
	private Date createdatetime;

	@OneToMany(mappedBy = "mainarticlesforsa", cascade = CascadeType.ALL) // 副文章關聯
	Set<SubArticles> subarticles = new LinkedHashSet<>();

	@OneToMany(mappedBy = "mainarticlesformam", cascade = CascadeType.ALL)
	Set<MainArticleMessages> mainarticlemessages = new LinkedHashSet<>(); // 主文章留言關聯

	@OneToMany(mappedBy = "mainarticlesformalk", cascade = CascadeType.ALL)
	Set<MainArticleLikes> mainarticlelikes = new LinkedHashSet<>(); // 主文章讚關聯

	@ManyToOne
	@JoinColumn(name = "author_id", nullable = false)
	private Member author_idforMA;

}
