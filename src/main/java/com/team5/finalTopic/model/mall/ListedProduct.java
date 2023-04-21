package com.team5.finalTopic.model.mall;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import com.team5.finalTopic.model.member.Member;

@Entity
@Table(name = "ListedProduct")
public class ListedProduct {

	
	@ManyToOne
	@JoinColumn(name = "member_number")  //會員編號
	private Member member;

	@Id
	@Column(name = "ProductId") // 產品編號
	private Integer ProductId;

	@Temporal(TemporalType.TIMESTAMP) // 上架日子時間
	@DateTimeFormat(pattern = "yyyy/MM/dd HH:mm:ss")
	@Column(columnDefinition = "datetime", name = "listedTime")
	private Date listedTime;

	@Column(name = "ProductName", columnDefinition = "nvarchar(Max)", nullable = false) // 產品名稱
	private String productName;

	@ManyToOne
	@JoinColumn(name = "ProductCategorynumber", referencedColumnName = "ProductId") // 產品分類
	private ProductCategory productCategory;

	@Column(name = "ProductDescription", columnDefinition = "nvarchar(Max)", nullable = false) // 產品描述
	private String productDescription;

	@Column(name = "UnitPrice") // 產品價格
	private Integer unitPrice;

	@Column(name = "ProductQuantity") // 產品數量
	private Integer productQuantity;

	@Column(name = "ProductUploadStatus") // 產品狀態
	private String productUploadStatus;

	@OneToOne
	@JoinColumn(name = "ProductImage", referencedColumnName = "ProductId") // 產品圖片
	private ProductImage productImage;

}
