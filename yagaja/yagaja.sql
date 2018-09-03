--���������
create user yagaja identified by 1119;

--���Ѻο��ϱ�
grant connect, resource to yagaja;


/* Drop Tables */

DROP TABLE SURROUND CASCADE CONSTRAINTS;
DROP TABLE RESERVATION CASCADE CONSTRAINTS;
DROP TABLE AUCTION CASCADE CONSTRAINTS;
DROP TABLE HOTDEAL CASCADE CONSTRAINTS;
DROP TABLE LEAVE_MEMBER CASCADE CONSTRAINTS;
DROP TABLE LODGE_ADDR CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE ROOM CASCADE CONSTRAINTS;
DROP TABLE LODGE CASCADE CONSTRAINTS;
DROP TABLE Member CASCADE CONSTRAINTS;
DROP TABLE NOTICE CASCADE CONSTRAINTS;

-- �߰���ȸ�����̺�
CREATE TABLE Member
(
	-- ȸ���Ϸù�ȣ
	MEMBER_NO number NOT NULL,
	-- ȸ�����̵�
	ID varchar2(50) NOT NULL,
	-- �н�����
	PASS varchar2(50) NOT NULL,
	-- �г���
	NICKNAME varchar2(30) NOT NULL,
	-- �ڵ�����ȣ
	PHONE varchar2(20) NOT NULL,
	-- ���ϸ���
	M_POINT number DEFAULT 0,
	-- �̸���
	EMAIL varchar2(70) NOT NULL,
	-- ȸ��������
	REGIDATE date DEFAULT sysdate,
	-- ���Ѽ��� : DEFUALT USER
	AUTHORITY varchar2(30) DEFAULT 'user',
	PRIMARY KEY (MEMBER_NO)
);

--member_no_seq ����
create sequence member_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--Member���̺� ���̵�����
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate, authority) 
values(member_no_seq.nextval, 'admin', '1119', '������', '010-8580-1119', 10000, 'test1', sysdate, 'admin');
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member2', '7809', '������', '010-9122-7809', 9000, 'test2', sysdate);
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member3', '3012', '����', '010-9960-3012', 8000, 'test3', sysdate);
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member4', '2505', '���', '010-6479-2505', 7000, 'test4', sysdate);
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member5', '3456', 'new��', '010-6742-3456', 6000, 'test5', sysdate);
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member6', '4331', '�۷θ�', '010-3154-4331', 5000, 'test6', sysdate);


-- Ż��ȸ�����̺�
CREATE TABLE LEAVE_MEMBER
(
	-- Ż�����
	LEAVE_REASON varchar2(500),
	-- ���γ���
	LEAVE_REASON2 varchar2(1000),
	-- Ż����
	LEAVE_DATE date DEFAULT sysdate NOT NULL,
	-- ȸ���Ϸù�ȣ
	MEMBER_NO number NOT NULL,
    ID varchar(50) not null,
    authority varchar2(30) not null
);
-- authority �÷� �߰�
alter table leave_member add authority varchar2(30) not null;



-- ���ڽü����̺�
CREATE TABLE LODGE
(
	-- �����Ϸù�ȣ
	LODGE_NO number NOT NULL,
	-- ��������
	LODGE_TYPE varchar2(30) NOT NULL,
	-- ���Ҹ�
	LODGE_NAME varchar2(60) NOT NULL,
	-- ������ȭ��ȣ
	LODGE_TEL varchar2(20) NOT NULL,
	-- ���ҹ氳��
	LODGE_ROOMCOUNT number NOT NULL,
	-- �����±�
	LODGE_TAG varchar2(100),
	-- ���Ҵ�ǥ����
	LODGE_PHOTO varchar2(50) NOT NULL,
	-- �����׸�
	LODGE_THEMA varchar2(3000),
	-- ���Ұ��ܼ���
	LODGE_NOTE varchar2(1000),
	-- ���� Ư¡
    LODGE_FEATURE varchar2(200) not null,
	PRIMARY KEY (LODGE_NO)
);

--lodge_no_seq ����
create sequence lodge_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--���ڽü� ���̵�����
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, 'ȣ��', '�߰���ȣ��', '010-1234-5678', 1, '#����ó#�츮��ó��', '�߰���ȣ��.jpg', '���Ĺٺ�ť�ſ��', '��������ȣ��', '��ī����');
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, '����', '�����ڸ���', '010-2345-7890', 1, '#����ó#�ϲ���', '�����ڸ���.jpg', '�̷���', '������������', '��ī�����׷��Ź���'); 
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, '���', '���������', '010-3456-7890', 1, '#����ó#�����ȳ�', '���������.jpg', '����', '�����������', '��ī�����ƹ������尡��'); 
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, '����Ʈ', '�߰��ڸ���Ʈ', '010-0123-4567', 1, '#����ó#������', '�߰��ڸ���Ʈ.jpg', '�ٺ�ť', '������������Ʈ', '��ī������������'); 
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, '����', '��������ȣ��', '010-5678-9012', 1, '#����ó#������', '������������.jpg', '�ſ��', '�����ϴ¸���', '��ī��������'); 

-- ���ڽü� EX ���̺�
CREATE TABLE LODGE_ex
(
	-- �����Ϸù�ȣ
	LODGE_NO number NOT NULL,
	-- ��������
	LODGE_TYPE varchar2(30),
	-- ���Ҹ�
	LODGE_NAME varchar2(60),
	-- ������ȭ��ȣ
	LODGE_TEL varchar2(20),
	-- ���ҹ氳��
	LODGE_ROOMCOUNT number,
	-- �����±�
	LODGE_TAG varchar2(100),
	-- ���Ҵ�ǥ����
	LODGE_PHOTO varchar2(50),
	-- �����׸�
	LODGE_THEMA varchar2(3000),
	-- ���Ұ��ܼ���
	LODGE_NOTE varchar2(1000),
	PRIMARY KEY (LODGE_NO)
);
insert into lodge_ex (lodge_no, lodge_name) values(1, '�����ϴ��ƽ�');
insert into lodge_ex (lodge_no, lodge_name) values(2, '�۷θ�Ŵ��Ŵ��');
insert into lodge_ex (lodge_no, lodge_name) values(3, '���������̾�');


-- ���ڽü��ּ����̺�
CREATE TABLE LODGE_ADDR
(
	-- ���ڽü� �ּ�
	ADDR_COMMON varchar2(200) NOT NULL,
	-- ���ڽü� ���ּ�
	ADDR_DETAIL varchar2(100) NOT NULL,
	-- ���ڽü� �����ȣ
	ADDR_ZIPCODE number NOT NULL,
	-- ���ڽü�����
	ADDR_LAT varchar2(50),
	-- ���ڽü��浵
	ADDR_LONG varchar2(50),
	-- �����Ϸù�ȣ
	LODGE_NO number NOT NULL
);

-- ���ڽü� �ּ� ���̵�����
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('����� ������ �׳ɵ�', '�߰���ȣ��', 45678, lodge_no_seq.currval);
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('����� ���۱� ������', '�����ڸ���', 98745, lodge_no_seq.currval);
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('����� ������ �Ǵ뵿', '���������', 85421, lodge_no_seq.currval);
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('����� ��õ�� ���굿', '�߰��ڸ���Ʈ', 96325, lodge_no_seq.currval);
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('����� �ƹ��� ������', '��������ȣ��', 74125, lodge_no_seq.currval);


-- �������̺�
CREATE TABLE RESERVATION
(
	-- �����ȣ
	RESER_NO number NOT NULL,
	-- �����ڸ�
	RESER_NAME varchar2(50) NOT NULL,
	-- �Խǽð�
	CHECK_IN date NOT NULL,
	-- ��ǽð�
	CHECK_OUT date NOT NULL,
	-- �������޴�����ȣ
	RESER_PHONE varchar2(20) NOT NULL,
	-- �湮���� : CHECK�� ��������
	VISIT_TYPE varchar2(20) NOT NULL,
	-- ��������
	RESER_DATE date DEFAULT SYSDATE NOT NULL,
	-- �������
	CANCLE_DATE date DEFAULT SYSDATE,
	-- ��Ҽ�����
	CANCLE_FEE number DEFAULT 0 NOT NULL,
	-- �������� : CHECK
	RESER_TYPE varchar2(20) NOT NULL,
	-- �������� : CHECK
	PAYMENT_TYPE varchar2(20) NOT NULL,
	-- �����ݾ�
	PAYMENT_PRICE number NOT NULL,
	-- ��Ż�ǰ��ȣ
	AUCTION_NO number NOT NULL,
	-- �ֵ��Ϸù�ȣ
	HOTDEAL_NO number NOT NULL,
	-- �����Ϸù�ȣ
	LODGE_NO number NOT NULL,
	-- ȸ���Ϸù�ȣ
	MEMBER_NO number NOT NULL,
	PRIMARY KEY (RESER_NO)
);

--RESERVATION_no_seq ����
create sequence reservation_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;


-- �������̺�
CREATE TABLE ROOM
(
	-- �����Ϸù�ȣ
	ROOM_NO number NOT NULL,
	-- ��������
	ROOM_TYPE varchar2(100) NOT NULL,
	-- �����ο�
	ROOM_PERSON number NOT NULL,
	-- ���ǻ���
	ROOM_PHOTO varchar2(1000),
	-- ���߼��ڰ���
	D_SLEEP_PRICE number NOT NULL,
	-- �ָ����ڰ���
	W_SLEEP_PRICE number NOT NULL,
	-- ���ߴ�ǰ���
	D_RENT_PRICE number NOT NULL,
	-- �ָ���ǰ���
	W_RENT_PRICE number NOT NULL,
	-- �����Ϸù�ȣ
	LODGE_NO number NOT NULL,
	PRIMARY KEY (ROOM_NO)
);

insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, '�����', 4, '��������.jpg', 200000, 180000, 80000, 50000, 2);
insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, 'Ʈ����', 4, '����������.jpg', 180000, 170000, 75000, 45000, 3);
insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, '�𷰽���', 4, '�𷰽�������.jpg', 160000, 150000, 70000, 40000, 4);
insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, '����Ʈ��', 4, '����Ʈ��������.jpg', 150000, 140000, 65000, 35000, 5);
insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, '�̱۷�', 4, '�̱��̽���Ʈ���ѹ�.jpg', 900000, 70000, 50000, 30000, 6);



--room_no_seq ����
create sequence room_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;


-- �������̺�
CREATE TABLE ROOM_ex
(
	-- �����Ϸù�ȣ
	ROOM_NO number,
	-- ��������
	ROOM_TYPE varchar2(100),
	-- �����ο�
	ROOM_PERSON number,
	-- ���ǻ���
	ROOM_PHOTO varchar2(1000),
	-- ���߼��ڰ���
	D_SLEEP_PRICE number,
	-- �ָ����ڰ���
	W_SLEEP_PRICE number,
	-- ���ߴ�ǰ���
	D_RENT_PRICE number,
	-- �ָ���ǰ���
	W_RENT_PRICE number,
	-- �����Ϸù�ȣ
	LODGE_NO number,
	PRIMARY KEY (ROOM_NO)
);
--room ���̵�����
insert into room_ex (room_no, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (1, 100000, 150000, 50000, 75000, 1);
insert into room_ex (room_no, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (2, 75000, 100000, 35000, 50000, 1);
insert into room_ex (room_no, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (3, 90000, 130000, 40000, 75000, 1);


-- �ֺ��ü����̺�
CREATE TABLE SURROUND
(
	-- �ֺ��ü��Ϸù�ȣ
	SURROUND_NO number NOT NULL,
	-- �ֺ��ü���ȣ��
	SURROUND_NAME varchar2(100) NOT NULL,
	-- �ֺ��ü� ��ȭ��ȣ
	SURROUND_TEL varchar2(20) NOT NULL,
	-- �ֺ��ü� ����
	SURROUND_TYPE varchar2(50) NOT NULL,
	-- �ֺ��ü� �ּ�
	SURROUND_ADDR varchar2(200) NOT NULL,
    -- �ֺ��ü� �ּ�
	SURROUND_DETAIL varchar2(100) NOT NULL,
    -- �ֺ��ü� �ּ�
	SURROUND_ZIPCODE NUMBER NOT NULL,
	-- �ֺ��ü� ����
	SURROUND_LAT varchar2(50),
	-- �ֺ��ü� �浵
	SURROUND_LONG varchar2(50),
	PRIMARY KEY (SURROUND_NO)
);
--SURROUND_no_seq ����
create sequence surround_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--�ֺ��ü� ���̺� ���̵�����
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '1����������', '010-1111-1111', '������', '����� 1����', '1����������', 45678);
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '2����ī��', '010-2222-2222', 'ī��', '����� 2����', '2����ī��', 22223);
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '3�����Ĵ�', '010-3333-3333', '�Ĵ�', '����� 3����', '3�����Ĵ�', 33333);
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '4����������', '010-4444-4444', '������', '����� 4����', '4����������', 44444);
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '5����ī��', '010-5555-5555', 'ī��', '����� 5����', '5����ī��', 55555);


-- ������̺�
CREATE TABLE AUCTION
(
	-- ��Ż�ǰ��ȣ
	AUCTION_NO number NOT NULL,
	-- ��Ž��۰�
	START_PRICE number NOT NULL,
	-- ��ų�����
	END_PRICE number,
	-- ����ְ�����
	FINAL_BIDDER varchar2(30),
	-- ���������
	TENDER_COUNT number DEFAULT 0,
	-- �����ȸ��
	AUCTION_HITS number DEFAULT 0,
    -- ��� �����ܰ�
    AUCTION_UNIT number NOT NULL,
	-- ��� ���۽ð�
	AUCTION_STIME date NOT NULL,
	-- ��� ����ð�
	AUCTION_ETIME date NOT NULL,
	-- ��� �������
	AUCTION_REGIDATE date DEFAULT SYSDATE NOT NULL,
	-- ���� �Ϸù�ȣ
	LODGE_NO number NOT NULL,
    -- �� �Ϸù�ȣ
    ROOM_NO number NOT NULL,
    -- üũ��
    check_in date not null,
    -- üũ�ƿ�
    check_out date not null,

	PRIMARY KEY (AUCTION_NO)
);

--auction_no_seq ����
create sequence auction_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--��� ���̵�����
insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 10000, 1, 1000, to_date('20180920000000','yyyy-mm-dd hh24:mi:ss'), to_date('20180921000000','yyyy-mm-dd hh24:mi:ss'),
2, 2, to_date('20181224200000','yyyy-mm-dd hh24:mi:ss'), to_date('20181225140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 8000, 2, 500, to_date('20180921000000','yyyy-mm-dd hh24:mi:ss'), to_date('20180923000000','yyyy-mm-dd hh24:mi:ss'),
3, 3, to_date('20181224200000','yyyy-mm-dd hh24:mi:ss'), to_date('20181225140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 7000, 3, 500, to_date('20180922000000','yyyy-mm-dd hh24:mi:ss'), to_date('20180923000000','yyyy-mm-dd hh24:mi:ss'),
4, 4, to_date('20181224200000','yyyy-mm-dd hh24:mi:ss'), to_date('20181225140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 4, 500, to_date('20180923000000','yyyy-mm-dd hh24:mi:ss'), to_date('20180924000000','yyyy-mm-dd hh24:mi:ss'),
5, 5, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 5, 1000, to_date('20180925000000','yyyy-mm-dd hh24:mi:ss'), to_date('20180928000000','yyyy-mm-dd hh24:mi:ss'),
6, 6, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 5, 1000, sysdate, sysdate,
5, 5, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 5, 1000, sysdate, sysdate,
4, 4, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 5, 1000, sysdate, sysdate,
3, 3, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 5, 1000, sysdate, sysdate,
2, 2, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 5, 1000, to_date('20180902180000','yyyy-mm-dd hh24:mi:ss'), to_date('20180902180100','yyyy-mm-dd hh24:mi:ss'),
3, 3, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 5, 1000, to_date('20180902180000','yyyy-mm-dd hh24:mi:ss'), to_date('20180902180010','yyyy-mm-dd hh24:mi:ss'),
4, 4, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 5, 1000, to_date('20180902175100','yyyy-mm-dd hh24:mi:ss'), to_date('20180902175110','yyyy-mm-dd hh24:mi:ss'),
5, 5, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

insert into auction(auction_no, start_price, tender_count, auction_unit, auction_stime, auction_etime, lodge_no, room_no, check_in, check_out)
values(auction_no_seq.nextval, 5000, 5, 1000, to_date('20180902183500','yyyy-mm-dd hh24:mi:ss'), to_date('20180902183510','yyyy-mm-dd hh24:mi:ss'),
6, 6, to_date('20181231200000','yyyy-mm-dd hh24:mi:ss'), to_date('20190101140000','yyyy-mm-dd hh24:mi:ss'));

-- ���Ex���̺�
CREATE TABLE AUCTION_ex
(
	-- ��Ż�ǰ��ȣ
	AUCTION_NO number,
	-- ��Ž��۰�
	START_PRICE number,
	-- ��ų�����
	END_PRICE number,
	-- ����ְ�����
	FINAL_BIDDER varchar2(30),
	-- ���������
	TENDER_COUNT number DEFAULT 0,
	-- �����ȸ��
	AUCTION_HITS number DEFAULT 0,
	-- �����Ϸù�ȣ
	LODGE_NO number,
	-- ��Ž��۽ð�
	AUCTION_STIME date,
	-- �������ð�
	AUCTION_ETIME date,
	-- ��ŵ������
	AUCTION_REGIDATE date DEFAULT SYSDATE NOT NULL,
    -- �����������
	AUCTION_UNIT NUMBER,
    -- üũ�νð�
    AUCTION_CHECK_IN DATE,
    -- üũ�ƿ��ð�
    AUCTION_CHECK_OUT DATE,
    
	PRIMARY KEY (AUCTION_NO)
);

drop table auction_ex;
commit;
-- member_no ����
alter table auction drop column member_no; 
commit;
--auction ���� ������
insert into auction_ex values(8, 1000, 0, '-', 500, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate);  
insert into auction_ex values(9, 2000, 0, '-', 1000, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(10, 3000, 0, '-', 1000, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(11, 4000, 0, '-', 500, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(12, 1000, 0, '-', 1500, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(13, 2000, 0, '-', 500, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(14, 3000, 0, '-', 1000, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 


-- �ֵ����̺�
CREATE TABLE HOTDEAL
(
	-- �ֵ��Ϸù�ȣ
	HOTDEAL_NO number NOT NULL,
	-- �ֵ����۽ð�
	HOTDEAL_STIME date NOT NULL,
	-- �ֵ������ð�
	HOTDEAL_ETIME date NOT NULL,
	-- �ֵ�����ݾ�
	HOTDEAL_PRICE number NOT NULL,
	-- �ֵ����Ű��ɼ���
	HOTDEAL_BUY number NOT NULL,
	-- �ֵ��Ǹż���
	HOTDEAL_SELL number DEFAULT 0,
	-- �ֵ��������
	HOTDEAL_DATE date DEFAULT SYSDATE,
	-- �ֵ���������
	HOTDEAL_SDAY date NOT NULL,
	-- �ֵ����������
	HOTDEAL_EDAY date NOT NULL,
	-- �����Ϸù�ȣ
	LODGE_NO number NOT NULL,
    -- ���Ϸù�ȣ
	ROOM_NO number NOT NULL,
	PRIMARY KEY (HOTDEAL_NO)
);
--hotdeal_no_seq ����
create sequence hotdeal_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

insert into hotdeal(hotdeal_no, hotdeal_stime, hotdeal_etime, hotdeal_price, hotdeal_buy, hotdeal_sday, hotdeal_eday, lodge_no, room_no)
values(hotdeal_no_seq.nextval, to_date('20180901120000','yyyy-mm-dd hh24:mi:ss'), to_date('20180902120000','yyyy-mm-dd hh24:mi:ss'),
57000, 10, '2018-09-30', '2018-10-30', 2, 2);
insert into hotdeal(hotdeal_no, hotdeal_stime, hotdeal_etime, hotdeal_price, hotdeal_buy, hotdeal_sday, hotdeal_eday, lodge_no, room_no)
values(hotdeal_no_seq.nextval, to_date('20180901120000','yyyy-mm-dd hh24:mi:ss'), to_date('20180902000000','yyyy-mm-dd hh24:mi:ss'),
73000, 6, '2018-09-30', '2018-10-30', 3, 3);
insert into hotdeal(hotdeal_no, hotdeal_stime, hotdeal_etime, hotdeal_price, hotdeal_buy, hotdeal_sday, hotdeal_eday, lodge_no, room_no)
values(hotdeal_no_seq.nextval, to_date('20180902120000','yyyy-mm-dd hh24:mi:ss'), to_date('20180903120000','yyyy-mm-dd hh24:mi:ss'),
77000, 5, '2018-09-30', '2018-11-30', 4, 4);
insert into hotdeal(hotdeal_no, hotdeal_stime, hotdeal_etime, hotdeal_price, hotdeal_buy, hotdeal_sday, hotdeal_eday, lodge_no, room_no)
values(hotdeal_no_seq.nextval, to_date('20180903060000','yyyy-mm-dd hh24:mi:ss'), to_date('20180903180000','yyyy-mm-dd hh24:mi:ss'),
87000, 4, '2018-10-30', '2018-11-30', 5, 5);
insert into hotdeal(hotdeal_no, hotdeal_stime, hotdeal_etime, hotdeal_price, hotdeal_buy, hotdeal_sday, hotdeal_eday, lodge_no, room_no)
values(hotdeal_no_seq.nextval, to_date('20180904120000','yyyy-mm-dd hh24:mi:ss'), to_date('20180905120000','yyyy-mm-dd hh24:mi:ss'),
45000, 3, '2018-11-30', '2018-12-30', 6, 6);


-- �����������̺�
CREATE TABLE NOTICE
(
	-- ���������Ϸù�ȣ
	NOTICE_NO number NOT NULL,
	-- �������� ����
	NOTICE_TITLE varchar2(100) NOT NULL,
	-- �������� ����
	NOTICE_CONTENTS varchar2(4000) NOT NULL,
	-- �������� �������
	NOTICE_REGIDATE date DEFAULT SYSDATE,
	-- �������� �ۼ���
	NOTICE_NAME varchar2(50) NOT NULL,
	PRIMARY KEY (NOTICE_NO)
);

--notice_no_seq ����
create sequence notice_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--�������� ���̵�����
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '��������1�Դϴ�', '��������1�� �����Դϴ�.', '������');
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '��������2�Դϴ�', '��������2�� �����Դϴ�.', '������');
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '��������3�Դϴ�', '��������3�� �����Դϴ�.', '������');
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '��������4�Դϴ�', '��������4�� �����Դϴ�.', '������');
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '��������5�Դϴ�', '��������5�� �����Դϴ�.', '������');


-- �̿��ı����̺�
CREATE TABLE REVIEW
(
	-- �̿��ı��Ϸù�ȣ
	REVIEW_NO number NOT NULL,
	-- �̿��ı�����
	REVIEW_SCORE varchar2(10) NOT NULL,
	-- �̿��ı⳻��
	REVIEW_CONTENTS varchar2(500) NOT NULL,
	-- �̿��ı�÷������
	REVIEW_PHOTO varchar2(1000),
	-- �̿��ı��ۼ�����
	REVIEW_DATE date DEFAULT SYSDATE,
	-- �����Ϸù�ȣ
	LODGE_NO number NOT NULL,
	PRIMARY KEY (REVIEW_NO)
);

--review_no_seq ����
create sequence review_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;


/* Create Foreign Keys */


ALTER TABLE AUCTION
	ADD FOREIGN KEY (LODGE_NO)
	REFERENCES LODGE (LODGE_NO)
;


ALTER TABLE HOTDEAL
	ADD FOREIGN KEY (LODGE_NO)
	REFERENCES LODGE (LODGE_NO)
;


ALTER TABLE LODGE_ADDR
	ADD FOREIGN KEY (LODGE_NO)
	REFERENCES LODGE (LODGE_NO)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (LODGE_NO)
	REFERENCES LODGE (LODGE_NO)
;


ALTER TABLE REVIEW
	ADD FOREIGN KEY (LODGE_NO)
	REFERENCES LODGE (LODGE_NO)
;


ALTER TABLE ROOM
	ADD FOREIGN KEY (LODGE_NO)
	REFERENCES LODGE (LODGE_NO)
;



ALTER TABLE LEAVE_MEMBER
	ADD FOREIGN KEY (MEMBER_NO)
	REFERENCES Member (MEMBER_NO)
;


ALTER TABLE RESERVATION
	ADD FOREIGN KEY (MEMBER_NO)
	REFERENCES Member (MEMBER_NO)
;


-- ����¡ó���� ������ ����Ʈ����
select * from 
    (select Tb.*, rownum rNum from 
        (select * from 
            auction_ex A inner join lodge_ex L 
            on A.lodge_no=L.lodge_no
            inner join room_ex R 
            on L.lodge_no=R.lodge_no
        order by auction_no desc ) Tb ) where rNum between 1 and 15;

commit;

-- �Ųٷ� ī��Ʈ�ٿ��� �ϱ����� ���̵�����

insert into auction_ex values(16, 1000, 0, '-', 500, 1, 1, to_char(sysdate,'YYYYMMDDHH24MISS'), '2018/12/31/', sysdate, 1000, sysdate, sysdate);  

select (auction_etime-auction_stime)*24*60*60 from auction_ex where auction_no=1;

INSERT INTO auction (auction_no, start_price, lodge_no, auction_stime, auction_etime,
				auction_regidate, auction_unit, auction_check_in, auction_check_out)
				VALUES(
				auction_seq.nextval, 1000, 1, 
				TO_DATE(sysdate,'yyyy-mm-dd hh24:mi:ss'),
				TO_DATE(sysdate,'yyyy-mm-dd hh24:mi:ss'),
				TO_DATE(sysdate,'yyyy-mm-dd'),
				1000,
				TO_DATE(sysdate,'yyyy-mm-dd hh24:mi:ss'),
				TO_DATE(sysdate,'yyyy-mm-dd hh24:mi:ss');
                
--�ð����� �������� ���� ������
select to_char(auction_check_out,'yyyy-mm-dd hh24:mi:ss') from auction_ex;

SELECT * FROM (SELECT Tb.*,((auction_etime-auction_stime)*24*60*60) as remain_time_sec, rownum rNum  FROM 
    (SELECT * FROM auction_ex A 
        inner join lodge_ex L on A.lodge_no=L.lodge_no 
        inner join room_ex R on A.room_no=R.room_no
    ORDER BY auction_no DESC) Tb ) WHERE rNum BETWEEN 1 and 5;
    
--Auction_ex�� room_no �߰�

alter table auction_ex add room_no number;
--auction_ex�� room_no ������ �߰�
update auction_ex set room_no = 1 where auction_no=1;
update auction_ex set room_no = 2 where auction_no=2;
update auction_ex set auction_etime = '18/9/1' where auction_no=2;
commit;

rollback;

show recyclebin;
flashback table auction to before drop;

update auction set tender_count = 31 where auction_no=2;
update auction set tender_count = 10 where auction_no=3;
update auction set tender_count = 13 where auction_no=4;
update auction set tender_count = 74 where auction_no=5;
update auction set tender_count = 5 where auction_no=6;

update auction set auction_etime = to_date(20181010, 'yyyy-mm-dd hh24:mi:ss') where auction_no=2;

select * from (select TB.*, ((auction_etime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum 
    from (select * from auction A inner join lodge L on A.lodge_no=L.lodge_no inner join room R on A.room_no=R.room_no order by tender_count desc) Tb ) where rNum between 1 and 6;


select to_char(start_price, '999,999,999') from auction;

select to_char((auction_stime-sysdate),'yy"�� "mm"�� "dd"�� "hh24"�ð� "mi"�� " ss"�� "') from auction;

SELECT *  FROM (    SELECT Tb.*, ((auction_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM (        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no 			inner join room R on A.room_no=R.room_no ORDER BY auction_no DESC     ) Tb) WHERE (rNum BETWEEN 1 and 5) and (auction_etime-sysdate)<=0; 
SELECT *  FROM (    SELECT Tb.*, trunc((auction_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM (        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no 			inner join room R on A.room_no=R.room_no ORDER BY auction_no DESC     ) Tb) WHERE (rNum BETWEEN 1 and 5)  and (auction_etime-sysdate) <=0;
SELECT *  FROM (    SELECT Tb.*, trunc((auction_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM (        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no 			inner join room R on A.room_no=R.room_no ORDER BY auction_no DESC     ) Tb) WHERE (rNum BETWEEN 1 and 6)  and (auction_etime-sysdate)>0 ;
commit;

SELECT COUNT(*) FROM auction WHERE 1=1 AND (auction_etime-sysdate)>0 ;

sELECT *  FROM (    SELECT Tb.*, ((auction_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM (        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no 			inner join room R on A.room_no=R.room_no where (auction_etime-sysdate) > 0 ORDER BY auction_no DESC     ) Tb) WHERE rNum BETWEEN 1 and 10  ;
