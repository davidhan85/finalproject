package com.team5.finalTopic.controller.mall;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.team5.finalTopic.model.mall.ListedProduct;
import org.springframework.data.repository.query.Param;

public interface ListedProductRepository extends JpaRepository<ListedProduct, Integer> {
    @Query("select p from ListedProduct  p")
    List<ListedProduct> getAll();

    @Query("select p from ListedProduct p where p.productName like %:name%")
    List<ListedProduct> findByProductName(@Param("name") String name);

    @Query("select p from ListedProduct p where p.ProductCategorynumber.ProductCategorynumber =:categoryNum")
    Page<ListedProduct> findListedProductByCategory(@Param("categoryNum")Integer categoryNum, Pageable pgb);
}