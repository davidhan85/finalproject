package com.team5.finalTopic.model.board;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class MainArticleMessageDTO {

	private Integer mainid;
	private Integer auid;
	private String content;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy/MM/dd HH:mm:ss''")
	private Date updatedatetime;
	public Date getUpdatedatetime() {
		return updatedatetime;
	}



	public void setUpdatedatetime(Date updatedatetime) {
		this.updatedatetime = updatedatetime;
	}
	
	
	
	

	public MainArticleMessageDTO() {
		super();
	}



	@Override
	public String toString() {
		return "MainArticleMessageDTO [mainid=" + mainid + ", auid=" + auid + ", content=" + content + "]";
	}
	
	public Integer getMainid() {
		return mainid;
	}
	public void setMainid(Integer mainid) {
		this.mainid = mainid;
	}
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
	
	
	
}
