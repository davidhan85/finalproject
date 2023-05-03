package com.team5.finalTopic.service.mall;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
		List<ListedProduct> products = new ArrayList<>();
		if (product.getImgFile() != null) {
			ProductImage img = new ProductImage();
			img.setM_image(product.getImgFile().getBytes());
			products.add(product);
			img.setListedProducts(products);
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
			repository.deleteById(id);
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

		List<ListedProduct> products = repository.getAll();
		for (ListedProduct product : products) {
			Hibernate.initialize(product.getImgFile());
		}
		return products;
	}

	public ListedProduct updateListedProduct(Integer id, ListedProduct updatedProduct) throws IOException {
		return repository.findById(id).map(product -> {

			product.setProductName(updatedProduct.getProductName());
			product.setProductCategorynumber(updatedProduct.getProductCategorynumber());
			product.setProductDescription(updatedProduct.getProductDescription());
			product.setUnitPrice(updatedProduct.getUnitPrice());
			product.setProductQuantity(updatedProduct.getProductQuantity());
			product.setProductUploadStatus(updatedProduct.getProductUploadStatus());

			ProductCategory pro=null;
			if (updatedProduct.getProductCategorynumber().getProductCategorynumber()!=0) {
				pro=productCategoryRepository.findById(updatedProduct.getProductCategorynumber().getProductCategorynumber()).orElse(null);
}

			
			product.setProductCategorynumber(pro);
			
			if (updatedProduct.getImgFile() != null) {
				ProductImage img = new ProductImage();
				try {
					img.setM_image(updatedProduct.getImgFile().getBytes());
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				img.setListedProducts(Collections.singletonList(product));
				imageRepository.save(img);
				product.setProductImage(img);
			}

			return repository.save(product);
		}).orElseThrow(() -> new RuntimeException("Product not found with id " + id));
	}

}
