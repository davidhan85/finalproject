package com.team5.finalTopic.model.board;

import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashSet;
import java.util.List;
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
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name="SubArticles")
public class SubArticles {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="sub_id")
	private Integer subid;
	
//	@Column(name="author_id", nullable = false)
//	private Integer author_id;
	
	
	public Integer getSubid() {
		return subid;
	}

	public void setSubid(Integer subid) {
		this.subid = subid;
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

	public MainArticles getMainarticlesforsa() {
		return mainarticlesforsa;
	}

	public void setMainarticlesforsa(MainArticles mainarticlesforsa) {
		this.mainarticlesforsa = mainarticlesforsa;
	}

	public Set<SubArticleLikes> getSubarticlelikes() {
		return subarticlelikes;
	}

	public void setSubarticlelikes(Set<SubArticleLikes> subarticlelikes) {
		this.subarticlelikes = subarticlelikes;
	}

	public List<SubArticleMessages> getSubarticlemessages() {
		return subarticlemessages;
	}

	public void setSubarticlemessages(List<SubArticleMessages> subarticlemessages) {
		this.subarticlemessages = subarticlemessages;
	}

	

	public Member getAuthoridforSA() {
		return authoridforSA;
	}

	public void setAuthoridforSA(Member authoridforSA) {
		this.authoridforSA = authoridforSA;
	}


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
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(name = "createdatetime", columnDefinition = "datetime")
	private Date createdatetime;
	
	@ManyToOne
	@JoinColumn(name="fk_SA_MA_Id", nullable = false)    //對主文章關聯
	@JsonIgnoreProperties("subarticles")
	private MainArticles mainarticlesforsa;
	
	@OneToMany(mappedBy = "subarticlesforsalk" , cascade = CascadeType.ALL)
	@JsonIgnoreProperties("subarticlesforsalk")
	Set<SubArticleLikes> subarticlelikes = new LinkedHashSet<>();  //副文章讚數關聯
	
	@OneToMany(mappedBy = "subarticlesforsam" , cascade = CascadeType.ALL)
	@JsonIgnoreProperties("subarticlesforsam")
	List<SubArticleMessages> subarticlemessages = new ArrayList<>();  //副文章留言關聯
	


	@ManyToOne
	@JoinColumn(name="author_id", nullable = false)
	@JsonIgnoreProperties("memberSubArticles")
	private Member authoridforSA;
	
}
