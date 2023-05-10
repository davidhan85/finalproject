package com.team5.finalTopic.service.mall;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import javax.persistence.Transient;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.team5.finalTopic.controller.mall.ListedProductRepository;
import com.team5.finalTopic.controller.mall.ProductCategoryRepository;
import com.team5.finalTopic.controller.mall.ProductImageRepository;
import com.team5.finalTopic.model.mall.ListedProduct;
import com.team5.finalTopic.model.mall.ProductCategory;
import com.team5.finalTopic.model.mall.ProductImage;
import com.team5.finalTopic.model.member.MemberRepository;

@Service
public class ListedProductService {

	@Autowired
	private ListedProductRepository repository;

	@Autowired
	private MemberRepository memberRepository;

	@Autowired
	private ProductImageRepository imageRepository;

	@Autowired
	private ProductCategoryRepository productCategoryRepository;

	public ListedProduct saveListedProduct(ListedProduct product) throws IOException {
		System.out.println("enter saveListedProduct");
		System.out.println("Time" + product.getListedTime());
		if (product.getImgFile() != null) {
			ProductImage img = new ProductImage();
			img.setM_image(product.getImgFile().getBytes());
			img.setListedProducts(product);
			imageRepository.save(img);
			product.setProductImage(img);
		}
		if (!memberRepository.existsById(product.getM_number().getM_number())) {
			memberRepository.save(product.getM_number());
		}
		System.out.println("save");
		return repository.save(product);
	}

	public ListedProduct getListedProductById(Integer id) {
		return repository.findById(id).orElse(null);
	}

	public List<ListedProduct> getAllListedProducts() {
		return repository.findAll();
	}

	public void deleteListedProductById(Integer id) {
		Optional<ListedProduct> productOptional = repository.findById(id);
		if (productOptional.isPresent()) {
			ListedProduct product = productOptional.get();
			if (product.getProductImage() != null) {
				imageRepository.deleteById(product.getProductImage().getProductImageId());
			}

		}
	}

	public byte[] getProductImageById(Integer productImageId) {
		Optional<ProductImage> productImageOptional = imageRepository.findById(productImageId);
		if (productImageOptional.isPresent()) {
			return productImageOptional.get().getM_image();
		}
		return null;
	}

	public List<ListedProduct> getAll() {
//		List<ListedProduct> products = repository.getAll();
		List<ListedProduct> products=repository.findAll();
		return products;
	}

	public Page<ListedProduct> pageGetAll(Pageable pageable) {
		Page<ListedProduct> page=repository.findAll(pageable);
		return page;
	}


	public ListedProduct updateListedProduct(Integer id, ListedProduct updatedProduct) throws IOException {
		Optional<ListedProduct> optional = repository.findById(id);
		if (optional.isPresent()) {
			ListedProduct product = optional.get();
			product.setProductName(updatedProduct.getProductName());
			product.setProductDescription(updatedProduct.getProductDescription());
			product.setUnitPrice(updatedProduct.getUnitPrice());
			product.setProductQuantity(updatedProduct.getProductQuantity());
			product.setProductUploadStatus(updatedProduct.getProductUploadStatus());
			product.setProductCategorynumber(updatedProduct.getProductCategorynumber());
			ProductImage image = imageRepository.findImage(id);
			if (image != null) {
				System.out.println("image.getProductImageId:"+image.getProductImageId());
				image.setM_image(updatedProduct.getImgFile().getBytes());
			}
//			ProductImage image=new ProductImage();
//			image.setM_image(updatedProduct.getImgFile().getBytes());
//			product.setProductImage(image);	
			repository.save(product);
			return product;

		}

		return null;
	}

}
