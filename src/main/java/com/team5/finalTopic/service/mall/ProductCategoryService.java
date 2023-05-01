package com.team5.finalTopic.service.mall;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.controller.mall.ProductCategoryRepository;
import com.team5.finalTopic.model.mall.ProductCategory;

@Service
public class ProductCategoryService {
	
	  @Autowired
	    private ProductCategoryRepository repository;

	  
	  public ProductCategory save(ProductCategory productCategory) {
	        return repository.save(productCategory);
	    }

	    public ProductCategory findById(Integer id) {
	        return repository.findById(id).orElse(null);
	    }

	    public List<ProductCategory> findAll() {
	        return repository.findAll();
	    }

	    public void deleteById(Integer id) {
	    	repository.deleteById(id);
	    }
	}


