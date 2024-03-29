package com.naeddoco.nsmwspring.model.couponModel;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CouponDTO {
	
	private int couponID; 				// 쿠폰 아이디
	private String couponName; 			// 쿠폰명
	private Timestamp createDate;		// 쿠폰 생성일
	private Timestamp distributeDate; 	// 쿠폰 배포일
	private Timestamp expirationDate; 	// 쿠폰 만료일
	private String couponType; 			// 쿠폰 종류
	
    private String searchCondition; 	// 쿼리 분기 지정
    
    									// FK
    private String ancCategoryName;     // 쿠폰 카테고리 
    private int ancDiscountAmount;      // 원쿠폰 할인액
    private int ancMinOrderAmount;      // 원쿠폰 최소 구매 금액
    private int ancDiscountRate;        // 퍼센트쿠폰 할인율
    private int ancMaxDiscountAmount;   // 퍼센트쿠폰 최대 할인 금액
    
	private String ancDeployCycle;		// 지급 주기
	private String ancDeployBase;		// 지급 기준
	
	private int ancDiscount;			// 할인액 or 할인율 
	private int ancAmount;				// 최소 구매 금액 or 최대 할인 금액
	
	private String ancGradeName;		// 등급 이름
	
	private String ancSearchKeyword;	// 검색 키워드
	private String ancSortColumnName;	// 정렬 키워드
	
	
    @Override
   	public String toString() {
   		
   		return "CouponDTO [" + 
   			   "couponID = " + couponID + ", " + 
   			   "couponName = " + couponName + ", " +
   			   "createDate = " + createDate + ", " +
   			   "distributeDate = " + distributeDate + ", " +
   			   "expirationDate = " + expirationDate + ", " +
   			   "couponType = " + couponType + ", " +
   			   "ancCategoryName = " + ancCategoryName + ", " +
   			   "ancDiscountAmount = " + ancDiscountAmount + ", " +
   			   "ancMinOrderAmount = " + ancMinOrderAmount + ", " +
   			   "ancDiscountRate = " + ancDiscountRate + ", " +
   			   "ancMaxDiscountAmount = " + ancMaxDiscountAmount +
   			   "]";
   				
   	}
    
}