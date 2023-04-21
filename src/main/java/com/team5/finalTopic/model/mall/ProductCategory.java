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
    @Column(name = "ProductId ")  //產品編號
    private Integer ProductId;

    @Column(name = "category_name",columnDefinition = "nvarchar(Max)",nullable = false) //分類名稱
    private String categoryName;

    @OneToMany(mappedBy = "productCategory") //外鍵
    private Set<ListedProduct> listedProducts;

}
