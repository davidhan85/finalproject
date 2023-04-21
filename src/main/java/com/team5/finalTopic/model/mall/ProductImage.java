package com.team5.finalTopic.model.mall;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name = "ProductImage")
public class ProductImage {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY) //產品編號
	    @Column(name = "ProductId")
	    private Integer ProductId;

	    @Column(name = "image_url")//照片路徑
	    private String imageUrl;

	    @Lob
	    @Column(name = "productImage")//上架照片
	    private Blob m_image; 

	    
}
