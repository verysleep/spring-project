-- 1-a. ���̺� ����(FK -> PK)
    -- 1) ��ǰ ����
    drop table price CASCADE CONSTRAINTS;
    -- 2) ��ǰ �ɼ�
    drop table goods_option CASCADE CONSTRAINTS;
    -- 3) ��ǰ ������ & ����
    drop table goods_sizeColor CASCADE CONSTRAINTS;
    -- 4) ��ǰ �̹���
    drop table goods_image CASCADE CONSTRAINTS;
    -- 5) ��ǰ(��ǰ�� �������� 5~7 ���̺� ������)
    drop table goods CASCADE CONSTRAINTS;
    -- 6) ����(�⺻)
    drop table basic_color CASCADE CONSTRAINTS;
    -- 7) ������(�⺻)
    drop table basic_size CASCADE CONSTRAINTS;
    -- 8) ī�װ�
    drop table category CASCADE CONSTRAINTS;
-- 1-b. ������ ����
    drop SEQUENCE price_seq;
    drop SEQUENCE goods_option_seq;
    drop SEQUENCE goods_sizeColor_seq;
    drop SEQUENCE goods_image_seq;
    drop SEQUENCE goods_seq;
    drop SEQUENCE size_seq;
    drop SEQUENCE color_seq;
    
-- 2-a. ���̺� ����(PK -> FK : �ǸŰ� �Ǹ� ����� �ȵ�)
    -- 1) ī�װ�
    create table category (
        cate_code1 number(3), -- ī�װ� 1��
        cate_code2 number(3) default 0, -- ī�װ� 2��
        cate_name varchar2(30) not null, -- ī�װ� �� : �ѱ� �ִ� 10��
        CONSTRAINT category_pk primary key (cate_code1, cate_code2) 
    );
    -- 2) ������(�⺻)
    create table basic_size (
        size_no number primary key, -- ������ ��ȣ
        cate_code1 number(3) not null, -- ī�װ� 1��
        cate_code2 number(3) not null, -- ī�װ� 2��
        size_name varchar2(30) not null, -- ������� : �ѱ� �ִ� 10��
        CONSTRAINT basic_size_cate_fk FOREIGN key (cate_code1, cate_code2) 
        REFERENCES category(cate_code1, cate_code2)
    );
    -- 3) ����(�⺻)
    create table basic_color (
        color_no number primary key, -- ���� ��ȣ
        cate_code1 number(3) not null, -- ī�װ� 1��
        cate_code2 number(3) not null, -- ī�װ� 2��
        color_name varchar2(30) not null, -- ����� : �ѱ� �ִ� 10��
        CONSTRAINT basic_color_cate_fk FOREIGN key (cate_code1, cate_code2) 
        REFERENCES category(cate_code1, cate_code2)
    );
    -- 4) ��ǰ(��ǰ�� �������� 5~8 ���̺� ������)
    create table goods (
        goods_no number primary key, -- ��ǰ�ڵ�
        cate_code1 number(3) not null, -- ī�װ� 1��
        cate_code2 number(3) not null, -- ī�װ� 2��
        goods_name varchar2(300) not null, -- ��ǰ�� : �ѱ� �ִ� 100��
        company varchar2(60) not null, -- ������ : �ѱ� �ִ� 20��
        product_date DATE not null, -- ������
        image_name varchar2(200) not null, -- ��ǥ �̹���
        detail_image_name varchar2(200), -- �� �̹���
        content varchar2(2000), -- �� ����
        CONSTRAINT goods_cate_fk FOREIGN key (cate_code1, cate_code2) 
        REFERENCES category (cate_code1, cate_code2)
    );
    -- 5) ��ǰ �̹���
    create table goods_image (
        image_no number primary key, -- �̹��� ��ȣ
        goods_no number references goods(goods_no) not null, -- ��ǰ �ڵ�
        image_name varchar2(200) not null -- �̹��� ���ϸ�
    );
    -- 6) ��ǰ ������ & ����
    create table goods_sizeColor (
        goods_sizeColor_no number primary key, -- ��ǰ ������ ��ȣ
        goods_no number references goods(goods_no) not null, -- ��ǰ �ڵ�
        size_no number references basic_size(size_no) not null, -- ������ ��ȣ
        color_no number not null -- ���� ��ȣ
    );
    -- 7) ��ǰ �ɼ�
    create table goods_option (
        goods_option_no number primary key, -- �ɼ� ��ȣ
        goods_no number references goods(goods_no) not null, -- ��ǰ �ڵ�
        option_name varchar2(300) not null -- �ɼǸ� : �ѱ� �ִ� 100��
    );
    -- 8) ��ǰ ����
    create table price (
        price_no number primary key, -- ���� ��ȣ
        goods_no number references goods(goods_no) not null, -- ��ǰ �ڵ�
        price number(10) not null, -- ���� : 0 ���� ���� 10�ڸ� >> 10��� ����
        discount number(10), -- ���ΰ�
        discount_rate number(3) default 0, -- ������
        delivery_charge number(5) default 0, -- ��ۺ� : 0 ���� ���� 5�ڸ� >> n��������
        saved_rate number(3) default 0, -- ������
        sale_startDate date default sysdate, -- �Ǹ� ������
        sale_endDate date default '9999-12-31' -- �Ǹ� ������
    );

-- 2-b) ������ ����    
    create SEQUENCE price_seq; -- cycle : ���� �ִ밡 �Ǹ� �ٽ� 1�� �ʱ�ȭ
    create SEQUENCE goods_option_seq;
    create SEQUENCE goods_sizeColor_seq;
    create SEQUENCE goods_image_seq;
    create SEQUENCE goods_seq;
    create SEQUENCE size_seq;
    create SEQUENCE color_seq;
    -- category �� �������� �����Ͱ� �� �ȵǰ� ���� ���� �̷������ �ʴ´�. 
    -- �׷��� max() �� ����ؼ� ���
    
-- 3. ���� ������(������ ����)
    -- 1) ī�װ�
    -- ��з� ī�װ�
    insert into category(cate_code1, cate_name) 
    values((select nvl(max(cate_code1), 0)+1 from category), '�Ƿ�');
    
    -- select nvl(max(cate_code1), 0)+1 from category; -- cate_code1 = null >> nvl()
    -- nvl(Į���� ��, ��ü ��) : �ش� Į���� ���� null ���̸� ���� ������ ��ü�ϴ� �޼���
    
    insert into category(cate_code1, cate_code2, cate_name) 
    values(1, (select nvl(max(cate_code2), 0)+1 from category), '������ ����');
    
    insert into category(cate_code1, cate_code2, cate_name) 
    values(1, (select nvl(max(cate_code2), 0)+1 from category), '������ ����');
    
    insert into category(cate_code1, cate_code2, cate_name) 
    values(1, (select nvl(max(cate_code2), 0)+1 from category), '������ ����');
    
    insert into category(cate_code1, cate_code2, cate_name) 
    values(1, (select nvl(max(cate_code2), 0)+1 from category), '������ ����');
    
    -- ��з� ��������
    select * from category where cate_code1 = 1;
    -- �ߺз� ��������
    select * from category where cate_code1 = 1 and cate_code2 != 0;
    
    commit;
    
    -- 2) ������(�⺻ - ��з�)
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
    
    -- 3) ����(�⺻)
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
    
    -- �Ʒ��� ������ �Ѳ����� �����ؾ� �ϹǷ� Ʈ����� ó���� �Ѵ�.
    -- 4) ��ǰ
    insert into goods(goods_no, cate_code1, cate_code2, goods_name, company, 
    product_date, image_name, detail_image_name, content)
    values(goods_seq.nextval, 1, 1, '���� ��Ÿ�� ���� ����', '��¯', '2024-08-20', 
    '/upload/goods/men01.jpg', '/upload/goods/men02.jpg', '������ ���� ������ ����. ������ ����');
    
    commit;
    
    select * from goods;
    
    -- 5) ��ǰ �̹���
    -- 6) ��ǰ ������ & ����
    -- 7) ��ǰ �ɼ�
    -- 8) ��ǰ ����

