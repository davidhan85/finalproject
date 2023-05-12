package com.team5.finalTopic.service.mall;

import java.util.ArrayList;
import java.util.List;

import com.team5.finalTopic.model.mall.productCategory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.controller.mall.ProductCategoryRepository;
import com.team5.finalTopic.model.mall.productCategory;

@Service
public class ProductCategoryService {
	
	  @Autowired
	    private ProductCategoryRepository repository;

	  
	  public productCategory save(productCategory productCategory) {
	        return repository.save(productCategory);
	    }

	    public productCategory findById(Integer id) {
	        return repository.findById(id).orElse(null);
	    }

	    public List<productCategory> findAll() {
	        return repository.findAll();
	    }

	    public void deleteById(Integer id) {
	    	repository.deleteById(id);
	    }



	}


