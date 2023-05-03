package com.team5.finalTopic.controller.mall;

import org.springframework.data.jpa.repository.JpaRepository;

import com.team5.finalTopic.model.mall.ProductImage;

public interface ProductImageRepository extends JpaRepository<ProductImage,Integer> {
	
}
