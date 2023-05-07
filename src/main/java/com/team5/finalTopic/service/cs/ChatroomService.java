package com.team5.finalTopic.service.cs;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team5.finalTopic.model.cs.ChatMessage;
import com.team5.finalTopic.model.cs.ChatMessageRepository;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;

@Service
@Transactional
public class ChatroomService {

	private List<ChatMessage> messages = new ArrayList<>();

	@Autowired
	ChatMessageRepository CMR;

	@Autowired
	private MemberRepository MR;

	@PersistenceContext
	private EntityManager entityManager;

	public ChatMessage addMessage(ChatMessage message) {

		Member customer = MR.findById(message.getCustomer().getM_number()).orElse(null);

		Member managedMember = entityManager.merge(customer);
		System.out.println("名字為" + customer.getM_name());
		message.setCustomer(managedMember);
		CMR.save(message);
		messages.add(message);
		return message;
	}

	public List<ChatMessage> getAllMessages() {
		messages=CMR.findAll();
		return messages;
	}

}