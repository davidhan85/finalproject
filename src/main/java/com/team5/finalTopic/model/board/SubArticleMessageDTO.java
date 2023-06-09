package com.team5.finalTopic.model.board;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SubArticleMessageDTO {
	private List<Integer> subArticleIds;
	private String auaccount;
	
	public String getAuaccount() {
		return auaccount;
	}
	public void setAuaccount(String auaccount) {
		this.auaccount = auaccount;
	}
	public List<Integer> getSubArticleIds() {
		return subArticleIds;
	}
	public void setSubArticleIds(List<Integer> subArticleIds) {
		this.subArticleIds = subArticleIds;
	}
	private Integer subid;
	public Integer getSubid() {
		return subid;
	}
	public void setSubid(Integer subid) {
		this.subid = subid;
	}
	private Integer auid;
	private String content;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm:ss''")
	private Date updatedatetime;
	
	
	


	
	public Integer getAuid() {
		return auid;
	}
	public void setAuid(Integer auid) {
		this.auid = auid;
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
}
