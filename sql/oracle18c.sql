
DROP TABLE MBRLVL01M01;

CREATE TABLE MBRLVL01M01
(
MEMBR_LV_PK NUMBER NOT NULL,
MEMBR_LV_HIGH_GROUP_NAME VARCHAR2(50) NOT NULL,
MEMBR_LV_GROUP_NAME VARCHAR2(50) NOT NULL,
MEMBR_LV_NAME VARCHAR2(50) NOT NULL,
MEMBR_LV_DCNT_RT NUMBER(5,4) NOT NULL,
MEMBR_LV_ACCUM_RT NUMBER(5,4) NOT NULL,
MEMBR_LV_COND_PRC_MIN NUMBER(15) DEFAULT 0,
MEMBR_LV_COND_PRC_MAX NUMBER(15) DEFAULT 0,
MEMBR_LV_COND_PRC_STAND NUMBER(15) DEFAULT 0,
MEMBR_LV_VALID_PEROD_VALUE NUMBER(10),
MEMBR_LV_VALID_PEROD_TP VARCHAR2(50),
MEMBR_LV_GIVE_POINT_RT NUMBER(5,4) DEFAULT 0,
MEMBR_LV_RGST_DTMS DATE NOT NULL,
MEMBR_LV_MDFY_DTMS DATE,
MEMBR_LV_STAT_DEL NUMBER(1) DEFAULT 0 NOT NULL,
MEMBR_LV_SUR_1 VARCHAR2(100),
CONSTRAINT MEMBR_LV_PK PRIMARY KEY (MEMBR_LV_PK)
);



INSERT INTO MBRLVL01M01
(
MEMBR_LV_PK,
MEMBR_LV_HIGH_GROUP_NAME,
MEMBR_LV_GROUP_NAME,
MEMBR_LV_NAME,
MEMBR_LV_DCNT_RT,
MEMBR_LV_ACCUM_RT,
MEMBR_LV_COND_PRC_MIN,
MEMBR_LV_COND_PRC_MAX,
MEMBR_LV_COND_PRC_STAND,
MEMBR_LV_VALID_PEROD_VALUE,
MEMBR_LV_VALID_PEROD_TP,
MEMBR_LV_GIVE_POINT_RT,
MEMBR_LV_RGST_DTMS
)
VALUES
(
1,
'A-CLUB MEMBER',
'GENERAL',
'일반',
0,
0.05,
0,
0,
0,
99999,
'year',
0,
SYSDATE
);
INSERT INTO MBRLVL01M01
(
MEMBR_LV_PK,
MEMBR_LV_HIGH_GROUP_NAME,
MEMBR_LV_GROUP_NAME,
MEMBR_LV_NAME,
MEMBR_LV_DCNT_RT,
MEMBR_LV_ACCUM_RT,
MEMBR_LV_COND_PRC_MIN,
MEMBR_LV_COND_PRC_MAX,
MEMBR_LV_COND_PRC_STAND,
MEMBR_LV_VALID_PEROD_VALUE,
MEMBR_LV_VALID_PEROD_TP,
MEMBR_LV_GIVE_POINT_RT,
MEMBR_LV_RGST_DTMS
)
VALUES
(
2,
'A-CLUB MEMBER',
'GOLD',
'PARTNERS',
0.05,
0,
100000,
1000000,
10000,
1,
'year',
0.2,
SYSDATE
);
INSERT INTO MBRLVL01M01
(
MEMBR_LV_PK,
MEMBR_LV_HIGH_GROUP_NAME,
MEMBR_LV_GROUP_NAME,
MEMBR_LV_NAME,
MEMBR_LV_DCNT_RT,
MEMBR_LV_ACCUM_RT,
MEMBR_LV_COND_PRC_MIN,
MEMBR_LV_COND_PRC_MAX,
MEMBR_LV_COND_PRC_STAND,
MEMBR_LV_VALID_PEROD_VALUE,
MEMBR_LV_VALID_PEROD_TP,
MEMBR_LV_GIVE_POINT_RT,
MEMBR_LV_RGST_DTMS
)
VALUES
(
3,
'A-CLUB MEMBER',
'PLATINUM',
'FOUNDERS',
0,
0.2,
10000000,
30000000,
1000000,
99999,
'year',
0.2,
SYSDATE
);
commit ;

select * from JOBS;

-- 메뉴 추가 옵션 TB
CREATE TABLE CMNSFM01M02
(
    FOOD_OPT_PK NUMBER(10) not null,
    FOOD_OPT_TP VARCHAR2(100) not null ,
    FOOD_OPT_PRIC NUMBER(10) not null,
    FOOD_OPT_NAME_KR VARCHAR2(100) not null,
    FOOD_OPT_NAME_EN VARCHAR2(100) not null,
    FOOD_OPT_USE NUMBER(1) not null,
    FOOD_OPT_RGST_DTMS DATE not null,
    FOOD_OPT_STAT_DEL NUMBER(1) DEFAULT 0 not null,
    FOOD_OPT_SUR_1 VARCHAR(100),
    CONSTRAINT FOOD_OPT_PK PRIMARY KEY(FOOD_OPT_PK)
);
CREATE SEQUENCE FOOD_OPT_SEQ;


-- 음식 할인 유형 테이블
CREATE TABLE CMNFDZ01M01
(
    BRCH_FOOD_DCNT_PK NUMBER(10) not null ,
    BRCH_FOOD_DCNT_TP VARCHAR2(50) not null ,
    BRCH_FOOD_DCNT_RT NUMBER(1,4),
    BRCH_FOOD_DCNT_AMT NUMBER(8),
    BRCH_FOOD_DCNT_RGST_DTMS DATE not null ,
    BRCH_FOOD_DCNT_STAT_DEL NUMBER(1) DEFAULT 0 not null ,
    BRCH_FOOD_DCNT_SUR_1 VARCHAR2(100),
    CONSTRAINT BRCH_FOOD_DCNT_PK PRIMARY KEY (BRCH_FOOD_DCNT_PK)
);
CREATE SEQUENCE BRCH_FOOD_DCNT_SEQ;

-- 지점 식당 메뉴 TB
CREATE TABLE BRCMNU01M01
(
    BRCH_MENU_PK NUMBER(10) not null ,      --지점 식당 메뉴 pk
    BRCH_PK NUMBER(10) not null ,       --지점 PK
    BRCH_FOOD_PK NUMBER(10) not null ,      --식당 (단일)음식 PK
    BRCH_FDSET_PK NUMBER(10) not null ,     --식당 세트 음식 PK
    BRCH_MENU_TP VARCHAR2(50) not null ,        --메뉴 유형 (단일 / 세트)
    BRCH_MENU_RGST_DTMS DATE not null ,     --등록일
    BRCH_MENU_STAT_DEL NUMBER(10) DEFAULT 0 not null,       --상태
    BRCH_MENU_SUR_1 VARCHAR2(100),      --임시
    CONSTRAINT BRCH_MENU_PK PRIMARY KEY (BRCH_MENU_PK)
);
CREATE SEQUENCE BRCH_MENU_SEQ;

-- 식당에서 테이블당 주문 TB
CREATE TABLE RSTODR01M01(
    BRCH_TABL_ORDR_PK NUMBER(10) not null ,     --지점 테이블주문 PK
    BRCH_TABL_PK NUMBER(10) not null ,      --지점 테이블 PK - 전체 매장 테이블당 pk 부여
    BRCH_PK NUMBER(10) not null ,       --지점 PK
    BRCH_TABL_NO VARCHAR2(50) not null,     --지점에서 부여(관리)하는 테이블 번호
    BRCH_TABL_ORDR_ALL_PRC NUMBER(10) not null ,        --테이블 주문 총 가격
    BRCH_TABL_ORDR_SETL_STAT NUMBER(1) default 0 not null ,     --(결제) 상태
    BRCH_TABL_ORDR_RGST_DTMS DATE not null ,        --등록일
    BRCH_TABL_ORDR_STAT_DEL NUMBER(10) DEFAULT 0 not null ,     --상태
    BRCH_TABL_ORDR_SUR_1 VARCHAR2(100),     --임시
    CONSTRAINT BRCH_TABL_ORDR_PK PRIMARY KEY (BRCH_TABL_ORDR_PK)
);
CREATE SEQUENCE BRCH_TABL_ORDR_SEQ;
DROP table RSTODR01M01;

-- 식당주문상세 TB
CREATE TABLE RSTODR01M02
(
    TABL_ORDR_DTIL_PK NUMBER(10) not null ,     --지점주문상세 PK
    BRCH_TABL_ORDR_PK NUMBER(10) not null ,     --지점 테이블주문 PK
    TABL_ORDR_DTIL_CNT NUMBER(10) not null ,        --개수
    TABL_ORDR_DTIL_ALL_PRC_BEF_SALES NUMBER(10) not null ,       --총 가격 (할인전)
    TABL_ORDR_DTIL_STAT NUMBER(1) default 0 not null ,        --상태구분
    TABL_ORDR_DTIL_ALL_PRC_AFT_SALES NUMBER(10) ,       --총 가격 (할인후)
    TABL_ORDR_DTIL_RQST VARCHAR2(200) ,     --고객 요청사항
    TABL_ORDR_DTIL_RGST_DTMS DATE not null ,        --등록일
    TABL_ORDR_DTIL_STAT_DEL NUMBER(1) DEFAULT 0 not null ,      --상태
    TABL_ORDR_DTIL_SUR_1 VARCHAR2(100),     --임시
    CONSTRAINT TABL_ORDR_DTIL_PK PRIMARY KEY (TABL_ORDR_DTIL_PK)
);
CREATE SEQUENCE TABL_ORDR_DTIL_SEQ;
DROP TABLE RSTODR01M02;

-- App(온라인) 주문 상세 TB
CREATE TABLE OLNORD01M02
(
    ONLN_FOOD_ORDR_DTIL_PK NUMBER(10) not null ,        --앱(온라인) 주문 상세 PK
    BRCH_MENU_PK NUMBER(10) not null ,      --지점 식당 메뉴 pk
    ONLN_FOOD_ORDR_DTIL_CNT NUMBER(8) not null ,        --개수
    ONLN_FOOD_ORDR_DTIL_ALL_PRC_BEF_SALES NUMBER(10) not null ,     --총 가격 (할인전)
    ONLN_FOOD_ORDR_DTIL_ALL_PRC_AFT_SALES NUMBER(10) ,      --총 가격 (할인후)
    ONLN_FOOD_ORDR_DTIL_RQST VARCHAR2(200) ,        --고객 요청사항
    ONLN_FOOD_ORDR_RGST_DTMS DATE not null ,        --등록일
    ONLN_FOOD_ORDR_STAT_DEL NUMBER(1) DEFAULT 0 not null ,      --상태
    ONLN_FOOD_ORDR_SUR_1 VARCHAR2(100),     --임시
    CONSTRAINT ONLN_FOOD_ORDR_DTIL_PK PRIMARY KEY (ONLN_FOOD_ORDR_DTIL_PK)
);
CREATE SEQUENCE ONLN_FOOD_ORDR_DTIL_SEQ;

-- 추가 옵션 로그 테이블
CREATE TABLE CMNSFM01L02
(
    FOOD_OPT_LOG_PK NUMBER not null ,       --추가 옵션 로그 PK
    FOOD_OPT_LOG_TRGT_COL VARCHAR2(100) not null ,      --변경 대상 컬럼
    FOOD_OPT_LOG_MDFY_BEF VARCHAR2(2000) not null ,     --변경 전 값
    FOOD_OPT_LOG_MDFY_AFT VARCHAR2(2000) not null ,     --변경 후 값
    ADM_ID VARCHAR2(200) not null ,     --관리자 ID
    FOOD_OPT_LOG_RGST_DTMS DATE not null ,      --등록일시
    FOOD_OPT_LOG_STAT_DEL NUMBER(1) DEFAULT 0 not null ,        --상태
    FOOD_OPT_LOG_SUR_1 VARCHAR2(100),       --임시
    Constraint FOOD_OPT_LOG_PK PRIMARY KEY (FOOD_OPT_LOG_PK)
);
CREATE SEQUENCE FOOD_OPT_LOG_SEQ;


-- 음식 할인 유형 로그
CREATE TABLE CMNFDZ01L01
(
    RSTRT_FOOD_DCNT_LOG_PK NUMBER not null ,        --할인 유형 로그 PK
    RSTRT_FOOD_DCNT_LOG_TRGT_COL VARCHAR2(100) not null ,       --변경 대상 컬럼
    RSTRT_FOOD_DCNT_LOG_MDFY_BEF VARCHAR2(2000) not null ,      --변경 전 값
    RSTRT_FOOD_DCNT_LOG_MDFY_AFT VARCHAR2(2000) not null ,      --변경 후 값
    ADM_ID VARCHAR2(200) not null ,     --관리자 ID
    RSTRT_FOOD_DCNT_LOG_RGST_DTMS DATE not null ,       --등록일시
    RSTRT_FOOD_DCNT_LOG_STAT_DEL NUMBER(1) DEFAULT 0 not null ,     --상태
    RSTRT_FOOD_DCNT_LOG_SUR_1 VARCHAR2(100) ,       --임시
    CONSTRAINT RSTRT_FOOD_DCNT_LOG_PK PRIMARY KEY (RSTRT_FOOD_DCNT_LOG_PK)
);
CREATE SEQUENCE RSTRT_FOOD_DCNT_LOG_SEQ;

-- 지점 식당 메뉴 로그 TB
CREATE TABLE BRCMNU01L01
(
    BRCH_MENU_LOG_PK NUMBER not null ,      --지점 식당 메뉴 로그 PK
    BRCH_MENU_LOG_TRGT_COL VARCHAR2(100) not null ,     --변경 대상 컬럼
    BRCH_MENU_LOG_MDFY_BEF VARCHAR2(2000) not null ,        --변경 전 값
    BRCH_MENU_LOG_MDFY_AFT VARCHAR2(2000) not null ,        --변경 후 값
    ADM_ID VARCHAR2(200) not null ,     --관리자 ID
    BRCH_MENU_LOG_RGST_DTMS DATE not null ,     --등록일시
    BRCH_MENU_LOG_STAT_DEL NUMBER(1) DEFAULT 0 not null ,       --상태
    BRCH_MENU_LOG_SUR_1 VARCHAR2(100) ,     --임시
    CONSTRAINT BRCH_MENU_LOG_PK PRIMARY KEY (BRCH_MENU_LOG_PK)
);
CREATE SEQUENCE BRCH_MENU_LOG_SEQ;


-- ######################################
-- 지점 테이블
CREATE TABLE CMNTBL01M01
(
    BRCH_TABL_PK  NUMBER(10)  NOT NULL,     --지점 테이블 PK
    BRCH_PK  NUMBER(10)  NOT NULL,      --지점 PK
    BRCH_TABL_NO  VARCHAR2(30)  NOT NULL,       --테이블 번호(식당에서 부여)
    BRCH_TABL_TP  VARCHAR2(20)  NOT NULL,       --테이블 타입+유형(Room/Hall)
    BRCH_TABL_ABLE_CNT  NUMBER(2)  NOT NULL,        --테이블당 가능(허용) 인원
    BRCH_TABL_STAT  VARCHAR2(20)  NOT NULL,     --현재 상태 유형
    BRCH_TABL_LOC  VARCHAR2(10)  NOT NULL,      --테이블위치
    BRCH_TABL_COLS  NUMBER(2)  NOT NULL,        --테이블 가로크기
    BRCH_TABL_ROWS  NUMBER(2)  NOT NULL,        --테이블 세로크기
    BRCH_TABL_LOC_FLOOR  NUMBER(2)  NOT NULL,       --층수 (floor)
    BRCH_TABL_RGST_DTMS  DATE  NOT NULL,        --등록일시
    BRCH_TABL_STAT_DEL  NUMBER(1)  DEFAULT 0  NOT NULL,     --상태
    BRCH_TABL_SUR_1  VARCHAR2(100),     --임시
    CONSTRAINT BRCH_TABL_PK PRIMARY KEY (BRCH_TABL_PK)
);
CREATE SEQUENCE BRCH_TABL_SEQ;

select * from CMNTBL01M01;
select BRCH_TABL_RGST_DTMS from CMNTBL01M01 where BRCH_PK = 1;


-- 단일 음식 TB
CREATE TABLE RSTSFM01M01
(
    BRCH_FOOD_PK   NUMBER(10) NOT NULL,     --지점 (단일)음식 PK
    BRCH_PK   NUMBER(10) NOT NULL,      --지점 PK
    FOOD_PK   NUMBER(10) NOT NULL,      --음식 PK
    EVNT_CATGR_PK   NUMBER(10) NOT NULL,        --이벤트 카테고리 PK
    BRCH_FOOD_DCNT_PK   NUMBER(10) NOT NULL,        --할인유형 PK
    BRCH_FOOD_SPLY_PRC   NUMBER(12)  DEFAULT 0  NOT NULL,       --공급가격
    BRCH_FOOD_SALES_PRC   NUMBER(12)  DEFAULT 0  NOT NULL,      --판매가격
    BRCH_FOOD_ABLE   NUMBER(1)  DEFAULT 0  NOT NULL,        --판매 여부 (재주문여부)
    BRCH_FOODU_INVEN_CNT   NUMBER(10)  DEFAULT 0  NOT NULL,     --재고 수량
    BRCH_FOOD_CNT_ORDR_ONLN   NUMBER(10)  DEFAULT 0  NOT NULL,      --주문개수(온라인주문)
    BRCH_FOOD_CNT_ORDR_BRCH   NUMBER(10)  DEFAULT 0  NOT NULL,      --주문개수(매장주문)
    BRCH_FOOD_RGST_DTMS   DATE NOT NULL,        --지점 메뉴 등록 일시
    BRCH_FOOD_MDFY_DTMS   DATE,     --지점 메뉴 수정 일시
    BRCH_FOOD_STAT_DEL   NUMBER(1)  DEFAULT 0 NOT NULL,     --상태
    BRCH_FOOD_SUR_1   VARCHAR2(100),        --임시
    CONSTRAINT BRCH_FOOD_PK PRIMARY KEY (BRCH_FOOD_PK)
);
CREATE SEQUENCE BRCH_FOOD_SEQ;-- 단일 음식 TB

CREATE TABLE RSTSFM01M01
(
    BRCH_FOOD_PK   NUMBER(10) NOT NULL,     --지점 (단일)음식 PK
    BRCH_PK   NUMBER(10) NOT NULL,      --지점 PK
    FOOD_PK   NUMBER(10) NOT NULL,      --음식 PK
    EVNT_CATGR_PK   NUMBER(10) NOT NULL,        --이벤트 카테고리 PK
    BRCH_FOOD_DCNT_PK   NUMBER(10) NOT NULL,        --할인유형 PK
    BRCH_FOOD_SPLY_PRC   NUMBER(12)  DEFAULT 0  NOT NULL,       --공급가격
    BRCH_FOOD_SALES_PRC   NUMBER(12)  DEFAULT 0  NOT NULL,      --판매가격
    BRCH_FOOD_ABLE   NUMBER(1)  DEFAULT 0  NOT NULL,        --판매 여부 (재주문여부)
    BRCH_FOODU_INVEN_CNT   NUMBER(10)  DEFAULT 0  NOT NULL,     --재고 수량
    BRCH_FOOD_CNT_ORDR_ONLN   NUMBER(10)  DEFAULT 0  NOT NULL,      --주문개수(온라인주문)
    BRCH_FOOD_CNT_ORDR_BRCH   NUMBER(10)  DEFAULT 0  NOT NULL,      --주문개수(매장주문)
    BRCH_FOOD_RGST_DTMS   DATE NOT NULL,        --지점 메뉴 등록 일시
    BRCH_FOOD_MDFY_DTMS   DATE,     --지점 메뉴 수정 일시
    BRCH_FOOD_STAT_DEL   NUMBER(1)  DEFAULT 0 NOT NULL,     --상태
    BRCH_FOOD_SUR_1   VARCHAR2(100),        --임시
    CONSTRAINT BRCH_FOOD_PK PRIMARY KEY (BRCH_FOOD_PK)
);
CREATE SEQUENCE BRCH_FOOD_SEQ;


-- 세트음식 TB
CREATE TABLE RSTMFM01M01
(
   BRCH_FDSET_PK   NUMBER(10) NOT NULL,     --지점 세트 음식 PK
   BRCH_PK   NUMBER(10) NOT NULL,       --지점 PK
   BRCH_FDSET_ONLY   NUMBER(10) NOT NULL,       --(지점) 전용 세트 여부
   FOOD_CATGR_PK   NUMBER(10) NOT NULL,     --음식카테고리 PK
   EVNT_CATGR_PK   NUMBER(10) NOT NULL,     --이벤트 카테고리 PK
   BRCH_FOOD_DCNT_PK   NUMBER(10) NOT NULL,     --할인유형 PK
   BRCH_FDSET_SPLY_PRC   NUMBER(12)  DEFAULT 0  NOT NULL,       --공급가격
   BRCH_FDSET_SALES_PRC   NUMBER(12)  DEFAULT 0  NOT NULL,      --판매가격
   BRCH_FDSET_ABLE   NUMBER(1)  DEFAULT 0  NOT NULL,        --판매 여부 (재주문여부)
   BRCH_FDSET_INVEN_CNT   NUMBER(10)  DEFAULT 0  NOT NULL,      --재고 수량
   BRCH_FDSET_CNT_ORDR_ONLN   NUMBER(10)  DEFAULT 0  NOT NULL,      --주문개수(온라인주문)
   BRCH_FDSET_CNT_ORDR_BRCH   NUMBER(10)  DEFAULT 0  NOT NULL,      --주문개수(매장주문)
   BRCH_FDSET_PRC_DFT   NUMBER(10)  DEFAULT 0  NOT NULL,        --세트 메뉴 가격
   BRCH_FDSET_NAME_KR   VARCHAR2(100) NOT NULL,     --세트 메뉴 이름 (한글)
   BRCH_FDSET_NAME_EN   VARCHAR2(100) NOT NULL,     --세트 메뉴 이름 (영문)
   BRCH_FDSET_DSCR_KR   VARCHAR2(100) NOT NULL,     --세트 메뉴 설명 (한글)
   BRCH_FDSET_DSCR_EN   VARCHAR2(100) NOT NULL,     --세트 메뉴 설명 (영문)
   BRCH_FDSET_RGST_DTMS   DATE    NOT NULL,     --지점 메뉴 등록 일시
   BRCH_FDSET_MDFY_DTMS   DATE,     --지점 메뉴 수정 일시
   FOOD_MAREA_LOG_STAT_DEL   NUMBER(1)  DEFAULT 0  NOT NULL,        --상태
   FOOD_MAREA_LOG_SUR_1   VARCHAR2(100),        --임시
   CONSTRAINT BRCH_FDSET_PK PRIMARY KEY (BRCH_FDSET_PK)
);
CREATE SEQUENCE BRCH_FDSET_SEQ;


-- 음식 TB
CREATE TABLE CMNSFM01M01
(
    FOOD_PK    NUMBER(10) NOT NULL,     --음식 PK
    FOOD_NAME_KR    VARCHAR2(100) NOT NULL,     --음식 이름 (한글)
    FOOD_NAME_EN    VARCHAR2(50) NOT NULL,      --음식 이름 (영문)
    FOOD_CATGR_PK    NUMBER(4) NOT NULL,        --음식카테고리 PK
    FOOD_DSCR_KR    VARCHAR2(1000),     --설명 (한글)
    FOOD_DSCR_EN    VARCHAR2(500),      --설명 (영문)
    FOOD_PRICE_DFT    NUMBER(12) NOT NULL,      --음식 가격
    FOOD_RGST_DTMS    DATE NOT NULL,        --등록일시
    FOOD_MDFY_DTMS    DATE,     --수정일시
    FOOD_STAT_DEL     NUMBER(1) DEFAULT 0 NOT NULL,     --상태
    FOOD_SUR_1     VARCHAR2(100),       --임시
    CONSTRAINT FOOD_PK PRIMARY KEY (FOOD_PK)
);
CREATE SEQUENCE FOOD_SEQ;

-- 지점 정보
CREATE TABLE BRCINF01M01
(
    BRCH_PK NUMBER(12) NOT NULL,
    BRCH_NAME VARCHAR2(1000) NOT NULL,
    BRCH_ADDR VARCHAR2(1000) NOT NULL,
    BRCH_TELE VARCHAR2(15) NOT NULL,
    BRCH_STAT VARCHAR2(10) NOT NULL,
    BRCH_FLOOR NUMBER(2) NOT NULL ,
    BRCH_RGST_DTMS DATE,
    BRCH_STAT_DEL NUMBER(1) DEFAULT 0  NOT NULL,
    BRCH_SUR1 VARCHAR2(100) ,
    CONSTRAINT BRCH_PK PRIMARY KEY (BRCH_PK)
);
CREATE SEQUENCE BRCH_PK;
DROP TABLE BRCINF01M01;

comment on table CMNTBL01M01 is '지점 테이블';


create table MNUHIS01M01
(
    MENU_HIST_PK NUMBER(12) not null,   -- 주문 상세 메뉴 내역 PK
    TABL_ORDR_DTIL_PK NUMBER(12) not null ,     -- 지점주문상세 PK
    MENU_HIST_TP VARCHAR2(50) not null, -- 지점주문상세 PK
    MENU_HIST_SPLY_PRC NUMBER(12) not null, -- 단일/세트
    MENU_HIST_SALES_PRC NUMBER(12) not null,    -- 공급가격
    MENU_HIST_CNT_ORDR_ONLN NUMBER(2) not null, -- 판매가격
    MENU_HIST_CNT_ORDR_BRCH NUMBER(2) not null, -- 주문개수(온라인주문)
    MENU_HIST_FOOD_NAME_KR VARCHAR2(1000) not null, -- 주문개수(매장주문)
    MENU_HIST_FOOD_NAME_EN VARCHAR2(500) not null,  -- 음식 이름 (한글)
    MENU_HIST_FOOD_DSCR_KR VARCHAR2(1000) not null, -- 음식 이름 (영문)
    MENU_HIST_FOOD_DSCR_EN VARCHAR2(500) not null,  -- 설명 (한글)
    MENU_HIST_PRICE_DFT NUMBER(12) not null,    -- 설명 (영문)
    MENU_HIST_RGST_DTMS DATE not null,  -- 메뉴 가격
    MENU_HIST_STAT_DEL NUMBER(1) default 0 not null,    -- 등록일시
    MENU_HIST_SUR_1 VARCHAR2(100),  -- 상태
    CONSTRAINT MENU_HIST_PK PRIMARY KEY (MENU_HIST_PK)
);
CREATE SEQUENCE MENU_HIST_PK;
drop table MNUHIS01M01;


-- ## 지점 예약 테이블 ##
CREATE TABLE RSTRSV01M01
(
    BRCH_RESRV_PK  NUMBER(10)  NOT NULL,
    BRCH_TABL_PK  NUMBER(10)  NOT NULL,
    BRCH_PK  NUMBER(10)  NOT NULL,
    MEMBR_PK  NUMBER,
    BRCH_RESRV_IDX  NUMBER(12)  NOT NULL,
    BRCH_RESRV_MTIME_TP  VARCHAR2(20)  NOT NULL,
    BRCH_RESRV_PERS_CNT  NUMBER(3)  NOT NULL,
    BRCH_RESRV_PERS_NAME  VARCHAR2(20)  NOT NULL,
    BRCH_RESRV_PERS_TEL  VARCHAR2(20)  NOT NULL,
    BRCH_RESRV_STAT  VARCHAR2(20)  NOT NULL,
    BRCH_RESRV_WAY_TP  VARCHAR2(20)  NOT NULL,
    BRCH_RESRV_REACH_DTMS  DATE,
    BRCH_RESRV_RGST_DTMS  DATE  NOT NULL,
    BRCH_RESRV_STAT_DEL  NUMBER(1)  DEFAULT 0  NOT NULL,
    BRCH_RESRV_SUR_1  VARCHAR2(100),
    BRCH_RESRV_MEMO VARCHAR2(500),
    BRCH_RESRV_CANCL_MEMO VARCHAR2(500),
    BRCH_RESRV_PERS_APPR VARCHAR2(20),
    BRCH_RESRV_APPR VARCHAR2(20) ,
    CONSTRAINT BRCH_RESRV_PK PRIMARY KEY (BRCH_RESRV_PK)
);

CREATE SEQUENCE BRCH_RESRV_SEQ;


-- ## 예약 히스토리 테이블 ##
drop table RSTRSV01H01;
CREATE TABLE RSTRSV01H01
(
    BRCH_RESRV_HIST_PK NUMBER NOT NULL,
    BRCH_RESRV_PK  NUMBER  NOT NULL,
    BRCH_TABL_PK  NUMBER(10)  NOT NULL,
    BRCH_PK  NUMBER  NOT NULL,
    BRCH_RESRV_MTIME_TP  VARCHAR2(20)  NOT NULL,
    BRCH_RESRV_PERS_CNT  NUMBER(3)  NOT NULL,
    BRCH_RESRV_PERS_NAME  VARCHAR2(20)  NOT NULL,
    BRCH_RESRV_PERS_TEL  VARCHAR2(20)  NOT NULL,
    BRCH_RESRV_REACH_DTMS  DATE NOT NULL ,
    BRCH_RESRV_MEMO VARCHAR2(500),
    BRCH_RESRV_PERS_APPR VARCHAR2(20),
    BRCH_RESRV_DEPOS_STAT NUMBER(2),
    BRCH_RESRV_MDFY_DTMS DATE ,
    BRCH_RESRV_STAT  VARCHAR2(20)  NOT NULL,
    BRCH_RESRV_STAT_DEL  NUMBER(1)  DEFAULT 0  NOT NULL,
    BRCH_RESRV_APPR VARCHAR2(20) ,
    BRCH_RESRV_SUR_1 VARCHAR2(100),
    BRCH_RESRV_HIST_RGST_DTMS DATE NOT NULL ,
    CONSTRAINT BRCH_RESRV_HIST_PK PRIMARY KEY (BRCH_RESRV_HIST_PK)
);

CREATE SEQUENCE BRCH_RESRV_HIST_SEQ;


-- ## 입금 내역 테이블 ##
drop table RSVPYM01M01;
CREATE TABLE RSVPYM01M01
(
    RESRV_DEPOS_PK NUMBER NOT NULL ,
    BRCH_RESRV_PK NUMBER NOT NULL ,
    BRCH_PK NUMBER NOT NULL ,
    RESRV_DEPOS_AMT NUMBER(8)NOT NULL ,
    RESRV_SETL_CANCL_AMT NUMBER(8) ,
    RESRV_DEPOS_PAYM_TP VARCHAR2(50) NOT NULL ,
    RESRV_SETL_DEPOS_STAT NUMBER(1) NOT NULL ,
    RESRV_DEPOS_RGST_DTMS DATE NOT NULL ,
    CONSTRAINT RESRV_DEPOS_PK PRIMARY KEY (RESRV_DEPOS_PK)
);

commit ;

drop SEQUENCE RESRV_DEPOS_SEQ;
CREATE SEQUENCE RESRV_DEPOS_SEQ;



-- ###############################
-- BRCMNU01M01 (지점 식당 메뉴), RSTSFM01M01 (지점 단일 음식), CMNSFM01M01 (음식) , CMNTBL01M01(지점테이블)
-- RSTODR01M01 (식당에서 테이블당 주문), RSTODR01M02 (식당주문 상세)

SELECT * FROM RSTODR01M01 t_o, RSTODR01M02 r_o_d, BRCMNU01M01 b_m WHERE BRCH_TABL_PK = 2;
select * from RSTODR01M01 where BRCH_TABL_PK=2;

-- 식당에서 테이블당 주문
select BRCH_TABL_NO as 테이블이름, BRCH_TABL_ORDR_ALL_PRC as 테이블_주문_총_가격, BRCH_TABL_ORDR_SETL_STAT as 결제상태
from RSTODR01M01
where BRCH_TABL_PK=2 AND BRCH_PK = 1;

-- 지점 식당메뉴
select BRCH_FOOD_PK as 식당단일음식pk, BRCH_MENU_TP as 메뉴유형 from BRCMNU01M01 where BRCH_PK = 1;

-- 지점 단일 음식
select * from RSTSFM01M01;


-- 음식
select * from CMNSFM01M01;
select FOOD_PK 음식pk, FOOD_NAME_KR as 음식, FOOD_DSCR_KR as 설명, FOOD_PRICE_DFT as 가격  from CMNSFM01M01;


-- 테이블이름, 메뉴명, 옵션(?), 가격, 총가격, (할인?)
SELECT * FROM RSTODR01M01 WHERE brch_tabl_pk = 2;

select * from RSTODR01M02;

-- 잔여 테이블
SELECT * FROM CMNTBL01M01 지점테이블;
SELECT COUNT(*) FROM CMNTBL01M01 지점테이블
WHERE BRCH_TABL_STAT_DEL = 0 AND BRCH_TABL_PK NOT IN (SELECT BRCH_TABL_PK FROM RSTODR01M01 식당에서테이블당주문 WHERE BRCH_TABL_ORDR_STAT_DEL = 0 AND BRCH_TABL_ORDR_SETL_STAT = 0);

-- 식사 중 테이블
select count(*) from RSTODR01M01 WHERE BRCH_TABL_ORDR_STAT_DEL = 0 AND BRCH_TABL_ORDR_SETL_STAT = 0 and BRCH_PK = 1;

-- 전체테이블 조회
SELECT count(*) FROM CMNTBL01M01 WHERE BRCH_PK = 1 AND BRCH_TABL_STAT_DEL = 0;

-- 지점 단일음식이랑, 음식 join 하기
select r.FOOD_PK 음식pk, c.FOOD_NAME_KR, c.FOOD_DSCR_KR, r.BRCH_FOOD_SALES_PRC 지점판매가격 from RSTSFM01M01 r, CMNSFM01M01 c where  r.FOOD_PK = 1 and c.FOOD_PK = 1;


--
SELECT * FROM RSTODR01M02 WHERE TABL_ORDR_DTIL_STAT_DEL = 0 AND brch_tabl_ordr_pk = 12;


-- 테이블의 주문내역 조회하기
SELECT * FROM MNUHIS01M01 WHERE menu_hist_stat_del = 0 AND tabl_ordr_dtil_pk = 113;

 -- BRCH_TABL_PK로 조회
select * from RSTODR01M01;
select * from RSTODR01M01 where BRCH_TABL_ORDR_SETL_STAT=1;

-- RSTODR01M01 여기에서 BRCH_TABL_ORDR_PK 빼와서 조회하기
select * from RSTODR01M02;
select * from RSTODR01M02 where  BRCH_TABL_ORDR_PK =12;


-- 주문 내역들~~
select * from MNUHIS01M01;
SELECT * FROM MNUHIS01M01 WHERE menu_hist_stat_del = 0 AND tabl_ordr_dtil_pk = 113;


-- 식사 중인 테이블 조회
SELECT rm.BRCH_TABL_PK brch_tabl_pk, rm.BRCH_TABL_ORDR_PK brch_tabl_ordr_pk, rm2.TABL_ORDR_DTIL_PK tabl_ordr_dtil_pk, rm.BRCH_TABL_ORDR_RGST_DTMS brch_tabl_ordr_rgst_dtms, rm.BRCH_TABL_ORDR_ALL_PRC brch_tabl_ordr_all_prc
FROM RSTODR01M01 rm, RSTODR01M02 rm2
WHERE rm.BRCH_TABL_ORDR_PK = rm2.BRCH_TABL_ORDR_PK
AND rm.BRCH_TABL_ORDR_STAT_DEL = 0
AND rm.BRCH_TABL_ORDR_SETL_STAT = 0 --  결제 완료 여부 확인
AND rm.BRCH_PK = 1;

-- 식사 중인 테이블 체크 checkEatTable
select count(*)
from RSTODR01M01
WHERE
    BRCH_TABL_ORDR_STAT_DEL = 0
    AND BRCH_TABL_ORDR_SETL_STAT = 0
    AND BRCH_TABL_PK = 122
    AND BRCH_PK = 1;


-- 당일 매출 조회하기
SELECT SUM(brch_tabl_ordr_all_prc) 총당일매출
FROM RSTODR01M01
WHERE brch_tabl_ordr_setl_stat = 1
AND brch_tabl_ordr_stat_del = 0
AND brch_pk = 1
AND TO_CHAR(brch_tabl_ordr_rgst_dtms, 'yyyy-mm-dd') = '2021-11-25';


-- 총 매출 조회하기  (당일 매출 추가해야함)
select * from RSTODR01M01 where BRCH_TABL_PK = 4 and BRCH_TABL_ORDR_SETL_STAT = 1; -- 결제 완료 여부 체크하기


-- ##################################
-- ######## 예약 관련 ###############
select c.BRCH_TABL_NO from CMNTBL01M01 c;
select * from RSTRSV01M01 where BRCH_PK = 1 and BRCH_RESRV_STAT_DEL = 0;
select c.BRCH_TABL_NO, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK;

-- 전체 예약 요청 조회 sListRSTRSV01M01ByRev2
select * from
              (select c.BRCH_TABL_NO, r.* from CMNTBL01M01 c, RSTRSV01M01 r
                where c.BRCH_TABL_PK = r.BRCH_TABL_PK and c.BRCH_TABL_LOC_FLOOR = 1)
where
      BRCH_PK = 1
        and BRCH_RESRV_STAT_DEL = 0
        and (BRCH_RESRV_STAT = 0 or BRCH_RESRV_DEPOS_STAT = 1)
order by BRCH_RESRV_REACH_DTMS;


-- 해당 날짜 예약 신청 내역 조회 (예약 거부, 예약 완료 빼고 조회) sListReservApplyByBrchpk
select * from
              (select c.BRCH_TABL_NO, r.* from CMNTBL01M01 c, RSTRSV01M01 r
                where c.BRCH_TABL_PK = r.BRCH_TABL_PK and c.BRCH_TABL_LOC_FLOOR = 1)
where BRCH_PK = 1 and BRCH_RESRV_STAT_DEL = 0 and BRCH_RESRV_STAT = 0
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-09 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-10 14:59:59', 'YYYY-MM-DD hh24:mi:ss')
order by to_number(BRCH_TABL_NO), BRCH_RESRV_MTIME_TP desc, BRCH_RESRV_RGST_DTMS ;

select * from
              (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.* from CMNTBL01M01 c, RSTRSV01M01 r
                where c.BRCH_TABL_PK = r.BRCH_TABL_PK and c.BRCH_TABL_LOC_FLOOR = 1)
where
      BRCH_PK = 1
        and BRCH_RESRV_STAT_DEL = 0
        and (BRCH_RESRV_STAT = 0 or BRCH_RESRV_DEPOS_STAT = 1)
        and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-03-06 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-03-07 14:59:59', 'YYYY-MM-DD hh24:mi:ss')
order by BRCH_RESRV_RGST_DTMS;
-- ------------------------------------------------------------------------------


-- 예약 완료 시키기
update RSTRSV01M01 set BRCH_RESRV_STAT = 1
where BRCH_RESRV_PK = 1;

-- 예약 거부 및 예약 완료시키기 (1,7,3 pk 에서 7번 빼고 거부)
update RSTRSV01M01 set BRCH_RESRV_STAT_DEL = 1
where BRCH_RESRV_PK in (1, 3);

select * from RSTRSV01M01 where BRCH_RESRV_PK in (1,3);

-- 해당 날짜 예약 완료 조회 sListReservCompleteByBrchpk
select * from
              (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK and c.BRCH_TABL_LOC_FLOOR = 1)
    where
          BRCH_PK = 1
            and BRCH_RESRV_STAT = 1
            and BRCH_RESRV_STAT_DEL = 0
            and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-03-16 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-03-17 15:00:00', 'YYYY-MM-DD hh24:mi:ss')
order by BRCH_RESRV_REACH_DTMS;



-- select * from
--               (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK and c.BRCH_TABL_LOC_FLOOR = 1)
-- where BRCH_PK = 1 and BRCH_RESRV_STAT_DEL = 0
--     and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-03-16 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-03-17 14:59:59', 'YYYY-MM-DD hh24:mi:ss')
--     and (
--         BRCH_RESRV_STAT = 1
--         or
--         (BRCH_RESRV_STAT = 0 and BRCH_RESRV_DEPOS_STAT = 1)
--         )
-- order by BRCH_RESRV_REACH_DTMS;

-- ---------------------------------------------------------


-- 예약 거부내역 조회
select * from (select c.BRCH_TABL_NO, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where BRCH_PK = 1 and BRCH_RESRV_STAT = 0 and BRCH_RESRV_STAT_DEL = 1 and BRCH_RESRV_REACH_DTMS like TO_DATE('2021-12-23', 'YYYY-MM-DD')
order by BRCH_RESRV_MTIME_TP desc;

-- 해당날짜 예약 거부 내역 조회 UTC 적용 층수 적용 sListReservRejectByBrchpk
select * from
            (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK and c.BRCH_TABL_LOC_FLOOR = 1)
where BRCH_PK = 1 and BRCH_RESRV_STAT = 0 and BRCH_RESRV_STAT_DEL = 1
and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-03-07 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-03-08 14:59:59', 'YYYY-MM-DD hh24:mi:ss')
order by BRCH_RESRV_MTIME_TP desc;


-- 예약 테이블 별로 조회하기
select * from RSTRSV01M01 where BRCH_TABL_PK = 11 and BRCH_RESRV_STAT = 1 and BRCH_RESRV_STAT_DEL = 0;

select * from (select c.BRCH_TABL_NO, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where BRCH_PK = 1 and BRCH_TABL_PK = 11 and BRCH_RESRV_STAT = 1 and BRCH_RESRV_STAT_DEL = 0;


-- 예약 완료 내역 수정
update RSTRSV01M01
set BRCH_TABL_PK = 11,
    BRCH_RESRV_MTIME_TP = 'D',
    BRCH_RESRV_PERS_CNT = 3,
    BRCH_RESRV_PERS_NAME = '박고객3',
    BRCH_RESRV_PERS_TEL = '010-9999-9999',
    BRCH_RESRV_REACH_DTMS = TO_DATE('2021-11-22 1733', 'yyyy-mm-dd hh24miss'),
    BRCH_RESRV_MEMO = '예약 수정요',
    BRCH_RESRV_PERS_APPR= '관리자1'
where BRCH_RESRV_PK = 4;
rollback ;


select * from BRCINF01M01;

comment on table RSTMFM01M01 is '지점 세트 음식';
-- #########

-- 예약하기 (전화 예약) 비회원으로 일단 처리 MEMBR_PK 뺌 iTellReserve
insert into RSTRSV01M01
    (BRCH_RESRV_PK, BRCH_TABL_PK, BRCH_PK,  BRCH_RESRV_IDX, BRCH_RESRV_MTIME_TP, BRCH_RESRV_PERS_CNT, BRCH_RESRV_PERS_NAME, BRCH_RESRV_PERS_TEL,
     BRCH_RESRV_STAT, BRCH_RESRV_WAY_TP, BRCH_RESRV_REACH_DTMS, BRCH_RESRV_RGST_DTMS, BRCH_RESRV_MEMO,
     BRCH_RESRV_PERS_APPR)
values (BRCH_RESRV_SEQ.nextval, --BRCH_RESRV_PK
        8, --BRCH_TABL_PK 테이블 pk
        1, -- BRCH_PK 지점 pk
        'R' || BRCH_RESRV_IDX_SEQ.nextval, -- BRCH_RESRV_IDX (예약일련번호 현재 정해지지 x)
        'D', -- BRCH_RESRV_MTIME_TP (런치 or 디너)
        3, -- BRCH_RESRV_PERS_CNT (예약 인원)
        '바바바', -- BRCH_RESRV_PERS_NAME (예약자명)
        '010-9999-8888', -- BRCH_RESRV_PERS_TEL (연락처)
        1, -- BRCH_RESRV_STAT (예약 상태)
        '전화예약', -- BRCH_RESRV_WAY_TP(예약방법)
        TO_DATE('2021-12-30 17:30', 'YYYY-MM-DD hh24:mi:ss'), -- BRCH_RESRV_REACH_DTMS(예약날짜)
        sysdate, -- BRCH_RESRV_RGST_DTMS (예약 등록날짜)
        '예약 메모 메모', -- BRCH_RESRV_MEMO (메모)
        '관리자22' -- BRCH_RESRV_PERS_APPR (승인자)
        );
commit ;


-- ############### 유효성 검사!!!! #####################
-- 예약 insert 유효성 검사 checkInsertReserve  (depos stat 고려해야하나?????????????)
select count(*) from RSTRSV01M01
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 1
  and (BRCH_RESRV_DEPOS_STAT = 0 or BRCH_RESRV_DEPOS_STAT = 2 or BRCH_RESRV_DEPOS_STAT = 5)
  and BRCH_PK = 1
  and BRCH_RESRV_MTIME_TP = 'D' -- 변수
  and BRCH_TABL_PK = 125 -- 변수
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-02-08 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-02-09 14:59:59', 'YYYY-MM-DD hh24:mi:ss');

-- 예약 insert 유효성 검사 ###입금대기### 검사
select count(*) from RSTRSV01M01
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 0
  and BRCH_PK = 1
  and BRCH_RESRV_MTIME_TP = 'L' -- 변수
  and BRCH_TABL_PK = 121 -- 변수
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-09 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-10 14:59:59', 'YYYY-MM-DD hh24:mi:ss');



-- 예약 승인시 유효성 검사 (같은 런치 or 디너에 있는지 검사하기), 테이블 자리이동에서도 사용  checkApplyReserve
select * from RSTRSV01M01
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 1
  and BRCH_PK = 1 -- 변수
  and BRCH_RESRV_MTIME_TP = 'L' -- 변수
  and  BRCH_TABL_PK = 124 -- 변수
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-09 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-10 14:59:59', 'YYYY-MM-DD hh24:mi:ss');

-- 예약 승인시 ###입금대기### 중 유효성 검사 (같은 런치 or 디너에 있는지 검사하기)
select * from RSTRSV01M01
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 0
  and BRCH_RESRV_DEPOS_STAT = 1
  and BRCH_PK = 1
  and BRCH_RESRV_MTIME_TP = 'L' -- 변수
  and  BRCH_TABL_PK = 124 -- 변수
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-09 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-10 14:59:59', 'YYYY-MM-DD hh24:mi:ss');


select * from RSTRSV01M01 where BRCH_RESRV_PK = 1062 and BRCH_RESRV_STAT = 0;





-- ###############################################
-- ################# 앱 관련 #####################
-- 앱 투어에서 예약 가능 확인 (날짜, 테이블pk, 지점pk 받기)  checkTourRserve
select * from RSTRSV01M01
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 1
  and BRCH_PK = 1 -- 변수
  and BRCH_TABL_PK = 127 -- 변수 8, 20, 16
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-09 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-10 14:59:59', 'YYYY-MM-DD hh24:mi:ss');


-- 앱에서 월 단위 예약 관련 조회 checkTableMonthRserve
select * from (select c.BRCH_TABL_NO, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 1
  and BRCH_PK = 1 --변수
  and  BRCH_TABL_PK = 127 -- 변수
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-09 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-10 14:59:59', 'YYYY-MM-DD hh24:mi:ss');



-- 앱에서 회원 예약 완료내역 조회  sMemberReseveCompleteList
select * from (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 1
  and (BRCH_RESRV_DEPOS_STAT = 0 or BRCH_RESRV_DEPOS_STAT = 2 or BRCH_RESRV_DEPOS_STAT = 5)
  and BRCH_PK = 1 --변수
  and MEMBR_PK = 21 -- 변수
order by BRCH_RESRV_REACH_DTMS;

select * from (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 1
  and BRCH_RESRV_DEPOS_STAT in (0, 2, 5)
  and BRCH_PK = 1 --변수
  and MEMBR_PK = 221 -- 변수
order by BRCH_RESRV_REACH_DTMS;


-- 앱에서 회원 예약 신청내역 조회 sMemberReserveApplyList (룸 에약신청 - 입금요청 전(0, 1) ,입금대기 상태(1, 1) / 홀 예약신청(0, 0) - BRCH_RESRV_STAT, BRCH_RESRV_DEPOS_STAT)
select * from (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where BRCH_RESRV_STAT_DEL = 0
  and (BRCH_RESRV_STAT = 0
  or (BRCH_RESRV_STAT=1 and BRCH_RESRV_DEPOS_STAT = 1))
  and BRCH_PK = 1 --변수
  and MEMBR_PK = 21 -- 변수
order by BRCH_RESRV_REACH_DTMS;


-- 앱에서 회원 예약 거부 및 취소내역 조회 sMemberReserveCancelList - BRCH_RESRV_APPR 예약 거부 상태 (1:노쇼거부,  2:완료후 취소,  3:승인 전 거부)
select * from (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where BRCH_RESRV_STAT_DEL = 1
  and BRCH_PK = 1 --변수
  and MEMBR_PK = 21 -- 변수
order by BRCH_RESRV_REACH_DTMS;




-- 앱에서 예약 요청하기  iAppReserve
insert into RSTRSV01M01
    (BRCH_RESRV_PK, BRCH_TABL_PK, BRCH_PK, MEMBR_PK, BRCH_RESRV_IDX, BRCH_RESRV_MTIME_TP, BRCH_RESRV_PERS_CNT, BRCH_RESRV_PERS_NAME, BRCH_RESRV_PERS_TEL,
     BRCH_RESRV_STAT, BRCH_RESRV_WAY_TP, BRCH_RESRV_REACH_DTMS, BRCH_RESRV_RGST_DTMS, BRCH_RESRV_MEMO)
values (BRCH_RESRV_SEQ.nextval, --BRCH_RESRV_PK
        8, --BRCH_TABL_PK 테이블 pk
        1, -- BRCH_PK 지점 pk
        211, -- MEMBR_PK
        BRCH_RESRV_IDX_SEQ.nextval, -- BRCH_RESRV_IDX (예약일련번호 현재 정해지지 x)
        'D', -- BRCH_RESRV_MTIME_TP (런치 or 디너)
        3, -- BRCH_RESRV_PERS_CNT (예약 인원)
        '테스트', -- BRCH_RESRV_PERS_NAME (예약자명)
        '010-3333-3333', -- BRCH_RESRV_PERS_TEL (연락처)
        0, -- BRCH_RESRV_STAT (예약 상태)
        '앱', -- BRCH_RESRV_WAY_TP(예약방법)
        TO_DATE('2022-01-10 17:30', 'YYYY-MM-DD hh24:mi'), -- BRCH_RESRV_REACH_DTMS(예약날짜)
        sysdate, -- BRCH_RESRV_RGST_DTMS (예약 등록날짜)
        '예약 메모 메모' -- BRCH_RESRV_MEMO (메모)
        );
commit ;

-- 앱에서 예약 요청시 이미 요청이 있는지 검사  checkAppApplyReserve
select count(*) from RSTRSV01M01
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 0
  and BRCH_PK = 1 -- 변수
  and BRCH_RESRV_MTIME_TP = 'D' -- 변수
  and BRCH_TABL_PK = 22 -- 변수
  and to_char(BRCH_RESRV_REACH_DTMS, 'YYYY-MM-DD') like '2022-01-04%';


-- 앱 룸 예약 요청시 이미 예약완료가 있는지 검사 checkInsertReserve
select count(*) from RSTRSV01M01
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 1
  and (BRCH_RESRV_DEPOS_STAT = 0 or BRCH_RESRV_DEPOS_STAT = 2)
  and BRCH_PK = 1 -- 변수
  and BRCH_RESRV_MTIME_TP = 'D' -- 변수
  and BRCH_TABL_PK = 124
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-25 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-26 14:59:59', 'YYYY-MM-DD hh24:mi:ss');

-- 앱에서 예약 요청시 이미 예약요청이 있는지 검사 utc 적용 checkAppApplyReserve
select count(*) from RSTRSV01M01
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 0
  and BRCH_PK = 1
  and BRCH_RESRV_MTIME_TP = 'D'
  and BRCH_TABL_PK = 124
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-16 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-17 14:59:59', 'YYYY-MM-DD hh24:mi:ss');


-- 앱에서 룸 예약 요청 후 입금 요청할 때 예약 대기 중인것들 유효성 검사 checkAppRoomApplyReserve
select count(*) from RSTRSV01M01
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 1
  and BRCH_RESRV_DEPOS_STAT = 1
  and BRCH_PK = 1
  and BRCH_RESRV_MTIME_TP = 'D'
  and BRCH_TABL_PK = 124
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-23 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-24 14:59:59', 'YYYY-MM-DD hh24:mi:ss');

-- 앱에서 알림 위한 정보 뽑기
select * from (select c.BRCH_TABL_NO, r.* from CMNTBL01M01 c, RSTRSV01M01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK) where BRCH_RESRV_PK = 863;




select membr_login_hist_seq.currval from dual;
CREATE SEQUENCE ADM_LOGIN_HIST_SEQ;

select * from mbrinf01m01;

-- 해당 날짜 예약 관련 모두 보기
select * from RSTRSV01M01
where BRCH_RESRV_REACH_DTMS between TO_DATE('2022-01-12 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-01-13 14:59:59', 'YYYY-MM-DD hh24:mi:ss');

select * from RSTRSV01M01 where BRCH_RESRV_PK = 862 and BRCH_RESRV_STAT = 0;



-- 예약 승인시 예약불가 테이블 확인하기 sImpossibleTable
select count(*) from CMNTBL01M01 where BRCH_PK = 1 and BRCH_TABL_PK = 128 and BRCH_TABL_STAT = 'N';


-- 주문 들어간 테이블 확인 sListOrderSimpleByBrchpk
SELECT rm.brch_tabl_ordr_peopl_cnt, rm.brch_tabl_ordr_today_no, rm.BRCH_TABL_PK brch_tabl_pk, rm.BRCH_TABL_ORDR_PK brch_tabl_ordr_pk, rm2.TABL_ORDR_DTIL_PK tabl_ordr_dtil_pk, rm.BRCH_TABL_ORDR_RGST_DTMS brch_tabl_ordr_rgst_dtms, rm.BRCH_TABL_ORDR_ALL_PRC brch_tabl_ordr_all_prc
FROM RSTODR01M01 rm, RSTODR01M02 rm2
WHERE rm.BRCH_TABL_ORDR_PK = rm2.BRCH_TABL_ORDR_PK
    AND rm.BRCH_TABL_ORDR_STAT_DEL = 0
    AND rm.BRCH_TABL_ORDR_SETL_STAT = 0
    AND rm.BRCH_PK = 1;


-- sListMenuHistByOrderdtilpk
SELECT * FROM MNUHIS01M01
WHERE menu_hist_stat_del = 0 AND tabl_ordr_dtil_pk = 101
ORDER BY menu_hist_tkout_stat, menu_hist_add_stat, menu_hist_pk;




-- 예약 히스토리 시퀀스
SELECT BRCH_RESRV_HIST_SEQ.nextval FROM DUAL;
SELECT BRCH_RESRV_HIST_SEQ.currval FROM DUAL;

-- 예약 수정 히스토리 내역 가져오기 sReserveModifyHistory
select * from (select c.BRCH_TABL_NO, r.* from CMNTBL01M01 c, RSTRSV01H01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where BRCH_RESRV_PK = 228
order by BRCH_RESRV_HIST_RGST_DTMS;

-- 예약 수정 히스토리 내역 가져오기
select * from (select c.BRCH_TABL_NO, r.* from CMNTBL01M01 c, RSTRSV01H01 r where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where BRCH_RESRV_PK in (201,228)
order by BRCH_RESRV_HIST_RGST_DTMS desc ;



-- 예약금 조회하기 sReseveDeposAmt
select * from RSVPYM01M01 where BRCH_RESRV_PK = 42;


-- 예약금 환불하기 - 지점예약 테이블 변경 RSTRSV01M01


-- 예약금 환불하기 - 예약금 내역 테이블 변경 RSVPYM01M01
update RSVPYM01M01
    set
        RESRV_SETL_DEPOS_STAT = -1,
        RESRV_SETL_CANCL_AMT = 10000
where BRCH_RESRV_PK= 42 and BRCH_PK = 1;
commit ;


-- 당일 예약 입금 완료 조회 sTodayDeposList
select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.*, pay.RESRV_DEPOS_CMPLT_DTMS
from RSTRSV01M01 r, CMNTBL01M01 c, RSVPYM01M01 pay
where r.BRCH_RESRV_PK in
        (select p.BRCH_RESRV_PK from RSVPYM01M01 p
            where p.BRCH_PK = 1
                and (p.RESRV_SETL_DEPOS_STAT = 1 or p.RESRV_SETL_DEPOS_STAT = 2))
    and r.BRCH_TABL_PK = c.BRCH_TABL_PK and c.BRCH_TABL_LOC_FLOOR = 1
    and r.BRCH_RESRV_PK = pay.BRCH_RESRV_PK
    and r.BRCH_RESRV_DEPOS_STAT not in (2, 5, -2)
    and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-02-27 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-02-28 14:59:59', 'YYYY-MM-DD hh24:mi:ss');

-- 전체 예약 입금 완료 조회 sTotalDeposList   and c.BRCH_TABL_LOC_FLOOR = 1
select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.*, pay.RESRV_DEPOS_CMPLT_DTMS
from RSTRSV01M01 r, CMNTBL01M01 c, RSVPYM01M01 pay
where r.BRCH_RESRV_PK in
        (select p.BRCH_RESRV_PK from RSVPYM01M01 p
            where p.BRCH_PK = 1
                and (p.RESRV_SETL_DEPOS_STAT = 1 or p.RESRV_SETL_DEPOS_STAT = 2))
    and r.BRCH_TABL_PK = c.BRCH_TABL_PK and c.BRCH_TABL_LOC_FLOOR = 1
    and r.BRCH_RESRV_PK = pay.BRCH_RESRV_PK
    and r.BRCH_RESRV_DEPOS_STAT not in (2, 5);


-- 입금 완료되어 있는지 확인하기 checkDeposCompl
-- 입금대기에서 입금완료로 변경하기 전에 결제 완료인지 확인하기
select count(*)
from RSVPYM01M01
where BRCH_PK = 1
  and BRCH_RESRV_PK = 123
  and (RESRV_SETL_DEPOS_STAT = 1 or RESRV_SETL_DEPOS_STAT = 2);


-- pg 결제 완료 후 예약금 내역도 결제완료로 변경하기 (가상계좌 입금 RESRV_SETL_DEPOS_STAT = 1, 카드완료 RESRV_SETL_DEPOS_STAT = 2)
-- update RSVPYM01M01
--     set
--         RESRV_SETL_DEPOS_STAT = 1,
--         RESRV_DEPOS_CMPLT_DTMS = date
-- where BRCH_RESRV_IDX = R42;


-- pg 결제 실패 or 오류인 경우 예약금 내역에 기록하기
update RSVPYM01M01
    set
        RESRV_DEPOS_FAIL_STAT = 123123
where BRCH_RESRV_IDX = R42;


-- 예약금 내역
-- drop TABLE RSVPYM01M01;
CREATE TABLE RSVPYM01M01
(
    RESRV_DEPOS_PK NUMBER NOT NULL ,
    BRCH_PK NUMBER NOT NULL ,
    BRCH_RESRV_PK NUMBER NOT NULL ,
    BRCH_RESRV_IDX VARCHAR2(4000) NOT NULL,
    RESRV_DEPOS_AMT NUMBER(8)NOT NULL ,
    RESRV_DEPOS_PAYM_TP VARCHAR2(50) NOT NULL ,
    RESRV_SETL_DEPOS_STAT NUMBER(1) NOT NULL ,
    RESRV_SETL_CANCL_AMT NUMBER(8) ,
    RESRV_DEPOS_CMPLT_DTMS DATE,
    RESRV_DEPOS_FAIL_STAT VARCHAR2(100),
    RESRV_SETL_REVOK_DTMS DATE,
    RESRV_DEPOS_RGST_DTMS DATE NOT NULL ,
    CONSTRAINT RESRV_DEPOS_PK PRIMARY KEY (RESRV_DEPOS_PK)
);
commit ;


-- 날짜 선택 후 런치 or 디너로 -> 전체 테이블 예약 현황 조회 sReserveListByDateLnD
select *
from
    (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.*
        from CMNTBL01M01 c, RSTRSV01M01 r
        where c.BRCH_TABL_PK = r.BRCH_TABL_PK and c.BRCH_TABL_STAT_DEL = 0 and BRCH_TABL_LOC_FLOOR = 1
    )
where BRCH_RESRV_STAT_DEL = 0
  and BRCH_RESRV_STAT = 1
  and (BRCH_RESRV_DEPOS_STAT = 0 or BRCH_RESRV_DEPOS_STAT = 2 or BRCH_RESRV_DEPOS_STAT = 5)
  and BRCH_PK = 1
  and BRCH_RESRV_MTIME_TP = 'L'
  and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-02-21 15:00:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-02-22 14:59:59', 'YYYY-MM-DD hh24:mi:ss')
order by BRCH_RESRV_REACH_DTMS;


-- 가상계좌 미입금 예약 내역 조회 sVbankWaiting
select *
from (
        select
               r.*,
               rp.RESRV_DEPOS_PAYM_TP, rp.RESRV_DEPOS_AMT, rp.RESRV_SETL_DEPOS_STAT, rp.RESRV_SETL_CANCL_AMT, rp.RESRV_DEPOS_CMPLT_DTMS,
               c.BRCH_TABL_LOC_FLOOR, c.BRCH_TABL_NO, c.BRCH_TABL_TP
        from RSTRSV01M01 r, RSVPYM01M01 rp, CMNTBL01M01 c
        where r.BRCH_RESRV_IDX = rp.BRCH_RESRV_IDX AND  r.BRCH_TABL_PK = c.BRCH_TABL_PK
    )
where
    BRCH_PK =1
    AND BRCH_TABL_LOC_FLOOR = 1
    AND BRCH_RESRV_DEPOS_STAT = -2;


-- 가상계좌 환불 입금 후 정보 변경1(예약내역-RSTRSV01M01)  uVbankRefundRSTRSV01M01
update RSTRSV01M01
set BRCH_RESRV_DEPOS_STAT = -1
where BRCH_RESRV_IDX = 'R1';

-- 가상계좌 환불 입금 후 정보 변경2(예약금내역-RSVPYM01M01)   uVbankRefundRSVPYM01M01
update RSVPYM01M01
set
    RESRV_SETL_DEPOS_STAT = -1,
    RESRV_SETL_CANCL_AMT = 111,
    RESRV_SETL_REVOK_DTMS = sysdate
where BRCH_RESRV_IDX = 'R1';

-- 가상계좌 환불 입금 후 정보 변경3(결제내역-PAYHIS01H01)   uVbankRefundPAYHIS01H01
update PAYHIS01H01
set
    SETL_HIST_STAT = 20,
    SETL_HIST_CANCL_PRC = 1111,
    SETL_HIST_REVOK_DTMS = sysdate
where BRCH_RESRV_IDX = 'R1';

-- 예약거부내역 조회 화면에서 -> 환불 정보 조회
select *
from PAYHIS01H01
where SETL_HIST_ORDR_NO = 'R93';


-- pg 결제 취소를 위한 예약 정보 조회  sPgCancelReserveData
select *
from (
    select r.*, p.* from RSTRSV01M01 r, PAYHIS01H01 p
    where r.BRCH_RESRV_IDX = p.SETL_HIST_ORDR_NO
    )
where BRCH_RESRV_PK = 95 and BRCH_RESRV_STAT_DEL = 0;



-- 스케줄러  sReserveScheduler
select *
from RSTRSV01M01
where
    BRCH_RESRV_STAT = 1
    and  BRCH_RESRV_STAT_DEL = 0
    and BRCH_PK = 1
    and BRCH_RESRV_DEPOS_STAT in (0, 2, 5)
    and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-03-03 03:01:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-03-03 03:30:00', 'YYYY-MM-DD hh24:mi:ss');

select *
from RSTRSV01M01
where
    BRCH_RESRV_STAT = 1
    and  BRCH_RESRV_STAT_DEL = 0
    and BRCH_PK = 1
    and BRCH_RESRV_DEPOS_STAT in (0, 2, 5)
    and BRCH_RESRV_REACH_DTMS between TO_DATE('2022-03-03 05:31:00', 'YYYY-MM-DD hh24:mi:ss') and TO_DATE('2022-03-03 06:00:00', 'YYYY-MM-DD hh24:mi:ss');





-- 가상계좌인지 확인하기
select * from PAYHIS01H01 where SETL_HIST_ORDR_NO = 'R93' and SETL_HIST_STAT =1;

select * from PAYCNL01H01;

select SETL_PART_CANCL_SEQ.nextval from DUAL;
select SETL_PART_CANCL_SEQ.currval from DUAL;

update PAYCNL01H01
    set
      setl_part_cancl_revok_dtms = TO_DATE('2022-03-01 12:10:10', 'yyyy-mm-dd hh24:mi:ss')
    where
      setl_part_cancl_id = 'RC2';





-- 테이블 삭제 전 예약 존재하는지 체크하기  sReservCompleteTableDel
select * from
              (select c.BRCH_TABL_NO, c.BRCH_TABL_TP, r.* FROM CMNTBL01M01 c, RSTRSV01M01 r
                where c.BRCH_TABL_PK = r.BRCH_TABL_PK)
where
    BRCH_RESRV_STAT = 1
    and BRCH_RESRV_STAT_DEL =0
    and BRCH_PK = 1
    and BRCH_TABL_PK = 121
    and BRCH_RESRV_REACH_DTMS >= TO_DATE('2022-03-03 00:00:00', 'yyyy-mm-dd hh24:mi:ss');



-- 로우넘 이용해서 한개만 뽑기
select ROWNUM, r.* from RSTRSV01M01 r
where BRCH_RESRV_STAT = 1
and BRCH_RESRV_STAT_DEL = 0
and ROWNUM = 1
order by BRCH_RESRV_PK desc;

select ROWNUM, r.* from RSTRSV01M01 r
where BRCH_RESRV_STAT = 1
and BRCH_RESRV_STAT_DEL = 0
and ROWNUM between 1 and 10
order by BRCH_RESRV_PK desc;



select NVL(MAX(BRCH_RESRV_MTIME_TP), '검색된 데이터가 없습니다.') AS A
from RSTRSV01M01
where BRCH_RESRV_PK = '9999';


select BRCH_RESRV_MTIME_TP
from RSTRSV01M01
where BRCH_RESRV_PK = '9999';


-- 룸 예약금 설정하기 uRoomReserveAmt
update BRCINF01M01
set BRCH_RESRV_ROOM_AMT = 1000
where BRCH_PK = 1;



-- 회원이 차단한 멤버pk들 조회하기
select BAN_MEMBR_PK from MBRBAN01J01 where MEMBR_PK = 21;

-- 차단된 회원 정보 조회
select * from MBRINF01M01 where MEMBR_PK in ('363', '261');
















-- 백업DB: RSTRSV01M01 (지점예약), RSVPYM01M01 (예약금 내역), RSTRSV01H01 (예약 히스토리),
-- 백업SQ: 지점예약: BRCH_RESRV_IDX_SEQ, BRCH_RESRV_SEQ /  예약금 내역: RESRV_DEPOS_SEQ / 예약 히스토리: BRCH_RESRV_HIST_SEQ

-- 푸쉬 알림하기 위해 회원데이터 최신화 : MBRINF01M01, MEMBR_SEQ



-- #########################################################################################################################
-- #########################################################################################################################
-- ### 시퀀스 관련 ###
-- 예약 pk
drop sequence BRCH_RESRV_SEQ;
create sequence BRCH_RESRV_SEQ;

SELECT BRCH_RESRV_SEQ.nextval FROM DUAL;
SELECT BRCH_RESRV_SEQ.currval FROM DUAL;

-- 예약번호
drop sequence BRCH_RESRV_IDX_SEQ;
create sequence BRCH_RESRV_IDX_SEQ;

SELECT BRCH_RESRV_IDX_SEQ.nextval FROM DUAL;
SELECT BRCH_RESRV_IDX_SEQ.currval FROM DUAL;

-- 예약 히스토리
drop sequence BRCH_RESRV_HIST_SEQ;
create sequence BRCH_RESRV_HIST_SEQ;

SELECT BRCH_RESRV_HIST_SEQ.nextval FROM DUAL;
SELECT BRCH_RESRV_HIST_SEQ.currval FROM DUAL;

-- 예약금 내역
drop sequence RESRV_DEPOS_SEQ;
create sequence RESRV_DEPOS_SEQ;

SELECT RESRV_DEPOS_SEQ.nextval FROM DUAL;
SELECT RESRV_DEPOS_SEQ.currval FROM DUAL;

commit ;


-- 로컬 변경사항
ALTER TABLE PAYHIS01H01 ADD SETL_HIST_USE_POINT_AMT NUMBER DEFAULT 0;
ALTER TABLE PAYHIS01H01 ADD SETL_HIST_POINT_PKS CLOB;
commit ;

ALTER TABLE OLNORD01M01 ADD ONLN_FOOD_ORDR_CANCL_ADM_PK NUMBER;
ALTER TABLE PAYHIS01H01 ADD SETL_HIST_CANCL_ADM_PK NUMBER;
commit ;


ALTER TABLE HR.NFT_GOODS ADD EVCA_ID1 VARCHAR2(15);
ALTER TABLE HR.NFT_GOODS ADD SALE_TYPE VARCHAR2(15);
commit ;

ALTER TABLE MBRLVL01H01 ADD MEMBR_LV_HIST_STAT NUMBER(1) DEFAULT 0;
commit ;

ALTER TABLE MBRADR01M01 ADD ADDR_BASE NUMBER(1);
commit ;