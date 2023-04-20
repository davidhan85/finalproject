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
	@Table(name="SubArticleMessages")
	public class SubArticleMessages {

		@Id
		@GeneratedValue(strategy = GenerationType.IDENTITY)
		@Column(name="samessage_id")
		private Integer samessage_id;
		
		
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
		@JoinColumn(name="fk_SAM_SA_Id", nullable = false)  //對副文章留言關聯
		private SubArticles subarticlesforsam;
		
		@OneToMany(mappedBy = "subarticlemessagesforsamelk")
		Set<SubArticleMessageLikes> subarticlemessagelikes = new LinkedHashSet<>();
}
