package com.team5.finalTopic.controller.Activity;

import java.io.IOException;
import java.util.Date;
import java.sql.SQLException;

import java.util.List;


import org.apache.tomcat.util.codec.binary.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import com.team5.finalTopic.model.Activity.Activity;
import com.team5.finalTopic.service.Activity.ActService;
import com.team5.finalTopic.service.Activity.ActServiceImpl;
import com.team5.finalTopic.service.Activity.MultiService;
import com.team5.finalTopic.model.Activity.ActRepository;


@Controller
public class BackActivityController {
	
	@Autowired
	private ActServiceImpl actService;
	
	@Autowired
	private ActRepository actRepository;
	
	@Autowired
	private ActService aService;
	
	@Autowired
	private MultiService multiService;
	
//	@GetMapping("/activity")
//	public String Home(Model model) {
//	   
//	    return "Activity/HomePage";
//	}
	@PostMapping("/HomePage")
	public String BackToHomePage(){
		return "Activity/HomePage";
	}
	//新增
	@PostMapping("/test1")
	public String Test1(){
		return "Activity/test1";
	}
	
	
	@PostMapping("/addActivity")
	public String addActivity( @RequestParam("activity_id") Integer activity_id,
							   @RequestParam("principle") String principle,
	                           @RequestParam("activity_name") String activity_name,
	                           @RequestParam("activity_date") @DateTimeFormat(pattern="yyyy-MM-dd'T'HH:mm") Date activity_date,	                           @RequestParam("activity_image") MultipartFile activity_image,
	                           @RequestParam("attendance") int attendance,
	                           @RequestParam("activity_cost") int activity_cost,
	                           @RequestParam("activityDescription") String activityDescription) throws SQLException {
	    
	    try {
	        // 將圖像的字節數組讀取到一個變數中
	    	 byte[] data = activity_image.getBytes(); 
	        
	        
	         // 將日期轉換為java.sql.Date對象
	         java.sql.Date sqlDate = new java.sql.Date(activity_date.getTime()); 
	         

	        // 創建一個新的Activity物件，將所有屬性設置為傳入的值
	        Activity activity = new Activity();
	        
	        activity.setActivity_id(activity_id);
	        activity.setPrinciple(principle);
	        activity.setActivity_name(activity_name);
//	        activity.setActivity_date(activity_date); // 直接使用方法傳入的日期

	        activity.setActivity_date(sqlDate);

	        activity.setActivity_image(data);
	        activity.setAttendance(attendance);
	        activity.setActivity_cost(activity_cost);
	        activity.setActivity_discription(activityDescription);
	        
	        // 將Activity物件儲存在資料庫中
	        actRepository.save(activity);
	        
	        // 如果儲存成功，返回成功的提示頁面
	        return "Activity/Success";
	        
	    } catch (IOException e) {
	        // 如果發生異常，返回錯誤的提示頁面
	        return "Activity/Error";
	    }
	}
	
	
	
	@PostMapping("/activityInfo")
	public String listActivity(Model model) {
		List<Activity> activityBeans = actService.findAll();
		model.addAttribute("activitieeBeans", activityBeans);
		return "Activity/BackActivity";
	}
	

	
	@GetMapping("/activityDelete")
	public String getDeleteActivityPage() {
		return "Activity/DeleteActivity1";
		}
	
	@PostMapping("/deleteActivity11")
	public String deleteActivity(@RequestParam("activity_id") Integer activity_id, Model model) {
		boolean deleted;
		try {
		actService.deleteById(activity_id);
		deleted = true;
		} catch (Exception e) {
		deleted = false;
		}
		if (deleted) {
		List<Activity> activityBeansssss = actService.findAll();
		model.addAttribute("activitieeBeans", activityBeansssss );
		}
		return "Activity/BackActivity";
		}
	

	@PostMapping("/ButtonDelete")
	public String ButtonDeleteById(@RequestParam("activity_id")Integer activity_id, Model model) {
		actService.deleteById(activity_id);

		return "Activity/DeleteSuccess";
		
	}
	
	
	@PostMapping("/CheckMultis")
	public String Next(Model model) {
	    model.addAttribute("multiList", multiService.findAll());
		return "Activity/multiList";
		
	}

	
	public BackActivityController() {

	}

}
