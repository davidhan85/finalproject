package com.team5.finalTopic.service.Activity;

import java.util.List;

import com.team5.finalTopic.model.Activity.Activity;

public interface ActService {

	//show all
			public List<Activity> findAll();

			public List<Activity> ActivitylistAll(String keyword);
			//save
			public void save(Activity theActivityBean);
			
			//getOrder
			public Activity FindById(long ac_id);
			
			//delete
			public void delete(Integer activity_id);
		//delete
			public void deleteAP(Long orderNo);
}
