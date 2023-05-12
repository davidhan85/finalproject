package com.team5.finalTopic.model.mall;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "productCategory")
public class productCategory {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "productCategoryNumber")  //分類編號
    private Integer productCategoryNumber;

    @Column(name = "category_name",columnDefinition = "nvarchar(Max)",nullable = false) //分類名稱
    private String categoryName;


	public Integer getProductCategoryNumber() {
		return productCategoryNumber;
	}

	public void setProductCategoryNumber(Integer productCategorynumber) {
		this.productCategoryNumber = productCategorynumber;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	
	@Override
	public String toString() {
		return "ProductCategory [productCategoryNumber=" + productCategoryNumber + ", categoryName=" + categoryName +  "]";
	}

}
