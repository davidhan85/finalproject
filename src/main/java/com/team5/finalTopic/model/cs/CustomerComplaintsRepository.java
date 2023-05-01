package com.team5.finalTopic.model.cs;



import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;



public interface CustomerComplaintsRepository extends JpaRepository<CustomerComplaints,Integer> {

	public List<CustomerComplaints> findByCustomerName(String CustomerName);	
	
	@Query("select cc from CustomerComplaints cc where cc.ComplaintType.ComplaintName= :TypeName")
	public List<CustomerComplaints> findByTypeName(String TypeName);
	
}
