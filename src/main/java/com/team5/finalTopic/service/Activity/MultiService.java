package com.team5.finalTopic.service.Activity;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.model.Activity.ActRepository;
import com.team5.finalTopic.model.Activity.Activity;
import com.team5.finalTopic.model.Activity.MultiMember;
import com.team5.finalTopic.model.Activity.MultiMemberRepository;
import com.team5.finalTopic.model.member.Member;
import com.team5.finalTopic.model.member.MemberRepository;

@Service
public class MultiService {
	
	@Autowired
	private MemberRepository MR;

	@Autowired
	private ActRepository act;

	@Autowired 
	private MultiMemberRepository multiRepository;
//	//save
//	public void save(Member theMemberBean);
	
	
	public List<MultiMember> findAll() {
        return multiRepository.findAll();
    }
		
//	public MultiMember findMultimemberById(MultiMember members) {
//		Optional<MultiMember> option = multiRepository.findAllById(members);
//		
//		if(option.isEmpty()) {
//			return null;
//		}
//		
//		return option.get();
//	}
	
	public List<MultiMember> findById(Integer id){
		 Optional<MultiMember> option = multiRepository.findById(id);
		 List<MultiMember> multiMembers = new ArrayList<>();
		 if(option.isPresent()) {
			 MultiMember multiMember = option.get();
			 multiMembers.add(multiMember);
		 }
		return multiMembers;   
	}
	
	
	
	
	public void addForm(MultiMember members) {

		
    
		Member member_number = MR.findById(members.getMemberss().getM_number()).orElse(null);	
		//第一個.getMemberss是Bean，也就是政佑的Entity我在我自己的MultiMember的ManytoOne裡那一行輸入我如何取名政佑的Entity的名字我選擇的是private Member member ，所以透過呼叫他的Member Entity 我再取他的成員變數裡的m_number
		
		Activity activity = act.findById(members.getActivity().getActivity_id()).orElse(null);
		System.out.println("123:"+members.getActivity().getActivity_id());
//		System.out.println("1:"+members.getActivity_id());
//		if(activity==null) {
//			System.out.println("activity_id==null");
//		}
		System.out.println(activity.getActivity_id());
		System.out.println(member_number.getM_number());
		System.out.println(member_number.getM_id());
		members.setActivity(activity);
		members.setMemberss(member_number);
		multiRepository.save(members);
//		CCR.flush();

	}

}
