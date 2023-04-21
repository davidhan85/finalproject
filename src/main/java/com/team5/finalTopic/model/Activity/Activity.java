package com.team5.finalTopic.model.Activity;

import java.sql.Blob;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
//測試中，測次完成
@Entity
@Table(name = "activity")
public class Activity {
	
		@Id
		@Column(name = "activity_id")
		private Integer activity_id;
		
		@Column(columnDefinition = "NVARCHAR(50) not null",name="principle")
		String principle; 
		
		
		@Column(columnDefinition = "NVARCHAR(50) not null",name="activity_name")
		String activity_name; 
		
		
		@JsonFormat(shape = JsonFormat.Shape.STRING,pattern = "yyyy-MM-dd")
		@Column(columnDefinition = "Date",name="activity_date")
		Date activity_date; 
		
		
		@Column(columnDefinition = "Integer not null",name="attendance")
		Integer attendance; 
		
		@Lob
		@Column(name="activity_image")
		Blob activity_image;
		
		
		@Column(columnDefinition = "Integer not null",name="activity_cost")
		String activity_cost; 
		
		@Column(columnDefinition = "NVARCHAR(50) not null",name="activity_discription")
		String activity_discription; 
		
	
		
		
		public Integer getActivity_id() {
			return activity_id;
		}




		public void setActivity_id(Integer activity_id) {
			this.activity_id = activity_id;
		}




		public String getPrinciple() {
			return principle;
		}




		public void setPrinciple(String principle) {
			this.principle = principle;
		}




		public String getActivity_name() {
			return activity_name;
		}




		public void setActivity_name(String activity_name) {
			this.activity_name = activity_name;
		}




		public Date getActivity_date() {
			return activity_date;
		}




		public void setActivity_date(Date activity_date) {
			this.activity_date = activity_date;
		}




		public Integer getAttendance() {
			return attendance;
		}




		public void setAttendance(Integer attendance) {
			this.attendance = attendance;
		}




		public Blob getActivity_image() {
			return activity_image;
		}




		public void setActivity_image(Blob activity_image) {
			this.activity_image = activity_image;
		}




		public String getActivity_cost() {
			return activity_cost;
		}




		public void setActivity_cost(String activity_cost) {
			this.activity_cost = activity_cost;
		}




		public String getActivity_discription() {
			return activity_discription;
		}




		public void setActivity_discription(String activity_discription) {
			this.activity_discription = activity_discription;
		}




		
	
	
	public Activity() {
		
	}

}