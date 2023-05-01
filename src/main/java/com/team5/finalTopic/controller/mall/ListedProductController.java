package com.team5.finalTopic.controller.mall;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.team5.finalTopic.model.mall.ListedProduct;
import com.team5.finalTopic.model.mall.ProductCategory;
import com.team5.finalTopic.service.mall.ListedProductService;
import com.team5.finalTopic.service.mall.ProductCategoryService;

@Controller
public class ListedProductController {

	@Autowired
	private ListedProductService service;
	
	@Autowired
	private ProductCategoryService productCategoryService;

	@PostMapping("/Insertproduct")  //新增
	public String addListedProduct(@ModelAttribute("listedProduct") ListedProduct product) {
		System.out.println(product);
		System.out.println("enter addListedProduct");
		System.out.println(product.getProductCategorynumber());
		try {
			service.saveListedProduct(product);
		} catch (IOException e) {

			e.printStackTrace();
		}
		System.out.println("return");
		return "redirect:/listedProducts";
	}

	@GetMapping("/listedProducts/{id}") //透過id取得
	public ListedProduct getListedProductById(@PathVariable Integer id) {
		if (id == null) {
			throw new IllegalArgumentException("Id must not be null");
		}
		return service.getListedProductById(id);
	}

	@GetMapping("/listedProducts")   //取得所有
	public String getAllListedProducts(Model model) {
		List<ListedProduct> pList = service.getAll();
		model.addAttribute("pList", pList);
		return "/mall/ShowAllProduct";
	}

	@GetMapping("/ProductImage/{ProductImageId}")  //圖片
	public ResponseEntity<byte[]> getImage(@PathVariable("ProductImageId") Integer ProductImageId) {
		try {
			byte[] image = service.getProductImageById(ProductImageId);
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.IMAGE_JPEG);
			headers.setContentLength(image.length);
			return new ResponseEntity<>(image, headers, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}

	}

	@DeleteMapping("/listedProducts/{id}")  //刪除
	public String deleteListedProduct(@PathVariable Integer id) {
		if (id == null) {
			throw new IllegalArgumentException("Id must not be null");
		}
		service.deleteListedProductById(id);
		return "redirect:/listedProducts";
	}

//	@GetMapping("/editListedProducts")
//	public String editPage(@RequestParam("ProductId") Integer id, Model model) {
//		ListedProduct product = service.getListedProductById(id);
//		model.addAttribute("product", product);
//		
//		return "mall/editProduct";
//	}
	
//	@GetMapping("/editListedProducts")
//	public String editListedProduct(@RequestParam("ProductId") Integer productId, Model model) {
//	    ListedProduct product = service.getListedProductById(productId);
//	    List<ProductCategory> categories = productCategoryService.findAll();
//	    model.addAttribute("product", product);
//	    model.addAttribute("productCategories", categories);
//	    return "mall/editProduct";
//	}
	@GetMapping("/editListedProducts/{id}")
	public String showEditForm(@PathVariable("id") Integer id, Model model) {
        ListedProduct product = service.getListedProductById(id);
        model.addAttribute("product", product);
        return "mall/editProduct";
    }


	@PutMapping("/editListedProducts/{id}")
	public String updateListedProduct(@PathVariable("id") Integer id,
			@ModelAttribute("product") ListedProduct updatedProduct) {
		try {
			service.updateListedProduct(id, updatedProduct);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return "redirect:/listedProducts";
	}

}
