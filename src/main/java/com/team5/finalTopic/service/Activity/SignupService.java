package com.team5.finalTopic.service.Activity;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team5.finalTopic.model.Activity.SignUp;
import com.team5.finalTopic.model.Activity.SignupRepository;


@Service
public class SignupService {

	public SignupService() {
		
	}
		
		
			
			@Autowired
			private SignupRepository sgnRepository;
			
			public void addSignup(SignUp signup) {
				sgnRepository.save(signup);//新增單筆的進入資料庫
			}
			
			public SignUp findSignUpById(Integer id) {
				Optional<SignUp> option = sgnRepository.findById(id);
				
				if(option.isEmpty()) {
					return null;
				}
				
				return option.get();
			}
			
			public void deleteSignUpById(Integer id) {
				sgnRepository.deleteById(id);
			}
			//Page是繼承Slice，所以有content、pageable這些方法
			public Page<SignUp> findByPage(Integer pageNumber){
				Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "added");
				Page<SignUp> page = sgnRepository.findAll(pgb);
				return page;
			}
			
			@Transactional
			public SignUp updateById(Integer id, Date newSignUpInfo) {
				Optional<SignUp> option = sgnRepository.findById(id);
				
				if(option.isPresent()) {
					SignUp msg = option.get();
					msg.setSignup_date(newSignUpInfo);//因為自己手動加入所以要加上@Transactional，但是上面的delete不用加上，是因為有繼承了@Tranactional
					return msg;
				}
				return null;
			}
			
//			public SignUp getLatest() {
//				return sgnRepository.findFirstByOrderByAddedDesc();
//			}

		}

	


