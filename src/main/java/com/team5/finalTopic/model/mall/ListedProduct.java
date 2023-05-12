package com.team5.finalTopic.model.mall;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name = "ListedProduct")
public class ListedProduct {

	
	@ManyToOne
	@JoinColumn(name = "member_number",nullable = false)  //會員編號
	private Member m_number;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	@Column(name = "ProductId",nullable = false) // 產品編號
	private Integer productId;

	@Temporal(TemporalType.TIMESTAMP) // 上架日子時間
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(columnDefinition = "datetime", name = "listedTime",nullable = false)
	private Date listedTime;

	@Column(name = "ProductName", columnDefinition = "nvarchar(Max)", nullable = false) // 產品名稱
	private String productName;

	@ManyToOne
	@JoinColumn(name = "productCategoryNumber", referencedColumnName = "productCategoryNumber",nullable = false) // 產品分類
	private productCategory productCategoryNumber;

	@Column(name = "ProductDescription", columnDefinition = "nvarchar(Max)", nullable = false) // 產品描述
	private String productDescription;

	@Column(name = "UnitPrice",nullable = false) // 產品價格
	private Integer unitPrice;

	@Column(name = "ProductQuantity",nullable = false) // 產品數量
	private Integer productQuantity;

	@Column(name = "ProductUploadStatus",nullable = false) // 產品狀態
	private String productUploadStatus;

	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ProductImageId") // 產品圖片
	@JsonIgnoreProperties("listedProducts")
	private ProductImage productImage;

	 @Transient
	    private MultipartFile imgFile;
	 
	 @PrePersist
	    public void onCreate() {
	        if (listedTime == null) {
	        	listedTime = new Date();
	        }
	    }

	public MultipartFile getImgFile() {
		return imgFile;
	}

	public void setImgFile(MultipartFile imgFile) {
		this.imgFile = imgFile;
	}

	public Integer getProductId() {
		return productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Member getM_number() {
		return m_number;
	}

	public void setM_number(Member m_number) {
		this.m_number = m_number;
	}

	public Date getListedTime() {
		return listedTime;
	}

//	public ProductCategory getProductCategorynumber() {
//		return ProductCategorynumber;
//	}
//
//	public void setProductCategorynumber(ProductCategory productCategorynumber) {
//		ProductCategorynumber = productCategorynumber;
//	}


	public productCategory getProductCategoryNumber() {
		return productCategoryNumber;
	}

	public void setProductCategoryNumber(productCategory productCategorynumber) {
		this.productCategoryNumber = productCategorynumber;
	}

	public void setListedTime(Date listedTime) {
		this.listedTime = listedTime;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public Integer getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Integer unitPrice) {
		this.unitPrice = unitPrice;
	}

	public Integer getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(Integer productQuantity) {
		this.productQuantity = productQuantity;
	}

	public String getProductUploadStatus() {
		return productUploadStatus;
	}

	public void setProductUploadStatus(String productUploadStatus) {
		this.productUploadStatus = productUploadStatus;
	}


	public ProductImage getProductImage() {
		return productImage;
	}

	public void setProductImage(ProductImage productImage) {
		this.productImage = productImage;
	}

	@Override
	public String toString() {
		return "ListedProduct [member=" + m_number + ", ProductId=" + productId + ", listedTime=" + listedTime
				+ ", productName=" + productName + ", ProductCategorynumber=" + productCategoryNumber + ", productDescription="
				+ productDescription + ", unitPrice=" + unitPrice + ", productQuantity=" + productQuantity
				+ ", productUploadStatus=" + productUploadStatus + ", ProductImage=" + productImage + "]";
	}

}
