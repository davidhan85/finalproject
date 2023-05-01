package com.team5.finalTopic.controller.mall;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.team5.finalTopic.model.mall.ListedProduct;

public interface ListedProductRepository extends JpaRepository<ListedProduct,Integer> {
	 @Query("select p from ListedProduct  p")
	    List<ListedProduct> getAll();	
}
