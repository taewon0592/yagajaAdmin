--계정만들기
create user yagaja identified by 1119;

--권한부여하기
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

-- 야가자회원테이블
CREATE TABLE Member
(
	-- 회원일련번호
	MEMBER_NO number NOT NULL,
	-- 회원아이디
	ID varchar2(50) NOT NULL,
	-- 패스워드
	PASS varchar2(50) NOT NULL,
	-- 닉네임
	NICKNAME varchar2(30) NOT NULL,
	-- 핸드폰번호
	PHONE varchar2(20) NOT NULL,
	-- 마일리지
	M_POINT number DEFAULT 0,
	-- 이메일
	EMAIL varchar2(70) NOT NULL,
	-- 회원가입일
	REGIDATE date DEFAULT sysdate,
	-- 권한설정 : DEFUALT USER
	AUTHORITY varchar2(30) DEFAULT 'user',
	PRIMARY KEY (MEMBER_NO)
);

--member_no_seq 생성
create sequence member_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--Member테이블 더미데이터
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate, authority) 
values(member_no_seq.nextval, 'admin', '1119', '프리덤', '010-8580-1119', 10000, 'test1', sysdate, 'admin');
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member2', '7809', '부조장', '010-9122-7809', 9000, 'test2', sysdate);
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member3', '3012', '막내', '010-9960-3012', 8000, 'test3', sysdate);
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member4', '2505', '써니', '010-6479-2505', 7000, 'test4', sysdate);
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member5', '3456', 'new란', '010-6742-3456', 6000, 'test5', sysdate);
insert into member (member_no, id, pass, nickname, phone, m_point, email, regidate) 
values(member_no_seq.nextval, 'member6', '4331', '글로리', '010-3154-4331', 5000, 'test6', sysdate);


-- 탈퇴회원테이블
CREATE TABLE LEAVE_MEMBER
(
	-- 탈퇴사유
	LEAVE_REASON varchar2(500),
	-- 세부내용
	LEAVE_REASON2 varchar2(1000),
	-- 탈퇴일
	LEAVE_DATE date DEFAULT sysdate NOT NULL,
	-- 회원일련번호
	MEMBER_NO number NOT NULL,
    ID varchar(50) not null,
    authority varchar2(30) not null
);
-- authority 컬럼 추가
alter table leave_member add authority varchar2(30) not null;



-- 숙박시설테이블
CREATE TABLE LODGE
(
	-- 숙소일련번호
	LODGE_NO number NOT NULL,
	-- 숙소종류
	LODGE_TYPE varchar2(30) NOT NULL,
	-- 숙소명
	LODGE_NAME varchar2(60) NOT NULL,
	-- 숙소전화번호
	LODGE_TEL varchar2(20) NOT NULL,
	-- 숙소방개수
	LODGE_ROOMCOUNT number NOT NULL,
	-- 숙소태그
	LODGE_TAG varchar2(100),
	-- 숙소대표사진
	LODGE_PHOTO varchar2(50) NOT NULL,
	-- 숙소테마
	LODGE_THEMA varchar2(3000),
	-- 숙소간단설명
	LODGE_NOTE varchar2(1000),
	-- 숙소 특징
    LODGE_FEATURE varchar2(200) not null,
	PRIMARY KEY (LODGE_NO)
);

--lodge_no_seq 생성
create sequence lodge_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--숙박시설 더미데이터
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, '호텔', '야가자호텔', '010-1234-5678', 1, '#역근처#우리집처럼', '야가자호텔.jpg', '스파바베큐거울룸', '졸라좋은호텔', '몰카방지');
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, '모텔', '야하자모텔', '010-2345-7890', 1, '#역근처#암꺼나', '야하자모텔.jpg', '미러룸', '졸라좋은모텔', '몰카방지그런거방지'); 
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, '펜션', '야하자펜션', '010-3456-7890', 1, '#역근처#생각안나', '야하자펜션.jpg', '스파', '졸라좋은펜션', '몰카방지아무나입장가능'); 
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, '리조트', '야가자리조트', '010-0123-4567', 1, '#역근처#개좋은', '야가자리조트.jpg', '바베큐', '졸라좋은리조트', '몰카방지뭐가있지'); 
insert into lodge (lodge_no, lodge_type, lodge_name, lodge_tel, lodge_roomcount, lodge_tag, lodge_photo, lodge_thema, lodge_note, lodge_feature)
values (lodge_no_seq.nextval, '모텔', '오빠믿지호텔', '010-5678-9012', 1, '#역근처#걍하자', '오빠믿지모텔.jpg', '거울룸', '오빠믿는모텔', '몰카나도몰라'); 

-- 숙박시설 EX 테이블
CREATE TABLE LODGE_ex
(
	-- 숙소일련번호
	LODGE_NO number NOT NULL,
	-- 숙소종류
	LODGE_TYPE varchar2(30),
	-- 숙소명
	LODGE_NAME varchar2(60),
	-- 숙소전화번호
	LODGE_TEL varchar2(20),
	-- 숙소방개수
	LODGE_ROOMCOUNT number,
	-- 숙소태그
	LODGE_TAG varchar2(100),
	-- 숙소대표사진
	LODGE_PHOTO varchar2(50),
	-- 숙소테마
	LODGE_THEMA varchar2(3000),
	-- 숙소간단설명
	LODGE_NOTE varchar2(1000),
	PRIMARY KEY (LODGE_NO)
);
insert into lodge_ex (lodge_no, lodge_name) values(1, '은서니는팎시');
insert into lodge_ex (lodge_no, lodge_name) values(2, '글로리킴은킴씨');
insert into lodge_ex (lodge_no, lodge_name) values(3, '프리덤은이씨');


-- 숙박시설주소테이블
CREATE TABLE LODGE_ADDR
(
	-- 숙박시설 주소
	ADDR_COMMON varchar2(200) NOT NULL,
	-- 숙박시설 상세주소
	ADDR_DETAIL varchar2(100) NOT NULL,
	-- 숙박시설 우편번호
	ADDR_ZIPCODE number NOT NULL,
	-- 숙박시설위도
	ADDR_LAT varchar2(50),
	-- 숙박시설경도
	ADDR_LONG varchar2(50),
	-- 숙소일련번호
	LODGE_NO number NOT NULL
);

-- 숙박시설 주소 더미데이터
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('서울시 도봉구 그냥동', '야가자호텔', 45678, lodge_no_seq.currval);
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('서울시 동작구 무슨동', '야하자모텔', 98745, lodge_no_seq.currval);
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('서울시 광진구 건대동', '야하자펜션', 85421, lodge_no_seq.currval);
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('서울시 금천구 가산동', '야가자리조트', 96325, lodge_no_seq.currval);
insert into lodge_addr (addr_common, addr_detail, addr_zipcode, lodge_no)
values('서울시 아무구 다음동', '오빠믿지호텔', 74125, lodge_no_seq.currval);


-- 예약테이블
CREATE TABLE RESERVATION
(
	-- 예약번호
	RESER_NO number NOT NULL,
	-- 예약자명
	RESER_NAME varchar2(50) NOT NULL,
	-- 입실시간
	CHECK_IN date NOT NULL,
	-- 퇴실시간
	CHECK_OUT date NOT NULL,
	-- 예약자휴대폰번호
	RESER_PHONE varchar2(20) NOT NULL,
	-- 방문형태 : CHECK로 제약조건
	VISIT_TYPE varchar2(20) NOT NULL,
	-- 예약일자
	RESER_DATE date DEFAULT SYSDATE NOT NULL,
	-- 취소일자
	CANCLE_DATE date DEFAULT SYSDATE,
	-- 취소수수료
	CANCLE_FEE number DEFAULT 0 NOT NULL,
	-- 예약종류 : CHECK
	RESER_TYPE varchar2(20) NOT NULL,
	-- 결제수단 : CHECK
	PAYMENT_TYPE varchar2(20) NOT NULL,
	-- 결제금액
	PAYMENT_PRICE number NOT NULL,
	-- 경매상품번호
	AUCTION_NO number NOT NULL,
	-- 핫딜일련번호
	HOTDEAL_NO number NOT NULL,
	-- 숙소일련번호
	LODGE_NO number NOT NULL,
	-- 회원일련번호
	MEMBER_NO number NOT NULL,
	PRIMARY KEY (RESER_NO)
);

--RESERVATION_no_seq 생성
create sequence reservation_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;


-- 객실테이블
CREATE TABLE ROOM
(
	-- 객실일련번호
	ROOM_NO number NOT NULL,
	-- 객실종류
	ROOM_TYPE varchar2(100) NOT NULL,
	-- 객실인원
	ROOM_PERSON number NOT NULL,
	-- 객실사진
	ROOM_PHOTO varchar2(1000),
	-- 주중숙박가격
	D_SLEEP_PRICE number NOT NULL,
	-- 주말숙박가격
	W_SLEEP_PRICE number NOT NULL,
	-- 주중대실가격
	D_RENT_PRICE number NOT NULL,
	-- 주말대실가격
	W_RENT_PRICE number NOT NULL,
	-- 숙소일련번호
	LODGE_NO number NOT NULL,
	PRIMARY KEY (ROOM_NO)
);

insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, '더블룸', 4, '개좋은방.jpg', 200000, 180000, 80000, 50000, 2);
insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, '트윈룸', 4, '많이좋은방.jpg', 180000, 170000, 75000, 45000, 3);
insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, '디럭스룸', 4, '디럭스좋은방.jpg', 160000, 150000, 70000, 40000, 4);
insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, '스위트룸', 4, '스위트룸좋은방.jpg', 150000, 140000, 65000, 35000, 5);
insert into room (room_no, room_type, room_person, room_photo, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no)
values(room_no_seq.nextval, '싱글룸', 4, '싱글이스위트만한방.jpg', 900000, 70000, 50000, 30000, 6);



--room_no_seq 생성
create sequence room_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;


-- 객실테이블
CREATE TABLE ROOM_ex
(
	-- 객실일련번호
	ROOM_NO number,
	-- 객실종류
	ROOM_TYPE varchar2(100),
	-- 객실인원
	ROOM_PERSON number,
	-- 객실사진
	ROOM_PHOTO varchar2(1000),
	-- 주중숙박가격
	D_SLEEP_PRICE number,
	-- 주말숙박가격
	W_SLEEP_PRICE number,
	-- 주중대실가격
	D_RENT_PRICE number,
	-- 주말대실가격
	W_RENT_PRICE number,
	-- 숙소일련번호
	LODGE_NO number,
	PRIMARY KEY (ROOM_NO)
);
--room 더미데이터
insert into room_ex (room_no, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (1, 100000, 150000, 50000, 75000, 1);
insert into room_ex (room_no, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (2, 75000, 100000, 35000, 50000, 1);
insert into room_ex (room_no, d_sleep_price, w_sleep_price, d_rent_price, w_rent_price, lodge_no) values (3, 90000, 130000, 40000, 75000, 1);


-- 주변시설테이블
CREATE TABLE SURROUND
(
	-- 주변시설일련번호
	SURROUND_NO number NOT NULL,
	-- 주변시설상호명
	SURROUND_NAME varchar2(100) NOT NULL,
	-- 주변시설 전화번호
	SURROUND_TEL varchar2(20) NOT NULL,
	-- 주변시설 종류
	SURROUND_TYPE varchar2(50) NOT NULL,
	-- 주변시설 주소
	SURROUND_ADDR varchar2(200) NOT NULL,
    -- 주변시설 주소
	SURROUND_DETAIL varchar2(100) NOT NULL,
    -- 주변시설 주소
	SURROUND_ZIPCODE NUMBER NOT NULL,
	-- 주변시설 위도
	SURROUND_LAT varchar2(50),
	-- 주변시설 경도
	SURROUND_LONG varchar2(50),
	PRIMARY KEY (SURROUND_NO)
);
--SURROUND_no_seq 생성
create sequence surround_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--주변시설 테이블 더미데이터
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '1번가주유소', '010-1111-1111', '주유소', '서울시 1번가', '1번가주유소', 45678);
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '2번가카페', '010-2222-2222', '카페', '서울시 2번가', '2번가카페', 22223);
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '3번가식당', '010-3333-3333', '식당', '서울시 3번가', '3번가식당', 33333);
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '4번가주유소', '010-4444-4444', '주유소', '서울시 4번가', '4번가주유소', 44444);
insert into surround(surround_no, surround_name, surround_tel, surround_type, surround_addr, surround_detail, surround_zipcode)
values(surround_no_seq.nextval, '5번가카페', '010-5555-5555', '카페', '서울시 5번가', '5번가카페', 55555);


-- 경매테이블
CREATE TABLE AUCTION
(
	-- 경매상품번호
	AUCTION_NO number NOT NULL,
	-- 경매시작가
	START_PRICE number NOT NULL,
	-- 경매낙찰가
	END_PRICE number,
	-- 경매최고낙찰자
	FINAL_BIDDER varchar2(30),
	-- 경매입찰수
	TENDER_COUNT number DEFAULT 0,
	-- 경매조회수
	AUCTION_HITS number DEFAULT 0,
    -- 경매 입찰단가
    AUCTION_UNIT number NOT NULL,
	-- 경매 시작시간
	AUCTION_STIME date NOT NULL,
	-- 경매 종료시간
	AUCTION_ETIME date NOT NULL,
	-- 경매 등록일자
	AUCTION_REGIDATE date DEFAULT SYSDATE NOT NULL,
	-- 숙소 일련번호
	LODGE_NO number NOT NULL,
    -- 룸 일련번호
    ROOM_NO number NOT NULL,
    -- 체크인
    check_in date not null,
    -- 체크아웃
    check_out date not null,

	PRIMARY KEY (AUCTION_NO)
);

--auction_no_seq 생성
create sequence auction_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--경매 더미데이터
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

-- 경매Ex테이블
CREATE TABLE AUCTION_ex
(
	-- 경매상품번호
	AUCTION_NO number,
	-- 경매시작가
	START_PRICE number,
	-- 경매낙찰가
	END_PRICE number,
	-- 경매최고낙찰자
	FINAL_BIDDER varchar2(30),
	-- 경매입찰수
	TENDER_COUNT number DEFAULT 0,
	-- 경매조회수
	AUCTION_HITS number DEFAULT 0,
	-- 숙소일련번호
	LODGE_NO number,
	-- 경매시작시간
	AUCTION_STIME date,
	-- 경매종료시간
	AUCTION_ETIME date,
	-- 경매등록일자
	AUCTION_REGIDATE date DEFAULT SYSDATE NOT NULL,
    -- 경매입찰단위
	AUCTION_UNIT NUMBER,
    -- 체크인시간
    AUCTION_CHECK_IN DATE,
    -- 체크아웃시간
    AUCTION_CHECK_OUT DATE,
    
	PRIMARY KEY (AUCTION_NO)
);

drop table auction_ex;
commit;
-- member_no 삭제
alter table auction drop column member_no; 
commit;
--auction 더미 데이터
insert into auction_ex values(8, 1000, 0, '-', 500, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate);  
insert into auction_ex values(9, 2000, 0, '-', 1000, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(10, 3000, 0, '-', 1000, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(11, 4000, 0, '-', 500, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(12, 1000, 0, '-', 1500, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(13, 2000, 0, '-', 500, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 
insert into auction_ex values(14, 3000, 0, '-', 1000, 1, 1, sysdate, sysdate, sysdate, 1000, sysdate, sysdate); 


-- 핫딜테이블
CREATE TABLE HOTDEAL
(
	-- 핫딜일련번호
	HOTDEAL_NO number NOT NULL,
	-- 핫딜시작시간
	HOTDEAL_STIME date NOT NULL,
	-- 핫딜마감시간
	HOTDEAL_ETIME date NOT NULL,
	-- 핫딜적용금액
	HOTDEAL_PRICE number NOT NULL,
	-- 핫딜구매가능수량
	HOTDEAL_BUY number NOT NULL,
	-- 핫딜판매수량
	HOTDEAL_SELL number DEFAULT 0,
	-- 핫딜등록일자
	HOTDEAL_DATE date DEFAULT SYSDATE,
	-- 핫딜사용시작일
	HOTDEAL_SDAY date NOT NULL,
	-- 핫딜사용종료일
	HOTDEAL_EDAY date NOT NULL,
	-- 숙소일련번호
	LODGE_NO number NOT NULL,
    -- 룸일련번호
	ROOM_NO number NOT NULL,
	PRIMARY KEY (HOTDEAL_NO)
);
--hotdeal_no_seq 생성
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


-- 공지사항테이블
CREATE TABLE NOTICE
(
	-- 공지사항일련번호
	NOTICE_NO number NOT NULL,
	-- 공지사항 제목
	NOTICE_TITLE varchar2(100) NOT NULL,
	-- 공지사항 내용
	NOTICE_CONTENTS varchar2(4000) NOT NULL,
	-- 공지사항 등록일자
	NOTICE_REGIDATE date DEFAULT SYSDATE,
	-- 공지사항 작성자
	NOTICE_NAME varchar2(50) NOT NULL,
	PRIMARY KEY (NOTICE_NO)
);

--notice_no_seq 생성
create sequence notice_no_seq
increment by 1
start with 1
minvalue 1
nomaxvalue
nocycle
nocache;

--공지사항 더미데이터
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '공지사항1입니다', '공지사항1의 내용입니다.', '관리자');
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '공지사항2입니다', '공지사항2의 내용입니다.', '관리자');
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '공지사항3입니다', '공지사항3의 내용입니다.', '관리자');
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '공지사항4입니다', '공지사항4의 내용입니다.', '관리자');
insert into notice(notice_no, notice_title, notice_contents, notice_name)
values(notice_no_seq.nextval, '공지사항5입니다', '공지사항5의 내용입니다.', '관리자');


-- 이용후기테이블
CREATE TABLE REVIEW
(
	-- 이용후기일련번호
	REVIEW_NO number NOT NULL,
	-- 이용후기평점
	REVIEW_SCORE varchar2(10) NOT NULL,
	-- 이용후기내용
	REVIEW_CONTENTS varchar2(500) NOT NULL,
	-- 이용후기첨부파일
	REVIEW_PHOTO varchar2(1000),
	-- 이용후기작성일자
	REVIEW_DATE date DEFAULT SYSDATE,
	-- 숙소일련번호
	LODGE_NO number NOT NULL,
	PRIMARY KEY (REVIEW_NO)
);

--review_no_seq 생성
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


-- 페이징처리를 포함한 리스트보기
select * from 
    (select Tb.*, rownum rNum from 
        (select * from 
            auction_ex A inner join lodge_ex L 
            on A.lodge_no=L.lodge_no
            inner join room_ex R 
            on L.lodge_no=R.lodge_no
        order by auction_no desc ) Tb ) where rNum between 1 and 15;

commit;

-- 거꾸로 카운트다운을 하기위한 더미데이터

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
                
--시간까지 나오는지 보는 쿼리문
select to_char(auction_check_out,'yyyy-mm-dd hh24:mi:ss') from auction_ex;

SELECT * FROM (SELECT Tb.*,((auction_etime-auction_stime)*24*60*60) as remain_time_sec, rownum rNum  FROM 
    (SELECT * FROM auction_ex A 
        inner join lodge_ex L on A.lodge_no=L.lodge_no 
        inner join room_ex R on A.room_no=R.room_no
    ORDER BY auction_no DESC) Tb ) WHERE rNum BETWEEN 1 and 5;
    
--Auction_ex에 room_no 추가

alter table auction_ex add room_no number;
--auction_ex에 room_no 데이터 추가
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

select to_char((auction_stime-sysdate),'yy"년 "mm"월 "dd"일 "hh24"시간 "mi"분 " ss"초 "') from auction;

SELECT *  FROM (    SELECT Tb.*, ((auction_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM (        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no 			inner join room R on A.room_no=R.room_no ORDER BY auction_no DESC     ) Tb) WHERE (rNum BETWEEN 1 and 5) and (auction_etime-sysdate)<=0; 
SELECT *  FROM (    SELECT Tb.*, trunc((auction_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM (        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no 			inner join room R on A.room_no=R.room_no ORDER BY auction_no DESC     ) Tb) WHERE (rNum BETWEEN 1 and 5)  and (auction_etime-sysdate) <=0;
SELECT *  FROM (    SELECT Tb.*, trunc((auction_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM (        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no 			inner join room R on A.room_no=R.room_no ORDER BY auction_no DESC     ) Tb) WHERE (rNum BETWEEN 1 and 6)  and (auction_etime-sysdate)>0 ;
commit;

SELECT COUNT(*) FROM auction WHERE 1=1 AND (auction_etime-sysdate)>0 ;

sELECT *  FROM (    SELECT Tb.*, ((auction_stime-sysdate)*24*60*60) AS remain_time_sec, rownum rNum FROM (        SELECT * FROM auction A inner join lodge L on A.lodge_no=L.lodge_no 			inner join room R on A.room_no=R.room_no where (auction_etime-sysdate) > 0 ORDER BY auction_no DESC     ) Tb) WHERE rNum BETWEEN 1 and 10  ;
