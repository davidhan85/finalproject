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

@Entity
@Table(name="MainArticleMessages")
public class MainArticleMessages {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="mamessage_id")
	private Integer mamessage_id;
	
	
	@Column(name="author_id", nullable = false)
	private Integer author_id;
	
	
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
	
	@ManyToOne
	@JoinColumn(name="fk_MAM_MA_Id", nullable = false)
	private MainArticles mainarticlesformam;
	
	
	@OneToMany(mappedBy = "mainarticlemessagesformamelk")
	Set<MainArticleMessageLikes> mainarticlemessagelikes = new LinkedHashSet<>();
}
