package com.team5.finalTopic.model.cs;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.service.cs.MemberDeserializer;

@Entity
@Table(name = "GPTChatMessage")
public class GptChatMessage {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ChatMessageID;

	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "FK_Customer_ID", referencedColumnName = "member_number")
	@JsonDeserialize(using = MemberDeserializer.class)
	private Member customer;
	
	private String content;
	
	private long timestamp;

	public Integer getChatMessageID() {
		return ChatMessageID;
	}

	public void setChatMessageID(Integer chatMessageID) {
		ChatMessageID = chatMessageID;
	}

	public Member getCustomer() {
		return customer;
	}

	public void setCustomer(Member customer) {
		this.customer = customer;
	}

	public long getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(long timestamp) {
		this.timestamp = timestamp;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}


}
