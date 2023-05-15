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
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name="SubArticleMessageLikes")
public class SubArticleMessageLikes {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="samessagelike_id")
	private Integer samessagelikeid;
	
	
//	@Column(name="author_id", nullable = false)
//	private Integer author_id;
	
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss EEEE",timezone = "GMT+8")
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "updatedatetime", columnDefinition = "datetime")
	private Date updatedatetime;	
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
	
	
	public Integer getSamessagelikeid() {
		return samessagelikeid;
	}

	public void setSamessagelikeid(Integer samessagelikeid) {
		this.samessagelikeid = samessagelikeid;
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

	public SubArticleMessages getSubarticlemessagesforsamelk() {
		return subarticlemessagesforsamelk;
	}

	public void setSubarticlemessagesforsamelk(SubArticleMessages subarticlemessagesforsamelk) {
		this.subarticlemessagesforsamelk = subarticlemessagesforsamelk;
	}

	public Member getAuthoridforSAML() {
		return authoridforSAML;
	}

	public void setAuthoridforSAML(Member authoridforSAML) {
		this.authoridforSAML = authoridforSAML;
	}


	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "createdatetime", columnDefinition = "datetime")
	private Date createdatetime;
	
	@ManyToOne
	@JoinColumn(name="fk_SAMELK_SAME_Id", nullable = false)
	private SubArticleMessages subarticlemessagesforsamelk;
	
	@ManyToOne
	@JoinColumn(name="author_id", nullable = false)
	private Member authoridforSAML;

	
}
