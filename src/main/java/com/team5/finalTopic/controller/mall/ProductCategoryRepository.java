package com.team5.finalTopic.controller.mall;

import com.team5.finalTopic.model.mall.productCategory;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ProductCategoryRepository extends JpaRepository<productCategory,Integer> {

}
