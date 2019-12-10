-- 회원
DROP TABLE IF EXISTS member RESTRICT;

-- 반려동물 정보
DROP TABLE IF EXISTS pet RESTRICT;

-- 상품
DROP TABLE IF EXISTS product RESTRICT;

-- 레시피
DROP TABLE IF EXISTS recipe RESTRICT;

-- 레시피댓글
DROP TABLE IF EXISTS recipe_comment RESTRICT;

-- 후기
DROP TABLE IF EXISTS review RESTRICT;

-- 즐겨찾기
DROP TABLE IF EXISTS bookmark RESTRICT;

-- 공지
DROP TABLE IF EXISTS notice RESTRICT;

-- 이벤트
DROP TABLE IF EXISTS event RESTRICT;

-- 레시피랭킹
DROP TABLE IF EXISTS recipe_ranking RESTRICT;

-- 찹톡
DROP TABLE IF EXISTS gallery RESTRICT;

-- 장바구니
DROP TABLE IF EXISTS cart RESTRICT;

-- 주문
DROP TABLE IF EXISTS store_order RESTRICT;

-- 구독회원
DROP TABLE IF EXISTS subscriptior RESTRICT;

-- 이벤트사진
DROP TABLE IF EXISTS photo RESTRICT;

-- 후기사진
DROP TABLE IF EXISTS review_photo RESTRICT;

-- 후기댓글
DROP TABLE IF EXISTS review_comment RESTRICT;

-- 찹톡사진
DROP TABLE IF EXISTS gallery_photo RESTRICT;

-- 동물분류
DROP TABLE IF EXISTS category RESTRICT;

-- 주문상품
DROP TABLE IF EXISTS order_product RESTRICT;

-- 회원랭킹
DROP TABLE IF EXISTS member_ranking RESTRICT;

-- 조리과정
DROP TABLE IF EXISTS cooking RESTRICT;

-- 재료
DROP TABLE IF EXISTS ingredient RESTRICT;

-- 레시피좋아요
DROP TABLE IF EXISTS recipe_like RESTRICT;

-- 상품사진
DROP TABLE IF EXISTS store_photo RESTRICT;

-- 상품문의
DROP TABLE IF EXISTS product_comment RESTRICT;

-- 상품옵션
DROP TABLE IF EXISTS product_option RESTRICT;

-- 상품후기
DROP TABLE IF EXISTS product_review RESTRICT;

-- 회원
CREATE TABLE member (
  member_id      INTEGER      NOT NULL, -- 회원번호
  password       VARCHAR(50)  NOT NULL, -- 비밀번호
  email          VARCHAR(40)  NOT NULL, -- 이메일
  photo          VARCHAR(50)  NULL,     -- 회원사진
  nickname       VARCHAR(12)  NOT NULL, -- 닉네임
  tel            VARCHAR(11)  NOT NULL, -- 전화번호
  post_no        VARCHAR(255) NULL,     -- 우편번호
  base_address   VARCHAR(255) NULL,     -- 기본주소
  detail_address VARCHAR(255) NULL,     -- 상세주소
  grade          INTEGER      NOT NULL DEFAULT 1 -- 등급
);

-- 회원
ALTER TABLE member
  ADD CONSTRAINT PK_member -- 회원 기본키
    PRIMARY KEY (
      member_id -- 회원번호
    );

-- 회원 유니크 인덱스
CREATE UNIQUE INDEX UIX_member
  ON member ( -- 회원
    nickname ASC -- 닉네임
  );

-- 회원 유니크 인덱스2
CREATE UNIQUE INDEX UIX_member2
  ON member ( -- 회원
    email ASC -- 이메일
  );

ALTER TABLE member
  MODIFY COLUMN member_id INTEGER NOT NULL AUTO_INCREMENT;

-- 반려동물 정보
CREATE TABLE pet (
  pet_id       INTEGER      NOT NULL, -- 반려동물 번호
  member_id    INTEGER      NOT NULL, -- 회원 번호
  name         VARCHAR(50)  NOT NULL, -- 이름
  created_date DATE         NOT NULL DEFAULT now(), -- 등록일
  register_no  VARCHAR(255) NULL,     -- 등록번호
  age          INTEGER      NULL,     -- 나이
  gender       INTEGER      NOT NULL, -- 성별
  file_path    VARCHAR(50)  NULL,     -- 사진
  breed        VARCHAR(50)  NULL,     -- 품종
  category_id  INTEGER      NULL      -- 동물분류번호
);

-- 반려동물 정보
ALTER TABLE pet
  ADD CONSTRAINT PK_pet -- 반려동물 정보 기본키
    PRIMARY KEY (
      pet_id -- 반려동물 번호
    );

-- 반려동물 정보 유니크 인덱스
CREATE UNIQUE INDEX UIX_pet
  ON pet ( -- 반려동물 정보
    register_no ASC -- 등록번호
  );

ALTER TABLE pet
  MODIFY COLUMN pet_id INTEGER NOT NULL AUTO_INCREMENT;

-- 상품
CREATE TABLE product (
  product_id INTEGER     NOT NULL, -- 상품 번호
  title      VARCHAR(50) NOT NULL, -- 이름
  price      INTEGER     NOT NULL, -- 가격
  detail     TEXT        NOT NULL, -- 상세
  stock      INTEGER     NOT NULL, -- 재고
  discount   INTEGER     NOT NULL, -- 할인률
  view_count INTEGER     NOT NULL DEFAULT 0, -- 조회수
  category   VARCHAR(50) NOT NULL, -- 상품카테고리
  species    VARCHAR(50) NOT NULL  -- 동물분류
);

-- 상품
ALTER TABLE product
  ADD CONSTRAINT PK_product -- 상품 기본키
    PRIMARY KEY (
      product_id -- 상품 번호
    );

ALTER TABLE product
  MODIFY COLUMN product_id INTEGER NOT NULL AUTO_INCREMENT;

-- 레시피
CREATE TABLE recipe (
  recipe_id    INTEGER      NOT NULL, -- 레시피 번호
  member_id    INTEGER      NOT NULL, -- 회원번호
  title        VARCHAR(255) NOT NULL, -- 이름
  created_date DATE         NOT NULL DEFAULT now(), -- 작성일
  view_count   INTEGER      NOT NULL DEFAULT 0, -- 조회수
  content      TEXT         NOT NULL, -- 내용
  thumbnail    VARCHAR(50)  NOT NULL, -- 대표사진
  category     VARCHAR(255) NOT NULL, -- 카테고리
  tag          VARCHAR(255) NULL,     -- 태그
  other_info   VARCHAR(255) NULL,     -- 기타정보
  scrap        INTEGER      NULL     DEFAULT 0 -- 스크랩
);

-- 레시피
ALTER TABLE recipe
  ADD CONSTRAINT PK_recipe -- 레시피 기본키
    PRIMARY KEY (
      recipe_id -- 레시피 번호
    );

ALTER TABLE recipe
  MODIFY COLUMN recipe_id INTEGER NOT NULL AUTO_INCREMENT;

-- 레시피댓글
CREATE TABLE recipe_comment (
  comment_id   INTEGER NOT NULL, -- 레시피댓글번호
  recipe_id    INTEGER NOT NULL, -- 레시피 번호
  member_id    INTEGER NOT NULL, -- 회원번호
  content      TEXT    NOT NULL, -- 댓글 내용
  created_date DATE    NOT NULL DEFAULT now() -- 작성일
);

-- 레시피댓글
ALTER TABLE recipe_comment
  ADD CONSTRAINT PK_recipe_comment -- 레시피댓글 기본키
    PRIMARY KEY (
      comment_id -- 레시피댓글번호
    );

ALTER TABLE recipe_comment
  MODIFY COLUMN comment_id INTEGER NOT NULL AUTO_INCREMENT;

-- 후기
CREATE TABLE review (
  review_id    INTEGER NOT NULL, -- 후기번호
  recipe_id    INTEGER NOT NULL, -- 레시피 번호
  member_id    INTEGER NOT NULL, -- 회원번호
  content      TEXT    NOT NULL, -- 내용
  created_date DATE    NOT NULL DEFAULT now() -- 작성일
);

-- 후기
ALTER TABLE review
  ADD CONSTRAINT PK_review -- 후기 기본키
    PRIMARY KEY (
      review_id -- 후기번호
    );

ALTER TABLE review
  MODIFY COLUMN review_id INTEGER NOT NULL AUTO_INCREMENT;

-- 즐겨찾기
CREATE TABLE bookmark (
  recipe_id    INTEGER NOT NULL, -- 레시피 번호
  member_id    INTEGER NOT NULL, -- 회원번호
  created_date DATE    NOT NULL DEFAULT now() -- 등록일
);

-- 즐겨찾기
ALTER TABLE bookmark
  ADD CONSTRAINT PK_bookmark -- 즐겨찾기 기본키
    PRIMARY KEY (
      recipe_id, -- 레시피 번호
      member_id  -- 회원번호
    );

-- 공지
CREATE TABLE notice (
  notice_id    INTEGER     NOT NULL, -- 공지번호
  title        VARCHAR(50) NOT NULL, -- 공지제목
  content      TEXT        NOT NULL, -- 공지내용
  created_date DATE        NOT NULL DEFAULT now(), -- 작성일
  view_count   INTEGER     NOT NULL DEFAULT 0 -- 조회수
);

-- 공지
ALTER TABLE notice
  ADD CONSTRAINT PK_notice -- 공지 기본키
    PRIMARY KEY (
      notice_id -- 공지번호
    );

ALTER TABLE notice
  MODIFY COLUMN notice_id INTEGER NOT NULL AUTO_INCREMENT;

-- 이벤트
CREATE TABLE event (
  event_id     INTEGER     NOT NULL, -- 이벤트 번호
  title        VARCHAR(50) NOT NULL, -- 이벤트제목
  content      TEXT        NOT NULL, -- 이벤트내용
  start_date   CHAR(8)     NOT NULL, -- 시작일
  end_date     CHAR(8)     NULL,     -- 종료일
  created_date DATE        NOT NULL DEFAULT now(), -- 작성일
  view_count   INTEGER     NOT NULL DEFAULT 0 -- 조회수
);

-- 이벤트
ALTER TABLE event
  ADD CONSTRAINT PK_event -- 이벤트 기본키
    PRIMARY KEY (
      event_id -- 이벤트 번호
    );

ALTER TABLE event
  MODIFY COLUMN event_id INTEGER NOT NULL AUTO_INCREMENT;

-- 레시피랭킹
CREATE TABLE recipe_ranking (
  recipe_raking_id INTEGER NOT NULL, -- 레시피랭킹번호
  recipe_id        INTEGER NOT NULL, -- 레시피 번호
  date             DATE    NOT NULL, -- 년월
  week             INTEGER NOT NULL, -- 주차
  rank             INTEGER NOT NULL  -- 등수
);

-- 레시피랭킹
ALTER TABLE recipe_ranking
  ADD CONSTRAINT PK_recipe_ranking -- 레시피랭킹 기본키
    PRIMARY KEY (
      recipe_raking_id -- 레시피랭킹번호
    );

-- 레시피랭킹 유니크 인덱스
CREATE UNIQUE INDEX UIX_recipe_ranking
  ON recipe_ranking ( -- 레시피랭킹
    date ASC, -- 년월
    week ASC, -- 주차
    rank ASC  -- 등수
  );

-- 레시피랭킹 유니크 인덱스2
CREATE UNIQUE INDEX UIX_recipe_ranking2
  ON recipe_ranking ( -- 레시피랭킹
    date ASC,      -- 년월
    week ASC,      -- 주차
    rank ASC,      -- 등수
    recipe_id ASC  -- 레시피 번호
  );

ALTER TABLE recipe_ranking
  MODIFY COLUMN recipe_raking_id INTEGER NOT NULL AUTO_INCREMENT;

-- 찹톡
CREATE TABLE gallery (
  gallery_id   INTEGER NOT NULL, -- 찹톡 번호
  member_id    INTEGER NOT NULL, -- 회원번호
  content      TEXT    NOT NULL, -- 내용
  view_count   INTEGER NOT NULL DEFAULT 0, -- 조회수
  created_date DATE    NOT NULL DEFAULT now() -- 작성일
);

-- 찹톡
ALTER TABLE gallery
  ADD CONSTRAINT PK_gallery -- 찹톡 기본키
    PRIMARY KEY (
      gallery_id -- 찹톡 번호
    );

ALTER TABLE gallery
  MODIFY COLUMN gallery_id INTEGER NOT NULL AUTO_INCREMENT;

-- 장바구니
CREATE TABLE cart (
  cart_id      INTEGER NOT NULL, -- 장바구니 번호
  member_id    INTEGER NOT NULL, -- 회원번호
  product_id   INTEGER NOT NULL, -- 상품 번호
  option_id    INTEGER NOT NULL, -- 옵션 번호
  quantity     INTEGER NOT NULL DEFAULT 1, -- 수량
  created_date DATE    NOT NULL DEFAULT now() -- 등록일
);

-- 장바구니
ALTER TABLE cart
  ADD CONSTRAINT PK_cart -- 장바구니 기본키
    PRIMARY KEY (
      cart_id -- 장바구니 번호
    );

ALTER TABLE cart
  MODIFY COLUMN cart_id INTEGER NOT NULL AUTO_INCREMENT;

-- 주문
CREATE TABLE store_order (
  order_id       INTEGER      NOT NULL, -- 주문번호
  member_id      INTEGER      NOT NULL, -- 회원번호
  name           VARCHAR(50)  NOT NULL, -- 수령인 이름
  tel            VARCHAR(50)  NOT NULL, -- 수령인 연락처
  post_no        VARCHAR(255) NOT NULL, -- 배송지우편번호
  base_address   VARCHAR(255) NOT NULL, -- 배송지기본주소
  detail_address VARCHAR(255) NOT NULL, -- 배송지상세주소
  payment_date   DATE         NOT NULL DEFAULT now(), -- 주문일
  payment_method VARCHAR(255) NOT NULL, -- 결제수단
  ship_date      VARCHAR(255) NOT NULL, -- 상태
  invoice        VARCHAR(255) NULL      -- 운송장번호
);

-- 주문
ALTER TABLE store_order
  ADD CONSTRAINT PK_store_order -- 주문 기본키
    PRIMARY KEY (
      order_id -- 주문번호
    );

-- 주문 유니크 인덱스
CREATE UNIQUE INDEX UIX_store_order
  ON store_order ( -- 주문
    invoice ASC -- 운송장번호
  );

ALTER TABLE store_order
  MODIFY COLUMN order_id INTEGER NOT NULL AUTO_INCREMENT;

-- 구독회원
CREATE TABLE subscriptior (
  chef   INTEGER NOT NULL, -- 회원번호
  viewer INTEGER NOT NULL  -- 구독자
);

-- 구독회원
ALTER TABLE subscriptior
  ADD CONSTRAINT PK_subscriptior -- 구독회원 기본키
    PRIMARY KEY (
      chef,   -- 회원번호
      viewer  -- 구독자
    );

-- 이벤트사진
CREATE TABLE photo (
  photo_id  INTEGER     NOT NULL, -- 이벤트사진번호
  event_id  INTEGER     NOT NULL, -- 이벤트 번호
  file_path VARCHAR(50) NOT NULL  -- 파일 경로
);

-- 이벤트사진
ALTER TABLE photo
  ADD CONSTRAINT PK_photo -- 이벤트사진 기본키
    PRIMARY KEY (
      photo_id -- 이벤트사진번호
    );

ALTER TABLE photo
  MODIFY COLUMN photo_id INTEGER NOT NULL AUTO_INCREMENT;

-- 후기사진
CREATE TABLE review_photo (
  photo_id  INTEGER     NOT NULL, -- 사진 번호
  review_id INTEGER     NOT NULL, -- 후기번호
  file_path VARCHAR(50) NOT NULL  -- 파일 경로
);

-- 후기사진
ALTER TABLE review_photo
  ADD CONSTRAINT PK_review_photo -- 후기사진 기본키
    PRIMARY KEY (
      photo_id -- 사진 번호
    );

ALTER TABLE review_photo
  MODIFY COLUMN photo_id INTEGER NOT NULL AUTO_INCREMENT;

-- 후기댓글
CREATE TABLE review_comment (
  comment_id   INTEGER NOT NULL, -- 후기댓글번호
  review_id    INTEGER NOT NULL, -- 후기번호
  member_id    INTEGER NOT NULL, -- 회원번호
  content      TEXT    NOT NULL, -- 댓글 내용
  created_date DATE    NOT NULL DEFAULT now() -- 작성일
);

-- 후기댓글
ALTER TABLE review_comment
  ADD CONSTRAINT PK_review_comment -- 후기댓글 기본키
    PRIMARY KEY (
      comment_id -- 후기댓글번호
    );

ALTER TABLE review_comment
  MODIFY COLUMN comment_id INTEGER NOT NULL AUTO_INCREMENT;

-- 찹톡사진
CREATE TABLE gallery_photo (
  photo_id   INTEGER     NOT NULL, -- 찹톡사진번호
  gallery_id INTEGER     NOT NULL, -- 찹톡 번호
  file_path  VARCHAR(50) NOT NULL  -- 파일 경로
);

-- 찹톡사진
ALTER TABLE gallery_photo
  ADD CONSTRAINT PK_gallery_photo -- 찹톡사진 기본키
    PRIMARY KEY (
      photo_id -- 찹톡사진번호
    );

ALTER TABLE gallery_photo
  MODIFY COLUMN photo_id INTEGER NOT NULL AUTO_INCREMENT;

-- 동물분류
CREATE TABLE category (
  category_id INTEGER      NOT NULL, -- 동물분류번호
  category    VARCHAR(255) NOT NULL  -- 분류명
);

-- 동물분류
ALTER TABLE category
  ADD CONSTRAINT PK_category -- 동물분류 기본키
    PRIMARY KEY (
      category_id -- 동물분류번호
    );

ALTER TABLE category
  MODIFY COLUMN category_id INTEGER NOT NULL AUTO_INCREMENT;

-- 주문상품
CREATE TABLE order_product (
  order_product_id INTEGER NOT NULL, -- 주문상품 번호
  order_id         INTEGER NOT NULL, -- 주문번호
  product_id       INTEGER NOT NULL, -- 상품 번호
  option_id        INTEGER NOT NULL DEFAULT 0, -- 옵션 번호
  quantity         INTEGER NOT NULL, -- 수량
  discount_price   INTEGER NOT NULL  -- 단위가격
);

-- 주문상품
ALTER TABLE order_product
  ADD CONSTRAINT PK_order_product -- 주문상품 기본키
    PRIMARY KEY (
      order_product_id -- 주문상품 번호
    );

-- 주문상품 유니크 인덱스
CREATE UNIQUE INDEX UIX_order_product
  ON order_product ( -- 주문상품
    order_id ASC,   -- 주문번호
    product_id ASC, -- 상품 번호
    option_id ASC   -- 옵션 번호
  );

ALTER TABLE order_product
  MODIFY COLUMN order_product_id INTEGER NOT NULL AUTO_INCREMENT;

-- 회원랭킹
CREATE TABLE member_ranking (
  member_raking_id INTEGER NOT NULL, -- 회원랭킹번호
  member_id        INTEGER NOT NULL, -- 회원번호
  date             DATE    NOT NULL, -- 년월
  week             INTEGER NOT NULL, -- 주차
  rank             INTEGER NOT NULL  -- 등수
);

-- 회원랭킹
ALTER TABLE member_ranking
  ADD CONSTRAINT PK_member_ranking -- 회원랭킹 기본키
    PRIMARY KEY (
      member_raking_id -- 회원랭킹번호
    );

-- 회원랭킹 유니크 인덱스
CREATE UNIQUE INDEX UIX_member_ranking
  ON member_ranking ( -- 회원랭킹
    date ASC,      -- 년월
    week ASC,      -- 주차
    rank ASC,      -- 등수
    member_id ASC  -- 회원번호
  );

-- 회원랭킹 유니크 인덱스2
CREATE UNIQUE INDEX UIX_member_ranking2
  ON member_ranking ( -- 회원랭킹
    date ASC, -- 년월
    week ASC, -- 주차
    rank ASC  -- 등수
  );

ALTER TABLE member_ranking
  MODIFY COLUMN member_raking_id INTEGER NOT NULL AUTO_INCREMENT;

-- 조리과정
CREATE TABLE cooking (
  cooking_id INTEGER     NOT NULL, -- 조리과정번호
  recipe_id  INTEGER     NOT NULL, -- 레시피 번호
  process_no INTEGER     NOT NULL, -- 조리순서
  file_path  VARCHAR(50) NOT NULL, -- 파일 경로
  content    TEXT        NOT NULL  -- 내용
);

-- 조리과정
ALTER TABLE cooking
  ADD CONSTRAINT PK_cooking -- 조리과정 기본키
    PRIMARY KEY (
      cooking_id -- 조리과정번호
    );

ALTER TABLE cooking
  MODIFY COLUMN cooking_id INTEGER NOT NULL AUTO_INCREMENT;

-- 재료
CREATE TABLE ingredient (
  ingredient_id INTEGER     NOT NULL, -- 재료번호
  recipe_id     INTEGER     NOT NULL, -- 레시피 번호
  ingredient    VARCHAR(50) NOT NULL, -- 재료
  quantity      VARCHAR(50) NOT NULL  -- 용량
);

-- 재료
ALTER TABLE ingredient
  ADD CONSTRAINT PK_ingredient -- 재료 기본키
    PRIMARY KEY (
      ingredient_id -- 재료번호
    );

ALTER TABLE ingredient
  MODIFY COLUMN ingredient_id INTEGER NOT NULL AUTO_INCREMENT;

-- 레시피좋아요
CREATE TABLE recipe_like (
  like_id   INTEGER NOT NULL, -- 좋아요번호
  member_id INTEGER NOT NULL, -- 회원번호
  recipe_id INTEGER NOT NULL  -- 레시피 번호
);

-- 레시피좋아요
ALTER TABLE recipe_like
  ADD CONSTRAINT PK_recipe_like -- 레시피좋아요 기본키
    PRIMARY KEY (
      like_id,   -- 좋아요번호
      member_id, -- 회원번호
      recipe_id  -- 레시피 번호
    );

ALTER TABLE recipe_like
  MODIFY COLUMN like_id INTEGER NOT NULL AUTO_INCREMENT;

-- 상품사진
CREATE TABLE store_photo (
  photo_id   INTEGER     NOT NULL, -- 찹톡사진번호
  product_id INTEGER     NOT NULL, -- 상품 번호
  file_path  VARCHAR(50) NOT NULL  -- 파일 경로
);

-- 상품사진
ALTER TABLE store_photo
  ADD CONSTRAINT PK_store_photo -- 상품사진 기본키
    PRIMARY KEY (
      photo_id -- 찹톡사진번호
    );

ALTER TABLE store_photo
  MODIFY COLUMN photo_id INTEGER NOT NULL AUTO_INCREMENT;

-- 상품문의
CREATE TABLE product_comment (
  comment_id   INTEGER     NOT NULL, -- 상품문의번호
  product_id   INTEGER     NOT NULL, -- 상품 번호
  member_id    INTEGER     NOT NULL, -- 회원번호
  title        VARCHAR(50) NOT NULL, -- 제목
  content      TEXT        NOT NULL, -- 댓글 내용
  created_date DATE        NOT NULL DEFAULT now() -- 작성일
);

-- 상품문의
ALTER TABLE product_comment
  ADD CONSTRAINT PK_product_comment -- 상품문의 기본키
    PRIMARY KEY (
      comment_id -- 상품문의번호
    );

ALTER TABLE product_comment
  MODIFY COLUMN comment_id INTEGER NOT NULL AUTO_INCREMENT;

-- 상품옵션
CREATE TABLE product_option (
  option_id  INTEGER     NOT NULL, -- 옵션 번호
  product_id INTEGER     NOT NULL, -- 상품 번호
  title      VARCHAR(50) NOT NULL, -- 이름
  price      INTEGER     NOT NULL DEFAULT 0 -- 가격
);

-- 상품옵션
ALTER TABLE product_option
  ADD CONSTRAINT PK_product_option -- 상품옵션 기본키
    PRIMARY KEY (
      option_id -- 옵션 번호
    );

-- 상품옵션 유니크 인덱스
CREATE UNIQUE INDEX UIX_product_option
  ON product_option ( -- 상품옵션
    title ASC -- 이름
  );

ALTER TABLE product_option
  MODIFY COLUMN option_id INTEGER NOT NULL AUTO_INCREMENT;

-- 상품후기
CREATE TABLE product_review (
  product_review_id INTEGER     NOT NULL, -- 상품후기번호
  product_id        INTEGER     NOT NULL, -- 상품 번호
  member_id         INTEGER     NOT NULL, -- 회원번호
  file_path         VARCHAR(50) NULL,     -- 사진
  content           TEXT        NOT NULL, -- 내용
  rating            INTEGER     NOT NULL, -- 평점
  created_date      DATE        NOT NULL DEFAULT now() -- 작성일
);

-- 상품후기
ALTER TABLE product_review
  ADD CONSTRAINT PK_product_review -- 상품후기 기본키
    PRIMARY KEY (
      product_review_id -- 상품후기번호
    );

ALTER TABLE product_review
  MODIFY COLUMN product_review_id INTEGER NOT NULL AUTO_INCREMENT;

-- 반려동물 정보
ALTER TABLE pet
  ADD CONSTRAINT FK_member_TO_pet -- 회원 -> 반려동물 정보
    FOREIGN KEY (
      member_id -- 회원 번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 반려동물 정보
ALTER TABLE pet
  ADD CONSTRAINT FK_category_TO_pet -- 동물분류 -> 반려동물 정보
    FOREIGN KEY (
      category_id -- 동물분류번호
    )
    REFERENCES category ( -- 동물분류
      category_id -- 동물분류번호
    );

-- 레시피
ALTER TABLE recipe
  ADD CONSTRAINT FK_member_TO_recipe -- 회원 -> 레시피
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 레시피댓글
ALTER TABLE recipe_comment
  ADD CONSTRAINT FK_recipe_TO_recipe_comment -- 레시피 -> 레시피댓글
    FOREIGN KEY (
      recipe_id -- 레시피 번호
    )
    REFERENCES recipe ( -- 레시피
      recipe_id -- 레시피 번호
    );

-- 레시피댓글
ALTER TABLE recipe_comment
  ADD CONSTRAINT FK_member_TO_recipe_comment -- 회원 -> 레시피댓글
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 후기
ALTER TABLE review
  ADD CONSTRAINT FK_recipe_TO_review -- 레시피 -> 후기
    FOREIGN KEY (
      recipe_id -- 레시피 번호
    )
    REFERENCES recipe ( -- 레시피
      recipe_id -- 레시피 번호
    );

-- 후기
ALTER TABLE review
  ADD CONSTRAINT FK_member_TO_review -- 회원 -> 후기
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 즐겨찾기
ALTER TABLE bookmark
  ADD CONSTRAINT FK_recipe_TO_bookmark -- 레시피 -> 즐겨찾기
    FOREIGN KEY (
      recipe_id -- 레시피 번호
    )
    REFERENCES recipe ( -- 레시피
      recipe_id -- 레시피 번호
    );

-- 즐겨찾기
ALTER TABLE bookmark
  ADD CONSTRAINT FK_member_TO_bookmark -- 회원 -> 즐겨찾기
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 레시피랭킹
ALTER TABLE recipe_ranking
  ADD CONSTRAINT FK_recipe_TO_recipe_ranking -- 레시피 -> 레시피랭킹
    FOREIGN KEY (
      recipe_id -- 레시피 번호
    )
    REFERENCES recipe ( -- 레시피
      recipe_id -- 레시피 번호
    );

-- 찹톡
ALTER TABLE gallery
  ADD CONSTRAINT FK_member_TO_gallery -- 회원 -> 찹톡
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 장바구니
ALTER TABLE cart
  ADD CONSTRAINT FK_member_TO_cart -- 회원 -> 장바구니
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 장바구니
ALTER TABLE cart
  ADD CONSTRAINT FK_product_TO_cart -- 상품 -> 장바구니
    FOREIGN KEY (
      product_id -- 상품 번호
    )
    REFERENCES product ( -- 상품
      product_id -- 상품 번호
    );

-- 장바구니
ALTER TABLE cart
  ADD CONSTRAINT FK_product_option_TO_cart -- 상품옵션 -> 장바구니
    FOREIGN KEY (
      option_id -- 옵션 번호
    )
    REFERENCES product_option ( -- 상품옵션
      option_id -- 옵션 번호
    );

-- 주문
ALTER TABLE store_order
  ADD CONSTRAINT FK_member_TO_store_order -- 회원 -> 주문
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 구독회원
ALTER TABLE subscriptior
  ADD CONSTRAINT FK_member_TO_subscriptior -- 회원 -> 구독회원
    FOREIGN KEY (
      chef -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 구독회원
ALTER TABLE subscriptior
  ADD CONSTRAINT FK_member_TO_subscriptior2 -- 회원 -> 구독회원2
    FOREIGN KEY (
      viewer -- 구독자
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 이벤트사진
ALTER TABLE photo
  ADD CONSTRAINT FK_event_TO_photo -- 이벤트 -> 이벤트사진
    FOREIGN KEY (
      event_id -- 이벤트 번호
    )
    REFERENCES event ( -- 이벤트
      event_id -- 이벤트 번호
    );

-- 후기사진
ALTER TABLE review_photo
  ADD CONSTRAINT FK_review_TO_review_photo -- 후기 -> 후기사진
    FOREIGN KEY (
      review_id -- 후기번호
    )
    REFERENCES review ( -- 후기
      review_id -- 후기번호
    );

-- 후기댓글
ALTER TABLE review_comment
  ADD CONSTRAINT FK_review_TO_review_comment -- 후기 -> 후기댓글
    FOREIGN KEY (
      review_id -- 후기번호
    )
    REFERENCES review ( -- 후기
      review_id -- 후기번호
    );

-- 후기댓글
ALTER TABLE review_comment
  ADD CONSTRAINT FK_member_TO_review_comment -- 회원 -> 후기댓글
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 찹톡사진
ALTER TABLE gallery_photo
  ADD CONSTRAINT FK_gallery_TO_gallery_photo -- 찹톡 -> 찹톡사진
    FOREIGN KEY (
      gallery_id -- 찹톡 번호
    )
    REFERENCES gallery ( -- 찹톡
      gallery_id -- 찹톡 번호
    );

-- 주문상품
ALTER TABLE order_product
  ADD CONSTRAINT FK_store_order_TO_order_product -- 주문 -> 주문상품
    FOREIGN KEY (
      order_id -- 주문번호
    )
    REFERENCES store_order ( -- 주문
      order_id -- 주문번호
    );

-- 주문상품
ALTER TABLE order_product
  ADD CONSTRAINT FK_product_TO_order_product -- 상품 -> 주문상품
    FOREIGN KEY (
      product_id -- 상품 번호
    )
    REFERENCES product ( -- 상품
      product_id -- 상품 번호
    );

-- 주문상품
ALTER TABLE order_product
  ADD CONSTRAINT FK_product_option_TO_order_product -- 상품옵션 -> 주문상품
    FOREIGN KEY (
      option_id -- 옵션 번호
    )
    REFERENCES product_option ( -- 상품옵션
      option_id -- 옵션 번호
    );

-- 회원랭킹
ALTER TABLE member_ranking
  ADD CONSTRAINT FK_member_TO_member_ranking -- 회원 -> 회원랭킹
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 조리과정
ALTER TABLE cooking
  ADD CONSTRAINT FK_recipe_TO_cooking -- 레시피 -> 조리과정
    FOREIGN KEY (
      recipe_id -- 레시피 번호
    )
    REFERENCES recipe ( -- 레시피
      recipe_id -- 레시피 번호
    );

-- 재료
ALTER TABLE ingredient
  ADD CONSTRAINT FK_recipe_TO_ingredient -- 레시피 -> 재료
    FOREIGN KEY (
      recipe_id -- 레시피 번호
    )
    REFERENCES recipe ( -- 레시피
      recipe_id -- 레시피 번호
    );

-- 레시피좋아요
ALTER TABLE recipe_like
  ADD CONSTRAINT FK_member_TO_recipe_like -- 회원 -> 레시피좋아요
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 레시피좋아요
ALTER TABLE recipe_like
  ADD CONSTRAINT FK_recipe_TO_recipe_like -- 레시피 -> 레시피좋아요
    FOREIGN KEY (
      recipe_id -- 레시피 번호
    )
    REFERENCES recipe ( -- 레시피
      recipe_id -- 레시피 번호
    );

-- 상품사진
ALTER TABLE store_photo
  ADD CONSTRAINT FK_product_TO_store_photo -- 상품 -> 상품사진
    FOREIGN KEY (
      product_id -- 상품 번호
    )
    REFERENCES product ( -- 상품
      product_id -- 상품 번호
    );

-- 상품문의
ALTER TABLE product_comment
  ADD CONSTRAINT FK_product_TO_product_comment -- 상품 -> 상품문의
    FOREIGN KEY (
      product_id -- 상품 번호
    )
    REFERENCES product ( -- 상품
      product_id -- 상품 번호
    );

-- 상품문의
ALTER TABLE product_comment
  ADD CONSTRAINT FK_member_TO_product_comment -- 회원 -> 상품문의
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );

-- 상품옵션
ALTER TABLE product_option
  ADD CONSTRAINT FK_product_TO_product_option -- 상품 -> 상품옵션
    FOREIGN KEY (
      product_id -- 상품 번호
    )
    REFERENCES product ( -- 상품
      product_id -- 상품 번호
    );

-- 상품후기
ALTER TABLE product_review
  ADD CONSTRAINT FK_product_TO_product_review -- 상품 -> 상품후기
    FOREIGN KEY (
      product_id -- 상품 번호
    )
    REFERENCES product ( -- 상품
      product_id -- 상품 번호
    );

-- 상품후기
ALTER TABLE product_review
  ADD CONSTRAINT FK_member_TO_product_review -- 회원 -> 상품후기
    FOREIGN KEY (
      member_id -- 회원번호
    )
    REFERENCES member ( -- 회원
      member_id -- 회원번호
    );