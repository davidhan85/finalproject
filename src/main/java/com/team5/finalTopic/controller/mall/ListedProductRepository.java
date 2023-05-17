package com.team5.finalTopic.controller.mall;

import java.util.List;

import com.team5.finalTopic.model.mall.productCategory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;

import com.team5.finalTopic.model.mall.ListedProduct;
import org.springframework.data.repository.query.Param;

public interface ListedProductRepository extends JpaRepository<ListedProduct, Integer> , JpaSpecificationExecutor<ListedProduct> {
    @Query("select p from ListedProduct  p")
    List<ListedProduct> getAll();

    @Query("select p from ListedProduct p where p.productName like %:name%")
    List<ListedProduct> findByProductName(@Param("name") String name);

    @Query("select p from ListedProduct p where p.productCategoryNumber.productCategoryNumber =:categoryNum")
    Page<ListedProduct> findListedProductByCategory(@Param("categoryNum")Integer categoryNum, Pageable pgb);

    @Query("SELECT p from ListedProduct p where p.productUploadStatus=:uploadStatus")
    Page<ListedProduct> findListedProductUploadStatus(@Param("uploadStatus") String uploadStatus,Pageable pgb);

}
