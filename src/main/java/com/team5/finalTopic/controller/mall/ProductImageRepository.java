package com.team5.finalTopic.controller.mall;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.team5.finalTopic.model.mall.ProductImage;

public interface ProductImageRepository extends JpaRepository<ProductImage,Integer> {
	
@Query("select pi from ProductImage pi where pi.listedProducts.ProductId=:id")
ProductImage findImage (@Param("id") Integer id);
	
	
}
