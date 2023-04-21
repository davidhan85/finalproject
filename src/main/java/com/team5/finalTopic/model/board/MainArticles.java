package com.team5.finalTopic.model.board;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name="MainArticles")
public class MainArticles {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="main_id")
	private Integer main_id;
	
	
	@Column(name="category", columnDefinition = "nvarchar(10)", nullable = false)
	private String category;
	
	
	@Column(name="access", columnDefinition = "nvarchar(10)", nullable = false)
	private String access;
	
	
//	@Column(name="author_id", nullable = false)
//	private Integer author_id;
	
	
	@Column(name="title",columnDefinition = "nvarchar(50)", nullable = false)
	private String title;
	
	
	@Column(name="content",columnDefinition = "nvarchar(Max)", nullable = false)
	private String content;
	
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss EEEE",timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "updatedatetime", columnDefinition = "datetime")
	private Date updatedatetime;	
	@PrePersist
	public void onCreate() {
		if(updatedatetime == null) {
		 	updatedatetime = new Date();
		}
	}
	
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "createdatetime", columnDefinition = "datetime")
	private Date createdatetime;
	
	@OneToMany(mappedBy = "mainarticlesforsa")                              //副文章關聯
	Set<SubArticles> subarticles = new LinkedHashSet<>();
	
	@OneToMany(mappedBy = "mainarticlesformam")
	Set<MainArticleMessages> mainarticlemessages = new LinkedHashSet<>();  //主文章留言關聯
	
	@OneToMany(mappedBy = "mainarticlesformalk")
	Set<MainArticleLikes> mainarticlelikes = new LinkedHashSet<>();  //主文章讚關聯
	
	@ManyToOne
	@JoinColumn(name="author_id", nullable = false)
	private Member author_idforMA;
	
	
}
