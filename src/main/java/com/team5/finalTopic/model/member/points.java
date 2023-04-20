package com.team5.finalTopic.model.member;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Entity
@Table(name="points")
@Getter
@Setter
@ToString
public class points {
	
	@Id
	@Column(name="point_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	Integer point_id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(columnDefinition = "datetime",name="creationtime")
	Date creationtime;
	
	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(columnDefinition = "datetime",name="updatetime")
	Date updatetime;

	public points() {
		
	}

}
