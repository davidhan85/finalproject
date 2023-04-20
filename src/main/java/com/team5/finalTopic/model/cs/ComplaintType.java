package com.team5.finalTopic.model.cs;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ComplaintType")
public class ComplaintType {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="ComplaintID ")
	private Integer ComplaintID ;
	
	@Column(name="ComplaintName")
	private String ComplaintName;
	
	@Column(name="ComplaintDiscription")
	private Integer ComplaintDiscription;
  
}
