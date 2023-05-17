package com.team5.finalTopic.service.mall;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.persistence.criteria.Predicate;

import com.team5.finalTopic.model.mall.productCategory;
import com.team5.finalTopic.model.member.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import com.team5.finalTopic.controller.mall.ListedProductRepository;
import com.team5.finalTopic.controller.mall.ProductCategoryRepository;
import com.team5.finalTopic.controller.mall.ProductImageRepository;
import com.team5.finalTopic.model.mall.ListedProduct;
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

	public ListedProduct saveListedProduct(ListedProduct product, Member member) throws IOException {
		System.out.println("enter saveListedProduct");
		System.out.println("Time" + product.getListedTime());
		if (product.getImgFile() != null) {
			ProductImage img = new ProductImage();
			img.setM_image(product.getImgFile().getBytes());
			System.out.println("會員id為:"+member.getM_name());
			product.setM_number(member);
			img.setListedProducts(product);
			imageRepository.save(img);
			product.setProductImage(img);

		}
//		if (!memberRepository.existsById(product.getM_number().getM_number())) {
//			memberRepository.save(product.getM_number());
//		}

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
		Page<ListedProduct> page=repository. findListedProductUploadStatus("上架",pageable);
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
			product.setProductCategoryNumber(updatedProduct.getProductCategoryNumber());
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

	public Page<ListedProduct> getProductsByCategory(Integer categoryNum,Pageable pgb) {

		return repository.findListedProductByCategory(categoryNum,pgb);
	}


	public Page<ListedProduct> findByCriteria(Integer pageNumber, String keyword,Integer categoryId) {
		// 判定搜尋方向
//		String sortBy[] = sort.split("_");
//		String orderBy = sortBy[0]; //依甚麼排序
//		Sort.Direction direction;

		//排序方式
//		if (sortBy[1].equals("asc")) {
//			direction = Sort.Direction.ASC;
//		} else {
//			direction = Sort.Direction.DESC;
//		}

		Specification<ListedProduct> spec = (root, query, criteriaBuilder) -> {
			List<Predicate> predicates = new ArrayList<>();
			Predicate p;
			// 判定輸入值是否為空
			if (categoryId!=0) {
				Optional<productCategory> optional = productCategoryRepository.findById(categoryId);
				if (optional.isPresent()){
					productCategory category = optional.get();
					p = criteriaBuilder.equal(root.get("productCategoryNumber"), category);
					predicates.add(p);
				}
				// 查詢相對應種類

			}
			if (!keyword.equals("")) {
				p = criteriaBuilder.like(root.get("productName"), "%" + keyword + "%");
				predicates.add(p);
			}
			p=criteriaBuilder.equal(root.get("productUploadStatus"), "上架");
			predicates.add(p);
			// 將搜尋條件從 list 複製到一空 array
			return criteriaBuilder.and(predicates.toArray(new Predicate[0]));
		};


		// 建立 Pageable 物件帶入傳遞參數
		Pageable pgb = PageRequest.of(pageNumber - 1, 6, Sort.Direction.ASC, "ProductCategoryNumber");

		return repository.findAll(spec, pgb);
	}
}
