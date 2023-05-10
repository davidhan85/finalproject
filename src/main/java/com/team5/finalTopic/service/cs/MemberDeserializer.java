package com.team5.finalTopic.service.cs;

import org.springframework.beans.factory.annotation.Autowired;
import com.fasterxml.jackson.core.JsonParser;
import org.springframework.core.convert.converter.Converter;

import java.io.IOException;
import java.util.Optional;

import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;

public class MemberDeserializer extends JsonDeserializer<Member> {

	@Autowired
	private MemberRepository MR;

	@Override
	public Member deserialize(JsonParser p, DeserializationContext ctxt) throws IOException {
		// 在此处实现将字符串转换为 Member 对象的逻辑
		// 例如，您可以从数据库或其他地方获取 Member 对象，并返回它

		// 假设您使用了 JPA 作为持久层框架，则可以使用下列代码从数据库获取 Member 对象：
		String memberIdStr = p.getValueAsString();
		Integer memberId = Integer.valueOf(memberIdStr);
		Optional<Member> memberOP = MR.findById(memberId); // MemberRepository 是你自己定义的 Repository 接口

		return memberOP.orElse(null);
	}

}