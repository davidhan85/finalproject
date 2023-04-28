package com.team5.finalTopic.service.Activity;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team5.finalTopic.model.Activity.ActRepository;
import com.team5.finalTopic.model.Activity.Activity;





@Service
@Transactional
public class ActServiceImpl implements ActService{

	@Autowired
	private ActRepository actRepository;
	
	
	
	public void addActivity(Activity act) {
		actRepository.save(act);//新增單筆的進入資料庫
	
	}

	
	@Override
    public List<Activity> findAll() {
        return actRepository.findAll();
    }
	
	
	@Override
	public List<Activity> ActivitylistAll(String keyword) {
		if (keyword != null) {
            return actRepository.search(keyword);
        }
		
		 return actRepository.findAll();//指令 查詢用法
		 }
		
	
	public Activity findActivityById(Integer id) {
		Optional<Activity> option = actRepository.findById(id);
		
		if(option.isEmpty()) {
			return null;
		}
		
		return option.get();
	}



	


	@Override
	public Activity FindById(long ac_id) {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
    public void delete(Integer activity_id) {
        actRepository.deleteById(activity_id);
    }


	@Override
	public void save(Activity theActivityBean) {
		// TODO Auto-generated method stub
		
	}


	@Override
	public void deleteAP(Long orderNo) {
		// TODO Auto-generated method stub
		
	}


	


	


	

	



}
