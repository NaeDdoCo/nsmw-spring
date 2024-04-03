
CREATE TABLE `MEMBER` ( 
  -- 회원 아이디(영문,숫자만 가능 15자 제한) , 기본키
  `MEMBER_ID` VARCHAR(15) NOT NULL,
  -- 등급 아이디(기본값 1)
  `GRADE_ID` INT NOT NULL DEFAULT 1,
  -- 회원 비밀번호(필수 포함: 영어 대소문자, 숫자, 특수문자 15자 제한)
  `MEMBER_PASSWORD` VARCHAR(15) NOT NULL,
  -- 회원 이름 
  `MEMBER_NAME` VARCHAR(60) NOT NULL,
  -- 생년월일(범위: 만 100세 이하 ~ 만 14세 이상)
  `DAY_OF_BIRTH` DATE NOT NULL,
  -- 성별 (male / female)
  `GENDER` VARCHAR(10) NOT NULL,
  -- 전화번호 (형식: 01012345678)
  `PHONE_NUMBER` VARCHAR(11) NOT NULL,
  -- 이메일 (형식: example@example.com)
  `EMAIL` VARCHAR(255) NOT NULL,
  -- 권한 (USER / ADMIN)
  `AUTHORITY` VARCHAR(7) NOT NULL DEFAULT 'USER',
  -- 탈퇴 여부 (JOIN / LEAVE)
  `MEMBER_STATE` VARCHAR(7) NOT NULL DEFAULT 'JOIN',
  PRIMARY KEY (`MEMBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `KAKAO_MEMBER` (
  -- 카카오 아이디 (ex 123456789), 기본키
  `KAKAO_ID` VARCHAR(50) NOT NULL,
  -- 회원 아이디
  `MEMBER_ID` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`KAKAO_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `GRADE` (
  -- 등급 아이디, 기본키(ex.1,2,3)
  `GRADE_ID` INT NOT NULL AUTO_INCREMENT,
  -- 등급 이름(씨앗,새싹,나무)
  `GRADE_NAME` VARCHAR(30) NOT NULL ,
  -- 최솟값
  `LOWER_LIMIT` INT NOT NULL,
  -- 최댓값
  `UPPER_LIMIT` INT NOT NULL,
  PRIMARY KEY (`GRADE_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `PRODUCT` (
  -- 상품 아이디, 기본키
  `PRODUCT_ID` INT NOT NULL AUTO_INCREMENT,
  -- 상품명
  `PRODUCT_NAME` VARCHAR(60) NOT NULL,
  -- 상품상세
  `PRODUCT_DETAIL` VARCHAR(500) NOT NULL,
  -- 원가
  `COST_PRICE` INT NOT NULL , 
  -- 소비자 가격
  `RETAIL_PRICE` INT NOT NULL ,
  -- 판매 가격
  `SALE_PRICE` INT NOT NULL ,
  -- 상품 재고
  `STOCK` INT NOT NULL DEFAULT 10,
  -- 상품 성분
  `INGREDIENT` VARCHAR(300) NOT NULL,
  -- 상품 용법
  `DOSAGE` VARCHAR(300) NOT NULL DEFAULT '1일 2회, 1회 2정 섭취',
  -- 소비기한
  `EXPIRATION_DATE` VARCHAR(75) NOT NULL DEFAULT '제조일로부터 24개월',
  -- 상품 등록일
  `REGISTER_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  -- 상품 변경일 (기본값: 현재시간)
  `MODIFY_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  -- 상품 판매 상태 (기본값: 현재시간)
  `SALE_STATE` VARCHAR(15) NOT NULL DEFAULT 'SALES',
  PRIMARY KEY (`PRODUCT_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `CART` (
  -- 장바구니 아이디, 기본키
  `CART_ID` INT NOT NULL AUTO_INCREMENT,
  -- 회원 아이디
  `MEMBER_ID` VARCHAR(15) NOT NULL,
  -- 상품 아이디
  `PRODUCT_ID` INT NOT NULL,
  -- 담긴 수량
  `PRODUCT_QUANTITY` INT NOT NULL,
  PRIMARY KEY (`CART_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `BUY_INFO` (
  -- 구매 내역 아이디, 기본키
  `BUY_INFO_ID` INT NOT NULL AUTO_INCREMENT,
  -- 회원 아이디
  `MEMBER_ID` VARCHAR(15) NOT NULL,
  -- 구매일
  `BUY_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  -- 배송지 우편번호
  `DELIVERY_POSTCODE` INT NOT NULL,
  -- 배송지 주소
  `DELIVERY_ADDRESS` VARCHAR(255) NOT NULL,
  -- 배송지 상세주소
  `DELIVERY_DETAIL_ADDRESS` VARCHAR(255) NOT NULL,
  -- 주문 상태
  `ORDER_STATE` VARCHAR(12) NOT NULL DEFAULT 'PAY',
  PRIMARY KEY (`BUY_INFO_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `ORDER_INFO` (
  -- 주문 아이디, 기본키
  `ORDER_INFO_ID` INT NOT NULL AUTO_INCREMENT,
  -- 구매 내역 아이디
  `BUY_INFO_ID` INT NOT NULL,
  -- 상품 아이디
  `PRODUCT_ID` INT NOT NULL,
  -- 회원 쿠폰 아이디
  `MEMBER_COUPON_ID` INT,
  -- 구매 수량
  `BUY_QUANTITY` INT NOT NULL,
  -- 결제 금액
  `PAYMENT_PRICE` INT NOT NULL,
  -- 리뷰 작성 여부
  `HAS_REVIEW` INT NOT NULL DEFAULT 0,
  PRIMARY KEY (`ORDER_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `SHIPPING_ADDRESS` (
  -- 배송지 아이디, 기본키
  `SHIPPING_ADDRESS_ID` INT NOT NULL AUTO_INCREMENT,
  -- 회원 아이디
  `MEMBER_ID` VARCHAR(15) NOT NULL,
  -- 기본 배송지 (1부터 시작, 가장 큰숫자가 기본 배송지)
  `SHIPPING_DEFAULT` INT NOT NULL ,
  -- 배송지 이름
  `SHIPPING_ADDRESS_NAME` VARCHAR(30) NOT NULL,
  -- 배송지 우편번호 (범위: 01000~63999)
  `SHIPPING_POSTCODE` INT NOT NULL,
  -- 배송지 주소
  `SHIPPING_ADDRESS` VARCHAR(255) NOT NULL,
  -- 배송지 상세주소
  `SHIPPING_DETAIL_ADDRESS` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`SHIPPING_ADDRESS_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;


CREATE TABLE `IMAGE` (
  -- 이미지 아이디, 기본키
  `IMAGE_ID` INT NOT NULL AUTO_INCREMENT,
  -- 이미지 경로
  `IMAGE_PATH` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`IMAGE_ID`)
)ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `REVIEW` (
  -- 리뷰 아이디, 기본키
  `REVIEW_ID` INT NOT NULL AUTO_INCREMENT,
  -- 구매 내역 아이디
  `BUY_INFO_ID` INT NOT NULL,
  -- 별점
  `SCORE` INT NOT NULL,
  -- 내용
  `CONTENT` VARCHAR(1500) NOT NULL,
  -- 작성일
  `WRITE_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`REVIEW_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `PRODUCT_IMAGE` (
  -- 상품 이미지 아이디, 기본키
  `PRODUCT_IMAGE_ID` INT NOT NULL AUTO_INCREMENT,
  -- 이미지 아이디
  `IMAGE_ID` INT NOT NULL,
  -- 상품 아이디
  `PRODUCT_ID` INT NOT NULL,
  PRIMARY KEY (`PRODUCT_IMAGE_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `REVIEW_IMAGE` (
  -- 리뷰 이미지 아이디, 기본키
  `REVIEW_IMAGE_ID` INT NOT NULL AUTO_INCREMENT,
  -- 이미지 아이디
  `IMAGE_ID` INT NOT NULL,
  -- 리뷰 아이디
  `REVIEW_ID` INT NOT NULL,
  PRIMARY KEY (`REVIEW_IMAGE_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE `PROVISION_BATCH_COUPON` (
  -- 쿠폰 전체 발송 아이디, 기본키
  `PROVISION_BATCH_COUPON_ID` INT NOT NULL AUTO_INCREMENT,
  -- 쿠폰 아이디
  `COUPON_ID` INT NOT NULL,
  -- 배포 상태
  `DEPLOY_STATUS` VARCHAR(9) NOT NULL DEFAULT 'WILL',
  PRIMARY KEY (`PROVISION_BATCH_COUPON_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `PROVISION_DOWNLOAD_COUPON` (
  -- 쿠폰 다운로드 아이디, 기본키
  `PROVISION_DOWNLOAD_COUPON_ID` INT NOT NULL AUTO_INCREMENT,
  -- 쿠폰 아이디
  `COUPON_ID` INT NOT NULL,
  -- 이미지 아이디
  `IMAGE_ID` INT NOT NULL,
  -- 배포 마감일
  `DEPLOY_DEADLINE` DATETIME NOT NULL,
  -- 배포 상태
  `DEPLOY_STATUS` VARCHAR(9) NOT NULL DEFAULT 'WILL',
  PRIMARY KEY (`PROVISION_DOWNLOAD_COUPON_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `PROVISION_GRADE_COUPON` (
  -- 등급별 쿠폰 아이디, 기본키
  `PROVISION_GRADE_COUPON_ID` INT NOT NULL AUTO_INCREMENT,
  -- 등급 아이디
  `GRADE_ID` INT NOT NULL,
  -- 쿠폰 아이디
  `COUPON_ID` INT NOT NULL,
  -- 지급 주기
  `DEPLOY_CYCLE` VARCHAR(5) NOT NULL,
  -- 지급 기준
  `DEPLOY_BASE` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`PROVISION_GRADE_COUPON_ID`),
  FOREIGN KEY (`COUPON_ID`) REFERENCES `COUPON` (`COUPON_ID`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `COUPON` (
  -- 쿠폰 아이디, 기본키
  `COUPON_ID` INT NOT NULL AUTO_INCREMENT,
  -- 쿠폰명
  `COUPON_NAME` VARCHAR(75) NOT NULL,
  -- 쿠폰 생성일
  `CREATE_DATE` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  -- 쿠폰 배포일
  `DISTRIBUTE_DATE` DATETIME DEFAULT NULL,
  -- 쿠폰 만료일
  `EXPIRATION_DATE` DATETIME NOT NULL,
  -- 쿠폰 종류
  `COUPON_TYPE` VARCHAR(10) NOT NULL DEFAULT 'WON',
  PRIMARY KEY (`COUPON_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `MEMBER_COUPON` (
  -- 인조 식별자, 기본키
  `MEMBER_COUPON_ID` INT NOT NULL AUTO_INCREMENT,
  -- 회원 아이디
  `MEMBER_ID` VARCHAR(15) NOT NULL,
  -- 쿠폰 아이디
  `COUPON_ID` INT NOT NULL,
  -- 사용 여부
  `COUPON_USAGE` VARCHAR(10) NOT NULL DEFAULT 'UNUSE',
  PRIMARY KEY (`MEMBER_COUPON_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `PERCENTAGE_COUPON` (
  -- 퍼센트 쿠폰 타입 아이디, 기본키
  `PERCENTAGE_COUPON_ID` INT NOT NULL AUTO_INCREMENT,
  -- 쿠폰 아이디
  `COUPON_ID` INT NOT NULL,
  -- 할인율
  `COUPON_DISCOUNT_RATE` INT NOT NULL,
  -- 최대 할인 금액
  `MAX_DISCOUNT_AMOUNT` INT NOT NULL,
  PRIMARY KEY (`PERCENTAGE_COUPON_ID`),
  FOREIGN KEY (`COUPON_ID`) REFERENCES `COUPON` (`COUPON_ID`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `WON_COUPON` (
  -- 원화 쿠폰 타입 아이디, 기본키
  `WON_COUPON_ID` INT NOT NULL AUTO_INCREMENT,
  -- 쿠폰 아이디
  `COUPON_ID` INT NOT NULL,
  -- 할인액
  `COUPON_DISCOUNT_AMOUNT` INT NOT NULL,
  -- 최소 구매 금액
  `MIN_ORDER_AMOUNT` INT NOT NULL,
  PRIMARY KEY (`WON_COUPON_ID`),
  FOREIGN KEY (`COUPON_ID`) REFERENCES `COUPON` (`COUPON_ID`) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;


CREATE TABLE `CATEGORY` (
  -- 카테고리 아이디, 기본키
  `CATEGORY_ID` INT NOT NULL AUTO_INCREMENT,
  -- 카테고리 이름
  `CATEGORY_NAME` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`CATEGORY_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `COUPON_CATEGORY` (
  -- 인조 식별자 , 기본키
  `COUPON_CATEGORY_ID` INT NOT NULL AUTO_INCREMENT,
  -- 쿠폰 아이디
  `COUPON_ID` INT NOT NULL,
  -- 카테고리 아이디
  `CATEGORY_ID` INT NOT NULL,
  PRIMARY KEY (`COUPON_CATEGORY_ID`),
  FOREIGN KEY (COUPON_ID) REFERENCES COUPON(COUPON_ID) ON DELETE CASCADE
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `MEMBER_CATEGORY` (
  -- 인조 식별자, 기본키
  `MEMBER_CATEGORY_ID` INT NOT NULL AUTO_INCREMENT,
  -- 카테고리 아이디
  `CATEGORY_ID` INT NOT NULL,
  -- 회원 아이디
  `MEMBER_ID` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`MEMBER_CATEGORY_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `PRODUCT_CATEGORY` (
  -- 인조 식별자, 기본키
  `PRODUCT_CATEGORY_ID` INT NOT NULL AUTO_INCREMENT,
  -- 상품 아이디
  `PRODUCT_ID` INT NOT NULL,
  -- 카테고리 아이디
  `CATEGORY_ID` INT NOT NULL,
  PRIMARY KEY (`PRODUCT_CATEGORY_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;


CREATE TABLE `DAILY_SALES_STATS` (
  -- 일 매출 아이디, 기본키
  `DAILY_SALES_STATS_ID` INT NOT NULL AUTO_INCREMENT,
  -- 통계 일
  `DAILY_TOTAL_CALCULATE_DATE` DATE NOT NULL,
  -- 매출
  `DAILY_TOTAL_GROSS_MARGINE` INT NOT NULL,
  -- 이익 = 매출 - 원가
  `DAILY_TOTAL_NET_PROFIT` INT NOT NULL,
  PRIMARY KEY (`DAILY_SALES_STATS_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `DAILY_PRODUCT_SALES_STATS` (
  -- 일별 상품 통계 아이디, 기본키
  `DAILY_PRODUCT_SALES_STATS_ID` INT NOT NULL AUTO_INCREMENT,
  -- 상품 아이디
  `PRODUCT_ID` INT NOT NULL,
  -- 통계 일
  `DAILY_TOTAL_CALCULATE_DATE` DATE NOT NULL,
  -- 총 수량
  `DAILY_TOTAL_QUANTITY` INT NOT NULL,
  -- 매출
  `DAILY_TOTAL_GROSS_MARGINE` INT NOT NULL,
  -- 이익 = 매출 - 원가
  `DAILY_TOTAL_NET_PROFIT` INT NOT NULL,
  PRIMARY KEY (`DAILY_PRODUCT_SALES_STATS_ID`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4;

CREATE TABLE `MONTHLY_SALES_STATS` (
  -- 월 매출 아이디, 기본키
  `MONTHLY_SALES_STATS_ID` INT NOT NULL AUTO_INCREMENT,
  -- 통계 월
  `MONTHLY_TOTAL_CALCULATE_DATE` DATE NOT NULL,
  -- 매출
  `MONTHLY_TOTAL_GROSS_MARGINE` INT NOT NULL,
  -- 이익 = 매출 - 원가
  `MONTHLY_TOTAL_NET_PROFIT` INT NOT NULL,
  PRIMARY KEY (`MONTHLY_SALES_STATS_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `MONTHLY_PRODUCT_SALES_STATS` (
  -- 월별 상품 통계 아이디, 기본키
  `MONTHLY_PRODUCT_SALES_STATS_ID` INT NOT NULL AUTO_INCREMENT,
  -- 상품 아이디
  `PRODUCT_ID` INT NOT NULL,
  -- 통계 월
  `MONTHLY_TOTAL_CALCULATE_DATE` DATE NOT NULL,
  -- 총 수량
  `MONTHLY_TOTAL_QUANTITY` INT NOT NULL,
  -- 매출
  `MONTHLY_TOTAL_GROSS_MARGINE` INT NOT NULL,
  -- 이익 = 매출 - 원가
  `MONTHLY_TOTAL_NET_PROFIT` INT NOT NULL,
  PRIMARY KEY (`MONTHLY_PRODUCT_SALES_STATS_ID`)
) ENGINE = InnoDB DEFAULT CHARACTER SET = utf8mb4;

CREATE TABLE `SUBSCRIPTION_POLICY` (
  -- 월 매출 아이디, 기본키
  `SUBSCRIPTION_POLICY_ID` INT NOT NULL AUTO_INCREMENT,
  -- 등급 산정 최솟값
  `LOWER_LIMIT_MONTH` INT NOT NULL,
  -- 등급 산정 최댓값
  `UPPER_LIMIT_MONTH` INT NOT NULL,
  -- 할인율
  `DISCOUNT_RATE` INT NOT NULL,
  PRIMARY KEY (`SUBSCRIPTION_POLICY_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `SUBSCRIPTION_INFO` (
  -- 구독 정보 아이디, 기본키
  `SUBSCRIPTION_INFO_ID` INT NOT NULL AUTO_INCREMENT,
  -- 회원 아이디
  `MEMBER_ID` VARCHAR(15) NOT NULL,
  -- 구독 시작일
  `BEGIN_DATE` DATETIME NOT NULL,
  -- 구독 회차
  `SUBSCRIPTION_TIMES` INT NOT NULL,
  -- 다음 결제일
  `NEXT_PAYMENT_DATE` DATETIME NOT NULL,
  -- 배송지 우편번호
  `SUBSCRIPTION_POSTCODE` INT NOT NULL,
  -- 배송지 주소
  `SUBSCRIPTION_ADDRESS` VARCHAR(255) NOT NULL,
  -- 배송지 상세주소
  `SUBSCRIPTION_DETAIL_ADDRESS` VARCHAR(255) NOT NULL,
  -- 구독 마감 회차
  `SUBSCRIPTION_CLOSING_TIMES` INT NOT NULL,
  PRIMARY KEY (`SUBSCRIPTION_INFO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE `SUBSCRIPTION_INFO_PRODUCT` (
  -- 구독 정보 상품 아이디, 기본키
  `SUBSCRIPTION_INFO_PRODUCT_ID` INT NOT NULL AUTO_INCREMENT,
  -- 구독 정보 아이디
  `SUBSCRIPTION_INFO_ID` INT DEFAULT NULL,
  -- 상품 아이디
  `PRODUCT_ID` INT DEFAULT NULL,
  -- 구독 수량
  `QUANTITY` INT DEFAULT NULL,
  -- 할인율
  `PURCHASE_PRICE` INT DEFAULT NULL,
  PRIMARY KEY (`SUBSCRIPTION_INFO_PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;