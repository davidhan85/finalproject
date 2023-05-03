package com.team5.finalTopic.model.mall;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "ProductImage")
public class ProductImage {

	    @Id
	    @GeneratedValue(strategy = GenerationType.IDENTITY) //圖片編號
	    @Column(name = "ProductImageId")
	    private Integer ProductImageId;

	    @Lob
	    @Column(name = "productImage",columnDefinition = "varbinary(MAX)")//上架照片
	    byte[] m_image;

	    
	    @OneToMany(mappedBy = "ProductImage") //ProductImageId參考
	    private List<ListedProduct> listedProducts;
	    
	    		
		public Integer getProductImageId() {
			return ProductImageId;
		}



		public void setProductImageId(Integer productImageId) {
			ProductImageId = productImageId;
		}



		public byte[] getM_image() {
			return m_image;
		}



		public void setM_image(byte[] m_image) {
			this.m_image = m_image;
		}



		public List<ListedProduct> getListedProducts() {
			return listedProducts;
		}



		public void setListedProducts(List<ListedProduct> listedProducts) {
			this.listedProducts = listedProducts;
		}



		@Override
		public String toString() {
			return "ProductImage [ProductImageId=" + ProductImageId + ", m_image=" + m_image + "]";
		}





	    
}
