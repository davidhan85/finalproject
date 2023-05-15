package com.team5.finalTopic.model.board;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
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
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name="MainArticleMessages")
public class MainArticleMessages {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="mamessage_id")
	private Integer mamessageid;
	
	
//	@Column(name="author_id", nullable = false)
//	private Integer author_id;
	
	
	@Column(name="content",columnDefinition = "nvarchar(Max)", nullable = false)
	private String content;
	
	
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
	
	public Integer getMamessageid() {
		return mamessageid;
	}

	public void setMamessageid(Integer mamessageid) {
		this.mamessageid = mamessageid;
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

	public MainArticles getMainarticlesformam() {
		return mainarticlesformam;
	}

	public void setMainarticlesformam(MainArticles mainarticlesformam) {
		this.mainarticlesformam = mainarticlesformam;
	}

	public Set<MainArticleMessageLikes> getMainarticlemessagelikes() {
		return mainarticlemessagelikes;
	}

	public void setMainarticlemessagelikes(Set<MainArticleMessageLikes> mainarticlemessagelikes) {
		this.mainarticlemessagelikes = mainarticlemessagelikes;
	}

	public Member getAuthoridforMAM() {
		return authoridforMAM;
	}

	public void setAuthoridforMAM(Member authoridforMAM) {
		this.authoridforMAM = authoridforMAM;
	}


	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "createdatetime", columnDefinition = "datetime")
	private Date createdatetime;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="fk_MAM_MA_Id", nullable = false)
	@JsonIgnoreProperties("mainarticlemessages")
	private MainArticles mainarticlesformam;
	
	
	@OneToMany(mappedBy = "mainarticlemessagesformamelk", cascade = CascadeType.ALL)
	@JsonIgnoreProperties("mainarticlemessagesformamelk")
	Set<MainArticleMessageLikes> mainarticlemessagelikes = new LinkedHashSet<>();
	
	@ManyToOne(cascade = CascadeType.PERSIST,fetch = FetchType.EAGER)
	@JoinColumn(name="author_id", nullable = false)
	@JsonIgnoreProperties("memberMainArticleMessages")
	private Member authoridforMAM;
}
