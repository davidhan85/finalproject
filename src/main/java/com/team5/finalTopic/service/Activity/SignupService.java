package com.team5.finalTopic.service.Activity;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.team5.finalTopic.model.Activity.SignUp;
import com.team5.finalTopic.model.Activity.SignupRepository;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import ecpay.payment.integration.domain.AioCheckOutDevide;


@Service
public class SignupService {

	public SignupService() {
		
	}
		
		
			
			@Autowired
			private SignupRepository sgnRepository;
			
			public void addSignup(SignUp signup) {
				sgnRepository.save(signup);//新增單筆的進入資料庫
			}
			
			 public List<SignUp> findAll() {
			        return sgnRepository.findAll();
			    }
			
			
			public SignUp findSignUpById(Integer id) {
				Optional<SignUp> option = sgnRepository.findById(id);
				
				if(option.isEmpty()) {
					return null;
				}
				
				return option.get();
			}
			
			public void deleteSignUpById(Integer id) {
				sgnRepository.deleteById(id);
			}
			//Page是繼承Slice，所以有content、pageable這些方法
			public Page<SignUp> findByPage(Integer pageNumber){
				Pageable pgb = PageRequest.of(pageNumber-1, 3, Sort.Direction.DESC, "added");
				Page<SignUp> page = sgnRepository.findAll(pgb);
				return page;
			}
			
			@Transactional
			public SignUp updateById(Integer id, Date newSignUpInfo) {
				Optional<SignUp> option = sgnRepository.findById(id);
				
				if(option.isPresent()) {
					SignUp msg = option.get();
					msg.setSignup_date(newSignUpInfo);//因為自己手動加入所以要加上@Transactional，但是上面的delete不用加上，是因為有繼承了@Tranactional
					return msg;
				}
				return null;
			}
			
			
			
//			public String ecpayCheckout() {
//				
//				String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);
//				
//				AllInOne all = new AllInOne("");
//				
//				AioCheckOutALL obj = new AioCheckOutALL();
//				obj.setMerchantTradeNo(uuId);
//				obj.setMerchantTradeDate("2017/01/01 08:05:23");
//				obj.setTotalAmount("50");
//				obj.setTradeDesc("test Description");
//				obj.setItemName("TestItem");
//				obj.setReturnURL("http://211.23.128.214:5000");
//				obj.setNeedExtraPaidInfo("N");
//				String form = all.aioCheckOut(obj, null);
//				
//				return form;
//			}
			

			
			public String ecpayCheckout() {
				
				String uuId = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 20);
				
				AllInOne all = new AllInOne("");
				
				AioCheckOutALL obj = new AioCheckOutALL();
				obj.setMerchantTradeNo(uuId);// 設定交易編號
				obj.setMerchantTradeDate("2017/01/01 08:05:23");// 設定交易日期時間
				obj.setTotalAmount("50");// 設定交易金額
				obj.setTradeDesc("test Description");// 設定交易描述
				obj.setItemName("TestItem");// 設定商品名稱
				obj.setReturnURL("http://localhost:8079/finalTopic_5/");// 設定付款完成後返回的網址
				obj.setNeedExtraPaidInfo("N");// 設定是否需要額外付款資訊
				String form = all.aioCheckOut(obj, null);// 透過 all.aioCheckOut() 方法獲得表單

				
				return form;
			}
			// 建立 AllInOne 物件
//			AllInOne all = new AllInOne("");
//
//			// 建立 AioCheckOutALL 物件
//			AioCheckOutALL obj = new AioCheckOutALL();
//			obj.setMerchantTradeNo(uuId); // 設定交易編號
//			obj.setMerchantTradeDate("2017/01/01 08:05:23"); // 設定交易日期時間
//			obj.setTotalAmount("50"); // 設定交易金額
//			obj.setTradeDesc("test Description"); // 設定交易描述
//			obj.setItemName("TestItem"); // 設定商品名稱
//			obj.setReturnURL("http://localhost:8079/finalTopic_5/"); // 設定付款完成後返回的網址
//			obj.setNeedExtraPaidInfo("N"); // 設定是否需要額外付款資訊
//
//			// 透過 all.aioCheckOut() 方法獲得表單
//			String form = all.aioCheckOut(obj, null);
//
//			// 解析表單，更新自己的 entity
//			// 假設回傳表單中有 MerchantTradeNo、PayAmt 兩個欄位需要更新
//			Map<String, String> formData = parseFormData(form);
//			String merchantTradeNo = formData.get("MerchantTradeNo"); // 取得交易編號
//			String payAmt = formData.get("PayAmt"); // 取得付款金額
//
//			// 透過交易編號查詢自己的 entity，假設使用 JPA 查詢
//			SignUp signUp = signUpRepository.findByMerchantTradeNo(merchantTradeNo);
//			signUp.setAmounts(Integer.parseInt(payAmt)); // 更新付款金額
//			signUp.setPaystatus("PAID"); // 更新付款狀態為已付款
//			signUpRepository.save(signUp); // 儲存更新後的 entity
//
//			return form;

//			public SignUp getLatest() {
//				return sgnRepository.findFirstByOrderByAddedDesc();
//			}

		}

	


