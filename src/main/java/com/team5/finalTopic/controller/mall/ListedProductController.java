package com.team5.finalTopic.controller.mall;


import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.team5.finalTopic.model.mall.ListedProduct;
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
		System.out.println(product.getProductCategoryNumber());
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

	@GetMapping("/listedProducts")   //取得所有商品後台
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

	@GetMapping(value = "/editListedProducts/{ProductId}")  //編輯取得id
	public String showEditForm(@PathVariable("ProductId") Integer id, Model model) {
        ListedProduct productbyId = service.getListedProductById(id);
        model.addAttribute("listedProduct", productbyId);
        return "mall/editProduct";
    }
	
	@PutMapping (value = "/updateListedProducts/{id}")  //透過抓取id並更新
	public String updateProduct(@PathVariable("id") Integer id , ListedProduct ListedProduct) throws IOException{
		ListedProduct ListedProduct1 = service.updateListedProduct(id,ListedProduct);// 取得MultipartFile，把圖片以byte[]型態塞進DB
//		service.saveListedProduct(ListedProduct1);
		return "redirect:/listedProducts";
	}

//	@GetMapping("/CategoryProduct")
//	public ResponseEntity<Page<ListedProduct>> filterProducts(@RequestParam(name = "ProductCategorynumber",required = false) Integer categoryNum,Pageable pgb) {
//		System.out.println("categoryNum:"+categoryNum);
//		Page<ListedProduct> filteredProducts = service.getProductsByCategory(categoryNum,pgb);
//		return ResponseEntity.ok(filteredProducts);
//	}
	@GetMapping("/AllProduct")   //取得所有全部商品頁面
	public String getAllProducts(Model model, @RequestParam(name = "p",defaultValue = "1") int page) {
		System.out.println("pageNum"+page);
		Pageable pageable = PageRequest.of(page-1, 6, Sort.Direction.ASC, "listedTime"); // 每頁顯示 筆資料
		Page<ListedProduct> pPage = service.pageGetAll(pageable);
		model.addAttribute("pPage", pPage);

		return "/mall/ShowAllProductFront";
	}

	@ResponseBody
	@GetMapping("/front/product/list")//商品列表多條件搜尋
	public Map<String, Object> searchProductNameApi(@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword,
													@RequestParam(name = "page", defaultValue = "1") Integer pageNum,
//													@RequestParam(name = "sort", defaultValue = "productId_asc") String sort,
													@RequestParam(name = "category") Integer category) {
        System.out.println("categoryjsp"+category);
		Page<ListedProduct> products;
		Map<String, Object> response = new HashMap<>();
		products = service.findByCriteria(pageNum, keyword, category);
//		response.put("categoryList", service.findAllCategories());
		response.put("pageNum", pageNum);
		response.put("keyword", keyword);
		response.put("products", products);

		return response;
	}



	@GetMapping(value = "/ProductDetail/{ProductId}")  //
	public String showProductNum(@PathVariable("ProductId") Integer id, Model model) {
		ListedProduct productbyId = service.getListedProductById(id);
		model.addAttribute("listedProduct", productbyId);
		return "mall/productDetail";
	}


}

