package com.team5.finalTopic.model.board;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name="MainArticleLikes")
public class MainArticleLikes {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="mainarticleLikes_id")
	private Integer malike_id;
	
	
//	@Column(name="author_id", nullable = false)
//	private Integer author_id;
	
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss ",timezone = "GMT+8")
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
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss ",timezone = "GMT+8")
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "createdatetime", columnDefinition = "datetime")
	private Date createdatetime;
	
	@ManyToOne
	@JoinColumn(name="fk_MALK_MA_Id", nullable = false)
	private MainArticles mainarticlesformalk;

	@ManyToOne
	@JoinColumn(name="author_id", nullable = false)
	private Member author_idforMAL;	
	
	
}
