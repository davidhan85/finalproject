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
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name="SubArticleLikes")
public class SubArticleLikes {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="subarticleLikes_id")
	private Integer salikeid;
	
	
//	@Column(name="author_id", nullable = false)
//	private Integer author_id;
//	
	
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
	
	public Integer getSalikeid() {
		return salikeid;
	}

	public void setSalikeid(Integer salikeid) {
		this.salikeid = salikeid;
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

	public SubArticles getSubarticlesforsalk() {
		return subarticlesforsalk;
	}

	public void setSubarticlesforsalk(SubArticles subarticlesforsalk) {
		this.subarticlesforsalk = subarticlesforsalk;
	}

	public Member getAuthoridforSAL() {
		return authoridforSAL;
	}

	public void setAuthoridforSAL(Member authoridforSAL) {
		this.authoridforSAL = authoridforSAL;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "createdatetime", columnDefinition = "datetime")
	private Date createdatetime;
	
	@ManyToOne
	@JoinColumn(name="fk_SALK_SA_Id", nullable = false)
	private SubArticles subarticlesforsalk;
	
	@ManyToOne
	@JoinColumn(name="author_id", nullable = false)
	@JsonIgnoreProperties("memberSubArticleLikes")
	private Member authoridforSAL;

}
