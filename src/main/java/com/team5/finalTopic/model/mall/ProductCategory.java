package com.team5.finalTopic.model.mall;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "ProductCategory")
public class ProductCategory {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ProductCategorynumber")  //分類編號
    private Integer ProductCategorynumber;

    @Column(name = "category_name",columnDefinition = "nvarchar(Max)",nullable = false) //分類名稱
    private String categoryName;

  


	public Integer getProductCategorynumber() {
		return ProductCategorynumber;
	}

	public void setProductCategorynumber(Integer productCategorynumber) {
		ProductCategorynumber = productCategorynumber;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	
	@Override
	public String toString() {
		return "ProductCategory [ProductCategorynumber=" + ProductCategorynumber + ", categoryName=" + categoryName +  "]";
	}

}
