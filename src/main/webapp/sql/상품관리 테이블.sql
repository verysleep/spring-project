-- 1-a. 테이블 삭제(FK -> PK)
    -- 1) 상품 가격
    drop table price CASCADE CONSTRAINTS;
    -- 2) 상품 옵션
    drop table goods_option CASCADE CONSTRAINTS;
    -- 3) 상품 사이즈 & 색상
    drop table goods_sizeColor CASCADE CONSTRAINTS;
    -- 4) 상품 이미지
    drop table goods_image CASCADE CONSTRAINTS;
    -- 5) 상품(상품이 지워지면 5~7 테이블도 지워짐)
    drop table goods CASCADE CONSTRAINTS;
    -- 6) 색상(기본)
    drop table basic_color CASCADE CONSTRAINTS;
    -- 7) 사이즈(기본)
    drop table basic_size CASCADE CONSTRAINTS;
    -- 8) 카테고리
    drop table category CASCADE CONSTRAINTS;
-- 1-b. 시퀀스 삭제
    drop SEQUENCE price_seq;
    drop SEQUENCE goods_option_seq;
    drop SEQUENCE goods_sizeColor_seq;
    drop SEQUENCE goods_image_seq;
    drop SEQUENCE goods_seq;
    drop SEQUENCE size_seq;
    drop SEQUENCE color_seq;
    
-- 2-a. 테이블 생성(PK -> FK : 판매가 되면 지우면 안됨)
    -- 1) 카테고리
    create table category (
        cate_code1 number(3), -- 카테고리 1차
        cate_code2 number(3) default 0, -- 카테고리 2차
        cate_name varchar2(30) not null, -- 카테고리 명 : 한글 최대 10자
        CONSTRAINT category_pk primary key (cate_code1, cate_code2) 
    );
    -- 2) 사이즈(기본)
    create table basic_size (
        size_no number primary key, -- 사이즈 번호
        cate_code1 number(3) not null, -- 카테고리 1차
        cate_code2 number(3) not null, -- 카테고리 2차
        size_name varchar2(30) not null, -- 사이즈명 : 한글 최대 10자
        CONSTRAINT basic_size_cate_fk FOREIGN key (cate_code1, cate_code2) 
        REFERENCES category(cate_code1, cate_code2)
    );
    -- 3) 색상(기본)
    create table basic_color (
        color_no number primary key, -- 색상 번호
        cate_code1 number(3) not null, -- 카테고리 1차
        cate_code2 number(3) not null, -- 카테고리 2차
        color_name varchar2(30) not null, -- 색상명 : 한글 최대 10자
        CONSTRAINT basic_color_cate_fk FOREIGN key (cate_code1, cate_code2) 
        REFERENCES category(cate_code1, cate_code2)
    );
    -- 4) 상품(상품이 지워지면 5~8 테이블도 지워짐)
    create table goods (
        goods_no number primary key, -- 상품코드
        cate_code1 number(3) not null, -- 카테고리 1차
        cate_code2 number(3) not null, -- 카테고리 2차
        goods_name varchar2(300) not null, -- 상품명 : 한글 최대 100자
        company varchar2(60) not null, -- 제조사 : 한글 최대 20자
        product_date DATE not null, -- 제조일
        image_name varchar2(200) not null, -- 대표 이미지
        detail_image_name varchar2(200), -- 상세 이미지
        content varchar2(2000), -- 상세 설명
        CONSTRAINT goods_cate_fk FOREIGN key (cate_code1, cate_code2) 
        REFERENCES category (cate_code1, cate_code2)
    );
    -- 5) 상품 이미지
    create table goods_image (
        image_no number primary key, -- 이미지 번호
        goods_no number references goods(goods_no) not null, -- 상품 코드
        image_name varchar2(200) not null -- 이미지 파일명
    );
    -- 6) 상품 사이즈 & 색상
    create table goods_sizeColor (
        goods_sizeColor_no number primary key, -- 상품 사이즈 번호
        goods_no number references goods(goods_no) not null, -- 상품 코드
        size_no number references basic_size(size_no) not null, -- 사이즈 번호
        color_no number not null -- 색상 번호
    );
    -- 7) 상품 옵션
    create table goods_option (
        goods_option_no number primary key, -- 옵션 번호
        goods_no number references goods(goods_no) not null, -- 상품 코드
        option_name varchar2(300) not null -- 옵션명 : 한글 최대 100자
    );
    -- 8) 상품 가격
    create table price (
        price_no number primary key, -- 가격 번호
        goods_no number references goods(goods_no) not null, -- 상품 코드
        price number(10) not null, -- 가격 : 0 포함 숫자 10자리 >> 10억원 까지
        discount number(10), -- 할인가
        discount_rate number(3) default 0, -- 할인율
        delivery_charge number(5) default 0, -- 배송비 : 0 포함 숫자 5자리 >> n만원까지
        saved_rate number(3) default 0, -- 적립금
        sale_startDate date default sysdate, -- 판매 시작일
        sale_endDate date default '9999-12-31' -- 판매 종료일
    );

-- 2-b) 시퀀스 생성    
    create SEQUENCE price_seq; -- cycle : 수가 최대가 되면 다시 1로 초기화
    create SEQUENCE goods_option_seq;
    create SEQUENCE goods_sizeColor_seq;
    create SEQUENCE goods_image_seq;
    create SEQUENCE goods_seq;
    create SEQUENCE size_seq;
    create SEQUENCE color_seq;
    -- category 의 시퀀스는 데이터가 얼마 안되고 작이 많이 이루어지지 않는다. 
    -- 그래서 max() 를 사용해서 등록
    
-- 3. 샘플 데이터(생성된 순서)
    -- 1) 카테고리
    -- 대분류 카테고리
    insert into category(cate_code1, cate_name) 
    values((select nvl(max(cate_code1), 0)+1 from category), '의류');
    
    -- select nvl(max(cate_code1), 0)+1 from category; -- cate_code1 = null >> nvl()
    -- nvl(칼럼의 값, 대체 값) : 해당 칼럼의 값이 null 값이면 다음 값으로 대체하는 메서드
    
    insert into category(cate_code1, cate_code2, cate_name) 
    values(1, (select nvl(max(cate_code2), 0)+1 from category), '남성복 상의');
    
    insert into category(cate_code1, cate_code2, cate_name) 
    values(1, (select nvl(max(cate_code2), 0)+1 from category), '남성복 하의');
    
    insert into category(cate_code1, cate_code2, cate_name) 
    values(1, (select nvl(max(cate_code2), 0)+1 from category), '여성복 상의');
    
    insert into category(cate_code1, cate_code2, cate_name) 
    values(1, (select nvl(max(cate_code2), 0)+1 from category), '여성복 하의');
    
    -- 대분류 가져오기
    select * from category where cate_code1 = 1;
    -- 중분류 가져오기
    select * from category where cate_code1 = 1 and cate_code2 != 0;
    
    commit;
    
    -- 2) 사이즈(기본 - 대분류)
    insert into basic_size(size_no, cate_code1, cate_code2, size_name)
    values(size_seq.nextval, 1, 0, 'S');
    
    insert into basic_size(size_no, cate_code1, cate_code2, size_name)
    values(size_seq.nextval, 1, 0, 'M');
    
    insert into basic_size(size_no, cate_code1, cate_code2, size_name)
    values(size_seq.nextval, 1, 0, 'L');
    
    insert into basic_size(size_no, cate_code1, cate_code2, size_name)
    values(size_seq.nextval, 1, 0, 'XL');
    
    insert into basic_size(size_no, cate_code1, cate_code2, size_name)
    values(size_seq.nextval, 1, 0, 'XXL');
    
    commit;
    
    select * from basic_size where cate_code1 = 1;
    
    -- 3) 색상(기본)
    insert into basic_color(color_no, cate_code1, cate_code2, color_name)
    values(color_seq.nextval, 1, 0, 'RED');
    
    insert into basic_color(color_no, cate_code1, cate_code2, color_name)
    values(color_seq.nextval, 1, 0, 'BLACK');
    
    insert into basic_color(color_no, cate_code1, cate_code2, color_name)
    values(color_seq.nextval, 1, 0, 'BLUE');
    
    insert into basic_color(color_no, cate_code1, cate_code2, color_name)
    values(color_seq.nextval, 1, 0, 'YELLOW');
    
    insert into basic_color(color_no, cate_code1, cate_code2, color_name)
    values(color_seq.nextval, 1, 0, 'GREEN');
    
    commit;
    
    select * from basic_color where cate_code1 = 1;
    
    -- 아래의 내용을 한꺼번에 성공해야 하므로 트랜잭션 처리를 한다.
    -- 4) 상품
    insert into goods(goods_no, cate_code1, cate_code2, goods_name, company, 
    product_date, image_name, detail_image_name, content)
    values(goods_seq.nextval, 1, 1, '정장 스타일 남성 상의', '웹짱', '2024-08-20', 
    '/upload/goods/men01.jpg', '/upload/goods/men02.jpg', '멋지고 편한 남성용 상의. 물빨래 가능');
    
    commit;
    
    select * from goods;
    
    -- 5) 상품 이미지
    -- 6) 상품 사이즈 & 색상
    -- 7) 상품 옵션
    -- 8) 상품 가격

