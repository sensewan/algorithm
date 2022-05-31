-- NFT_ORDRE 컬럼: INDEX_NO, OD_ID, GCODE, GOODSTYPE, MEMBR_PK, GS_ID, NID_NO, GRID_NO, JOINT_NO, PAY_TYPE, PAYMETHOD, SALE_TYPE, DAN
-- NFT_GOODS 컬럼: INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, QUANTITY, SELLED_NUM, ROYALTY, ISOPEN
-- NFT_INFO_DIGITAL: 컬럼: NID_NO, TOKEN_ID, GCODE, BLOCKCHAIN_TYPE, BLOCKCHAIN_OK, REG_TIME, TI_NO, SELLED, UP_DATE, OWN_MEMBR_PK, OWNER,NFT_ADDR_CHANGE_STAT

select * from NFT_GOODS where GCODE = '1650417293697';
select * from NFT_GOODS where GRID_PUBLICATION = 1;
-- 아트조각투자(NFT조회하기)
select * from NFT_GOODS where GRID_PUBLICATION = 1 and GOODSTYPE = 'art_piece_nft';
select * from NFT_GOODS where GRID_PUBLICATION = 0 and GOODSTYPE = 'art_piece_nft';

-- 아트조각투자 공동소유 (NFT 없음)
select * from NFT_GOODS where GRID_PUBLICATION = 0 and GOODSTYPE ='art_piece';

-- 디지털아트 digital_nft
select * from NFT_GOODS where GOODSTYPE = 'digital_nft';

select * from NFT_INFO_DIGITAL where GCODE = '1650417293697';
select * from NFT_GOODS_GRID where GCODE = '1650417293697';

select * from NFT_GOODS where GCODE = '1652429652806';
select * from NFT_INFO_DIGITAL where SELLED ='Y';
select * from NFT_GOODS_GRID where SELLED ='Y';

select *
from NFT_GOODS
where GOODSTYPE = 'art_piece_nft' and GRID_PUBLICATION = 0;

select * from NFT_INFO_DIGITAL where SELLED = 'Y';
select * from NFT_GOODS_GRID where SELLED = 'Y';

select members_point_seq.currval from DUAL;

-- ############################# 아트조각투자(NFT) - art_piece_nft #############################
-- [art_piece_nft, GRID_PUBLICATION = 1], [NFT_GOODS, NFT_GOODS_GRID, NFT_INFO_DIGITAL],
-- NFT_GOODS_GRID의 POSITION_PRICE가 판매가격임
-- NFT_GOODS - SELLED_NUM 증가시키기,  NFT_GOODS_GRID - SELLED 변경,  NFT_INFO_DIGITAL - SELLED, OWN_MEMBR_PK 변경
select * from NFT_GOODS where GOODSTYPE = 'art_piece_nft' and GRID_PUBLICATION = 1 and BLOCKCHAIN_OK ='Y' and SALE_TYPE= 'BUY';
select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, QUANTITY, SELLED_NUM, ROYALTY,ISOPEN
    from NFT_GOODS
    where GOODSTYPE = 'art_piece_nft' and GRID_PUBLICATION = 1 and GCODE = '1652427098933' and SALE_TYPE = 'BUY';

select nid_no, token_id, gcode, blockchain_type, blockchain_ok, reg_time, ti_no, selled, up_date, own_membr_pk, OWNER,nft_addr_change_stat
from NFT_INFO_DIGITAL where GCODE = '1652427098933' order by NID_NO desc ;

select *
from NFT_INFO_DIGITAL where GCODE = '1652427098933' order by NID_NO desc ;

select * from NFT_GOODS_GRID where GCODE = '1652427098933' order by GRID_NO desc ;


select gd.INDEX_NO, gd.GNAME, gd.GOODSTYPE, gd.GRID_PUBLICATION, gd.PAY_TYPE, gd.GOODS_PRICE, gd.QUANTITY, gd.SELLED_NUM,
       gr.GCODE, gr.GRID_NO, gr.POSITION_ID, gr.POSITION_PRICE, gr.SELLED grid_selled, gr.TI_NO,
       i.NID_NO, i.OWN_MEMBR_PK, i.SELLED info_selled, i.BLOCKCHAIN_OK, i.BLOCKCHAIN_TYPE, i.NFT_ADDR, i.CONTRACT_ADDR, i.TOKEN_ID, i.TI_NO, i.OWNER
from NFT_GOODS gd, NFT_GOODS_GRID gr, NFT_INFO_DIGITAL i
where gd.GCODE = '1652427098933' and gr.GCODE = '1652427098933' and i.GCODE = '1652427098933' and gr.TI_NO = i.TI_NO
    and i.BLOCKCHAIN_OK = 'Y'
    and gd.GRID_PUBLICATION = 1
    and gd.GOODSTYPE = 'art_piece_nft'
order by gr.GRID_NO desc ;


-- ### NFT_INFO_DIGITAL 변경 ###  uSelledNftInfoDigital
update NFT_INFO_DIGITAL
set SELLED = 'Y',
    OWN_MEMBR_PK = ''
where GCODE = ''
  and NID_NO = '';
-- 판매된 제품 갯수 확인
select count(*) from NFT_INFO_DIGITAL where GCODE = '1650362494844' and SELLED = 'Y';

-- ## NFT_GOODS_GRID 변경 ##
update NFT_GOODS_GRID
    set SELLED = 'Y',
        OWN_MEMBR_PK = ''
where GCODE = '' and GRID_NO = '';
-- 판매된 제품 갯수 확인
select count(*) from NFT_GOODS_GRID where GCODE = '1650362494844' and SELLED = 'Y';

-- ## NFT_GOODS 변경 ##
-- 판매된 제품 갯수 확인
select count(*) from NFT_INFO_DIGITAL
where GCODE = '1650362494844'
and SELLED = 'Y';

update NFT_GOODS
    set SELLED_NUM = '' -- NFT_INFO_DIGITAL의 SELLED 값이 Y인 것을 카운트해서 넣기
where GCODE = '1650359614945';


-- ===============================
-- ############################# 아트조각투자(공동소유NFT) - art_piece_joint_nft , wine_piece_joint_nft #############################
-- [art_piece_nft, GRID_PUBLICATION = 0],  [NFT_GOODS, NFT_INFO_DIGITAL]
-- NFT_GOODS - GOODS_PRICE_PIECE 가 개당 가격
-- NFT_GOODS - SELLED_NUM 증가,  NFT_INFO_DIGITAL - SELLED, OWN_MEMBR_PK 변경
select * from NFT_GOODS where GOODSTYPE = 'art_piece_joint_nft' and GRID_PUBLICATION = 0 and BLOCKCHAIN_OK='Y' and SALE_TYPE = 'BUY' order by INDEX_NO;
select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, QUANTITY, SELLED_NUM, ROYALTY,ISOPEN
    from NFT_GOODS
    where GOODSTYPE = 'art_piece_joint_nft' and GRID_PUBLICATION = 0 and GCODE = '1652425332491';

select nid_no, token_id, gcode, blockchain_type, blockchain_ok, reg_time, ti_no, selled, up_date, own_membr_pk, nft_addr_change_stat, OWNER
from NFT_INFO_DIGITAL where GCODE = '1652425332491';

select gd.GNAME, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GOODSTYPE, gd.GRID_PUBLICATION, gd.PAY_TYPE, gd.QUANTITY, gd.SELLED_NUM,
       i.NID_NO, i.OWN_MEMBR_PK, i.SELLED info_selled, i.BLOCKCHAIN_OK, i.BLOCKCHAIN_TYPE, i.NFT_ADDR, i.CONTRACT_ADDR, i.TOKEN_ID, i.TI_NO, i.OWNER
from NFT_GOODS gd, NFT_INFO_DIGITAL i
where gd.GCODE = '1652427924269' and i.GCODE = '1652427924269'
    and gd.GRID_PUBLICATION = 0
    and gd.GOODSTYPE = 'art_piece_joint_nft'
    and i.BLOCKCHAIN_OK = 'Y';


---------------
select * from NFT_GOODS where GOODSTYPE = 'wine_piece_joint_nft' and GRID_PUBLICATION = 0 and BLOCKCHAIN_OK='Y' order by INDEX_NO;
select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, QUANTITY, SELLED_NUM, ROYALTY,ISOPEN
    from NFT_GOODS
    where GOODSTYPE = 'wine_piece_joint_nft' and GRID_PUBLICATION = 0 and GCODE = '1652425632487';

select nid_no, token_id, gcode, blockchain_type, blockchain_ok, reg_time, ti_no, selled, up_date, own_membr_pk, nft_addr_change_stat
from NFT_INFO_DIGITAL where GCODE = '1652425632487';

select gd.GNAME, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GOODSTYPE, gd.GRID_PUBLICATION, gd.PAY_TYPE, gd.QUANTITY, gd.SELLED_NUM,
       i.NID_NO, i.OWN_MEMBR_PK, i.SELLED info_selled, i.BLOCKCHAIN_OK, i.BLOCKCHAIN_TYPE, i.NFT_ADDR, i.CONTRACT_ADDR, i.TOKEN_ID, i.TI_NO, i.OWNER
from NFT_GOODS gd, NFT_INFO_DIGITAL i
where gd.GCODE = '1652425632487' and i.GCODE = '1652425632487'
    and gd.GRID_PUBLICATION = 0
    and gd.GOODSTYPE = 'wine_piece_joint_nft'
    and i.BLOCKCHAIN_OK = 'Y';


-- ### NFT_INFO_DIGITAL 변경 ###
update NFT_INFO_DIGITAL
    set SELLED = 'Y',
        OWN_MEMBR_PK = ''
where GCODE = ''
  and NID_NO = ''
  and TOKEN_ID = '';

-- ## NFT_GOODS 변경 ##
-- 판매된 제품 갯수 확인
select count(*) from NFT_INFO_DIGITAL
where GCODE = '1650359614945'
and SELLED = 'Y';

update NFT_GOODS
    set SELLED_NUM = 1 -- NFT_INFO_DIGITAL의 SELLED 값이 Y인 것을 카운트해서 넣기
where GCODE = '1650359614945';




-- ############################# 아트조각투자 (NFT 없음!!) - art_piece #############################  1650853412245 ,  1650852874943
-- [art_piece, GRID_PUBLICATION = 1],  [ NFT_GOODS, NFT_GOODS_GRID ]
-- NFT_GOODS_GRID: POSITION_PRICE가 개당가격  / (NFT_GOODS: GOODS_PRICE_PIECE 무시!!)
-- NFT_GOODS: SELLED_NUM을 1개씩 증가시켜야함  /   NFT_GOODS_GRID: SELLED를 변경하기
select * from NFT_GOODS where GRID_PUBLICATION = 1 and GOODSTYPE ='art_piece';
select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, GRID_PUBLICATION, QUANTITY, SELLED_NUM, ROYALTY,ISOPEN
    from NFT_GOODS
    where GRID_PUBLICATION = 1 and GOODSTYPE ='art_piece' and GCODE = '1652425434493' and SALE_TYPE ='BUY';

select * from NFT_GOODS_GRID where GCODE = '1652425434493';
select * from NFT_INFO_DIGITAL where GCODE = '1652425434493';

select gd.GNAME, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GOODSTYPE, gd.GRID_PUBLICATION, gd.PAY_TYPE, gd.QUANTITY, gd.SELLED_NUM,
       gr.INDEX_NO, gr.GCODE, gr.GRID_NO, gr.POSITION_ID, gr.POSITION_PRICE, gr.SELLED grid_selled, gr.TI_NO
from NFT_GOODS gd, NFT_GOODS_GRID gr
where gd.GCODE = '1650853412245' and gr.GCODE ='1650853412245'
      and GRID_PUBLICATION = 1 and GOODSTYPE ='art_piece';



-- ## NFT_GOODS_GRID 변경 ##
update NFT_GOODS_GRID
    set SELLED = 'Y'
where GCODE = '' and POSITION_ID = '';

-- ## NFT_GOODS 변경 ##
-- 판매된 제품 갯수 확인
select count(*) from NFT_GOODS_GRID
where GCODE = '1650853412245'
and SELLED = 'Y';

update NFT_GOODS
    set SELLED_NUM = 1 -- NFT_INFO_DIGITAL의 SELLED 값이 Y인 것을 카운트해서 넣기
where GCODE = '1650853412245';



-- ==================================
-- ############################# 아트조각투자(공동소유) (NFT 없음!!) - art_piece_joint , wine_piece_joint #############################
-- [art_piece_joint, GRID_PUBLICATION = 0],  [ NFT_GOODS ]
-- GOODS_PRICE_PIECE가 개당 가격 /  SELLED_NUM을 1개씩 증가시켜야함
select * from NFT_GOODS where GRID_PUBLICATION = 0 and GOODSTYPE ='art_piece_joint' and SALE_TYPE = 'BUY' and ISOPEN =1;

select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, GRID_PUBLICATION, QUANTITY, SELLED_NUM, ISOPEN
from NFT_GOODS
where GCODE = '1652429666694'
      and GRID_PUBLICATION = 0 and GOODSTYPE ='art_piece_joint';

select * from NFT_GOODS_JOINT where GCODE = '1652429666694';

-- ------------------------------------------------------------------------------------------------------
select * from NFT_GOODS where GRID_PUBLICATION = 0 and GOODSTYPE ='wine_piece_joint';

select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, GRID_PUBLICATION, QUANTITY, SELLED_NUM, ISOPEN
from NFT_GOODS
where GCODE = '1652425723856'
      and GRID_PUBLICATION = 0 and GOODSTYPE ='wine_piece_joint';

-- ## NFT_GOODS 변경 ##
-- 판매된 제품 갯수 확인
select sum(SUM_QTY) from NFT_ORDER where GCODE = '1650418210358' and NFT_ORDER.PAYMENT_STATE not in (-1, 0);

select count(*) from NFT_ORDER where GS_ID = '425';



update NFT_GOODS
    set SELLED_NUM = 1  -- NFT_INFO_DIGITAL의 SELLED 값이 Y인 것을 카운트해서 넣기
where GCODE = '1650417293697';




--  ############################# 디지털아트(NFT) #############################
-- [ digital_nft ], [ NFT_GOODS, NFT_INFO_DIGITAL - 여러개 생성가능 ]
-- NFT_GOODS - GOODS_PRICE 가격
-- NFT_GOODS - selled_num 변경 / NFT_INFO_DIGITAL - SELLED, OWN_MEMBR_PK 변경

select * from NFT_GOODS where GOODSTYPE = 'digital_nft' and BLOCKCHAIN_OK='Y';
select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, GRID_PUBLICATION, QUANTITY, SELLED_NUM, ISOPEN
from NFT_GOODS where GOODSTYPE = 'digital_nft' and GCODE='1652424800208';

select nid_no, gcode, blockchain_type, blockchain_ok, token_id, reg_time, ti_no, selled, up_date, own_membr_pk, nft_addr_change_stat
from NFT_INFO_DIGITAL where GCODE = '1652424800208';
select *
from NFT_INFO_DIGITAL where GCODE = '1651819164606';


select gd.INDEX_NO, gd.GNAME, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GOODSTYPE, gd.GRID_PUBLICATION, gd.PAY_TYPE, gd.SELLED_NUM,
       i.*
from NFT_GOODS gd, NFT_INFO_DIGITAL i
where gd.GCODE = '1652424800208' and i.GCODE = '1652424800208'
    and gd.GRID_PUBLICATION = 0
    and gd.GOODSTYPE = 'digital_nft'
    and i.BLOCKCHAIN_OK = 'Y';

-- ### NFT_INFO_DIGITAL 변경 ###
update NFT_INFO_DIGITAL
    set SELLED = 'Y',
        OWN_MEMBR_PK = ''
where GCODE = ''
  and NID_NO = ''
  and TOKEN_ID = '';

-- ## NFT_GOODS 변경 ##
-- 판매된 제품 갯수 확인
select count(*) from NFT_INFO_DIGITAL
where GCODE = '1650417293697'
and SELLED = 'Y';


update NFT_GOODS
    set SELLED_NUM = 1 -- NFT_INFO_DIGITAL의 SELLED 값이 Y인 것을 카운트해서 넣기
where GCODE = '1650417293697';



alter table ntf_goodstype rename to nft_goodstype;
CREATE TABLE MBRNTI01J01
(
INDEX_NO NUMBER NOT NULL,
MEMBR_PK NUMBER NOT NULL
);
commit;

-- ############################# 실물아트(NFT) #############################
-- [ real_nft ] [ NFT_GOODS, NFT_INFO_DIGITAL , 1개만 발행됨!!]
-- NFT_GOODS - GOODS_PRICE 해당 가격
-- NFT_GOODS - selled_num 변경  /  NFT_INFO_DIGITAL - SELLED, OWN_MEMBR_PK 변경
select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, GRID_PUBLICATION, QUANTITY, SELLED_NUM, ISOPEN from NFT_GOODS where GOODSTYPE = 'real_nft';

select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, GRID_PUBLICATION, QUANTITY, SELLED_NUM, ISOPEN
from NFT_GOODS where GOODSTYPE = 'real_nft' and  GCODE = '1652424923634';

select nid_no, gcode, blockchain_type, blockchain_ok, token_id, reg_time, ti_no, selled, up_date, own_membr_pk, nft_addr_change_stat
from NFT_INFO_DIGITAL where GCODE = '1652424923634';

select gd.GNAME, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GOODSTYPE, gd.GRID_PUBLICATION, gd.PAY_TYPE, gd.SELLED_NUM,
       i.*
from NFT_GOODS gd, NFT_INFO_DIGITAL i
where gd.GCODE = '1650417923224' and i.GCODE = '1650417923224'
    and gd.GRID_PUBLICATION = 0
    and gd.GOODSTYPE = 'real_nft'
    and i.BLOCKCHAIN_OK = 'Y';

--  주문내역 ??
select GCODE from NFT_ORDER where INDEX_NO = '119';
select gd.INDEX_NO, gd.GOODSTYPE, gd.GCODE, gd.GCODE, gd.ISOPEN, gd.QUANTITY, gd.SELLED_NUM, gd.GRID_PUBLICATION,
       od.PAYMENT_STATE, od.SUM_QTY, od.PAY_TYPE, od.PAYMETHOD
from NFT_GOODS gd, NFT_ORDER od where gd.GCODE = (select GCODE from NFT_ORDER a where INDEX_NO = '119') and gd.GCODE = od.GCODE;

-- ## NFT_INFO_DIGITAL 변경 ##
update NFT_INFO_DIGITAL
    set SELLED = 'Y',
        OWN_MEMBR_PK = ''
where GCODE = '1650417923224'
  and NID_NO = ''
  and TOKEN_ID = '';


-- ## NFT_GOODS 변경 ##
-- 판매된 제품 갯수 확인
select count(*) from NFT_INFO_DIGITAL
where GCODE = '1650417923224'
and SELLED = 'Y';

update NFT_GOODS
    set SELLED_NUM = 1 -- NFT_INFO_DIGITAL의 SELLED 값이 Y인 것을 카운트해서 넣기
where GCODE = '1650417923224';



-- ############################# 실물아트-사본(NFT) #############################
-- [ real_copy_nft ] [ NFT_GOODS,   NFT_INFO_DIGITAL - 여러개 발행!!!]
-- NFT_GOODS - GOODS_PRICE 해당 가격
-- NFT_GOODS - selled_num 변경  /  NFT_INFO_DIGITAL - SELLED, OWN_MEMBR_PK 변경
select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, GRID_PUBLICATION, QUANTITY, SELLED_NUM, ISOPEN
from NFT_GOODS
where GOODSTYPE = 'real_copy_nft' and SALE_TYPE = 'BUY' and PAY_TYPE = 1 order by INDEX_NO desc ;

select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, GRID_PUBLICATION, QUANTITY, SELLED_NUM, ISOPEN
from NFT_GOODS where GOODSTYPE = 'real_copy_nft' and  GCODE = '1652425018257';

select nid_no, token_id, gcode, blockchain_type, blockchain_ok,reg_time, ti_no, selled, own_membr_pk, nft_addr_change_stat
from NFT_INFO_DIGITAL where GCODE = '1652425018257' order by NID_NO desc ;

select gd.INDEX_NO, gd.GNAME, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GOODSTYPE, gd.GRID_PUBLICATION, gd.PAY_TYPE, gd.QUANTITY, gd.SELLED_NUM,
       i.*
from NFT_GOODS gd, NFT_INFO_DIGITAL i
where gd.GCODE = '1650354903486' and i.GCODE = '1650354903486'
    and gd.GRID_PUBLICATION = 0
    and gd.GOODSTYPE = 'real_copy_nft'
    and i.BLOCKCHAIN_OK = 'Y';

-- ### NFT_INFO_DIGITAL 변경 ###
update NFT_INFO_DIGITAL
set SELLED = 'Y',
    OWN_MEMBR_PK = ''
where GCODE = '1650354903486'
  and NID_NO = ''
  and TOKEN_ID = '';



-- ### NFT_GOODS 변경 ###
-- 판매된 제품 갯수 확인
select count(*) from NFT_INFO_DIGITAL
where GCODE = '1650354903486'
and SELLED = 'Y';

update NFT_GOODS
    set SELLED_NUM = 1 -- NFT_INFO_DIGITAL의 SELLED 값이 Y인 것을 카운트해서 넣기
where INDEX_NO = '';


commit ;



-- ####################### 주문내역 #######################
-- ####################### NFT_ORDER #######################
-- OD_ID, OD_NO, MEMBR_PK, NFT_ADDR,



-- ################# 유효성 검사 #####################
-- 상품 팔렸는지 확인하기
-- 아트조각투자(공동소유) (NFT 없음!!) - art_piece_joint
-- [  checkNftOrder1 ]
SELECT count(*)
FROM NFT_ORDER
Where GS_ID = '414'
and PAYMENT_STATE not in (-1, 0);

-- 아트조각투자(NFT) - art_piece_nft
-- checkNftOrder2, checkNftInfoSell,  checkNftGridSell
SELECT count(*)
FROM NFT_ORDER
Where GS_ID = '' and GRID_NO = '' and NID_NO = ''
and PAYMENT_STATE not in (-1, 0);

select count(*) from NFT_INFO_DIGITAL where NID_NO = '300' and SELLED = 'Y';
select count(*) from NFT_GOODS_GRID where GRID_NO = '145' and SELLED = 'Y';

-- 아트조각투자(공동소유NFT) - art_piece_joint_nft ,   디지털아트(NFT),   실물아트(NFT),  실물아트-사본(NFT)
-- [   checkNftOrder3  ]
SELECT count(*)
FROM NFT_ORDER
Where GS_ID = '' and NID_NO = ''
and PAYMENT_STATE not in (-1, 0);


-- 아트조각투자 (NFT 없음!!) - art_piece
-- checkNftOrder4
SELECT count(*)
FROM NFT_ORDER
Where GS_ID = '' and GRID_NO = ''
and PAYMENT_STATE not in (-1, 0);





-- order 테이블 goodstype 추가하기
select GOODSTYPE, GCODE from NFT_ORDER where GCODE = '1650362494844';

select GOODSTYPE from NFT_GOODS where GCODE ='1650362494844';

update NFT_ORDER
    set GOODSTYPE = (select GOODSTYPE from NFT_GOODS where GCODE ='1650362494844')
where GCODE = '1650362494844';
commit ;




-- ###################################################################################
-- ####### NFT 상품 개인화 시키기 조회 sNftInfoBeforeChangeList ########
select od.OD_ID, od.OD_TIME, od.PAY_TYPE, od.PAYMETHOD, od.SALE_TYPE, od.TOTAL_FEE_GOODS_PRICE, od.COIN_TRANSACTION_HASH,
       ss.INDEX_NO, ss.GNAME, ss.GOODSTYPE, ss.GRID_PUBLICATION, ss.QUANTITY, ss.SELLED_NUM, ss.NFT_ARTIST_PK,
       ss.ISOPEN, ss.SIMG1, ss.SIMG2, ss.SIMG3, ss.NID_NO, ss.BLOCKCHAIN_TYPE, ss.BLOCKCHAIN_OK, ss.OWNER, ss.NFT_ADDR, ss.CONTRACT_ADDR, ss.TOKEN_ID, ss.UP_DATE,
       ss.OWN_MEMBR_PK, ss.NFT_ADDR_CHANGE_STAT, ss.GRID_NO, ss.GRID_TI_NO, ss.POSITION_ID, ss.REG_DATE, ss.GRID_SELLED
from (
         select gd.INDEX_NO, gd.GNAME,gd.GOODSTYPE, gd.GRID_PUBLICATION, gd.QUANTITY, gd.NFT_ARTIST_PK, gd.SELLED_NUM, ISOPEN, gd.SIMG1, gd.SIMG2, gd.SIMG3,
                i.*,
                gr.GRID_NO, gr.POSITION_ID, gr.TI_NO grid_ti_no, gr.REG_DATE, gr.SELLED grid_selled
         from (NFT_GOODS gd inner join NFT_INFO_DIGITAL i on gd.GCODE = i.GCODE)
                  left outer join NFT_GOODS_GRID gr on gr.GCODE = i.GCODE and gr.TI_NO = i.TI_NO
         where i.OWN_MEMBR_PK = 222 and i.NFT_ADDR_CHANGE_STAT = '0' and i.BLOCKCHAIN_OK = 'Y') ss,
 NFT_ORDER od where od.MEMBR_PK = 222 and od.NID_NO = ss.NID_NO;


select gd.INDEX_NO, gd.GOODSTYPE, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GRID_PUBLICATION, gd.QUANTITY, gd.SELLED_NUM, ISOPEN,
       i.*,
       gr.*
from NFT_GOODS gd inner join NFT_INFO_DIGITAL i on gd.GCODE = i.GCODE left outer join NFT_GOODS_GRID gr on gr.GCODE = i.GCODE and gr.TI_NO = i.TI_NO
where i.OWN_MEMBR_PK = '21' and i.NFT_ADDR_CHANGE_STAT = '0' and gd.SALE_TYPE = 'BUY'
order by NID_NO desc;



select i.*
from NFT_INFO_DIGITAL i
where i.OWN_MEMBR_PK = '21' and i.NFT_ADDR_CHANGE_STAT = '0'
order by NID_NO desc;


--  개인화 시키기
update NFT_INFO_DIGITAL
    set OWNER = '',
        NFT_ADDR = ''
where NID_NO = '' and TOKEN_ID = '' and BLOCKCHAIN_OK = 'Y';



-- ########## 코인 상품 전체 조회 ##########
select gd.INDEX_NO, gd.GCODE, gd.GNAME,gd.GOODSTYPE, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GRID_PUBLICATION, gd.SALE_TYPE, gd.ISOPEN,
       i.NID_NO, i.BLOCKCHAIN_TYPE, i.BLOCKCHAIN_OK, i.OWNER, i.NFT_ADDR, i.CONTRACT_ADDR, i.TOKEN_ID, i.UP_DATE, i.OWN_MEMBR_PK, i.NFT_ADDR_CHANGE_STAT, i.SELLED as info_selled,
       gr.GRID_NO, gr.POSITION_ID, gr.POSITION_PRICE, gr.TI_NO, gr.REG_DATE, gr.SELLED as grid_selled
from (NFT_GOODS gd inner join NFT_INFO_DIGITAL i on gd.GCODE = i.GCODE)
    left outer join NFT_GOODS_GRID gr on gr.GCODE = i.GCODE and gr.TI_NO = i.TI_NO
where gd.PAY_TYPE = '2' and i.BLOCKCHAIN_OK = 'Y' and gd.SALE_TYPE = 'BUY'
order by NID_NO desc;

select sum(QUANTITY) from NFT_GOODS where PAY_TYPE = '1';

select gd.INDEX_NO, gd.GCODE, gd.GNAME,gd.GOODSTYPE, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GRID_PUBLICATION, gd.SALE_TYPE, gd.ISOPEN,
       i.NID_NO, i.BLOCKCHAIN_TYPE, i.BLOCKCHAIN_OK, i.OWNER, i.NFT_ADDR, i.CONTRACT_ADDR, i.TOKEN_ID, i.TI_NO, i.UP_DATE, i.OWN_MEMBR_PK, i.NFT_ADDR_CHANGE_STAT, i.SELLED,
       gr.*
from (NFT_GOODS gd left outer join NFT_INFO_DIGITAL i on gd.GCODE = i.GCODE) left join NFT_GOODS_GRID gr on gd.GCODE = gr.GCODE
where gd.PAY_TYPE = '1';

select PAY_TYPE from NFT_GOODS where GOODSTYPE = 'art_piece_joint';
select GOODSTYPE from NFT_GOODS where PAY_TYPE = '1' and GOODSTYPE = 'digital_nft';



-- #####################################################################################################################
-- NFT_GOODS, NFT_INFO_DIGITAL, NFT_GOODS_GRID 3개 테이블 합친거 (art_piece_nft)
select gd.INDEX_NO, gd.GCODE, gd.GNAME,gd.GOODSTYPE, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GRID_PUBLICATION, gd.SALE_TYPE, gd.ISOPEN, gd.ISSHOW,
       i.NID_NO, i.BLOCKCHAIN_TYPE, i.BLOCKCHAIN_OK, i.OWNER, i.NFT_ADDR, i.CONTRACT_ADDR, i.TOKEN_ID, i.TI_NO, i.UP_DATE, i.OWN_MEMBR_PK, i.NFT_ADDR_CHANGE_STAT, i.SELLED info_selled,
       gr.GRID_NO, gr.POSITION_ID, gr.POSITION_PRICE,  gr.SELLED grid_selled, gr.OWN_MEMBR_PK
from NFT_GOODS gd, NFT_INFO_DIGITAL i, NFT_GOODS_GRID gr where gd.GCODE = i.GCODE and gd.PAY_TYPE='1' and i.GCODE = gr.GCODE and i.TI_NO = gr.TI_NO;

select gd.INDEX_NO, gd.GCODE, gd.GNAME,gd.GOODSTYPE, gd.GOODS_PRICE, gd.GOODS_PRICE_PIECE, gd.GRID_PUBLICATION, gd.SALE_TYPE, gd.ISOPEN, gd.ISSHOW,
        i.NID_NO, i.BLOCKCHAIN_TYPE, i.BLOCKCHAIN_OK, i.OWNER, i.NFT_ADDR, i.CONTRACT_ADDR, i.TOKEN_ID, i.TI_NO, i.UP_DATE, i.OWN_MEMBR_PK, i.NFT_ADDR_CHANGE_STAT, i.SELLED info_selled,
        gr.GRID_NO, gr.POSITION_ID, gr.POSITION_PRICE,  gr.SELLED grid_selled, gr.OWN_MEMBR_PK
from NFT_GOODS gd left outer join NFT_INFO_DIGITAL i on gd.GCODE = i.GCODE and PAY_TYPE = '1' inner join NFT_GOODS_GRID gr on i.GCODE = gr.GCODE and i.TI_NO = gr.TI_NO;






-- ############### 시퀀스 관련 -- ###############

SELECT NFT_ORDER_SEQ.nextval FROM DUAL;
SELECT NFT_ORDER_SEQ.currval FROM DUAL;


SELECT NFT_GOODS_SEQ.nextval FROM DUAL;
SELECT NFT_GOODS_SEQ.currval FROM DUAL;


SELECT NFT_GOODS_GRID_SEQ.nextval FROM DUAL;
SELECT  NFT_GOODS_GRID_SEQ.currval FROM DUAL;


SELECT NFT_INFO_DIGITAL_SEQ.nextval FROM DUAL;
SELECT NFT_INFO_DIGITAL_SEQ.currval FROM DUAL;

SELECT NFT_ROYAL_PAID_SEQ.nextval FROM DUAL;
SELECT NFT_ROYAL_PAID_SEQ.currval FROM DUAL;




-- #####################################################################################################
-- ### 아티스트 조회  ####
select * from NFT_ARTIST where NFT_ARTIST_PK = '43';

select * from BLOWLT01M01 where MEMBR_PK = '21';

-- ### 아티스트 APAY지갑 조회  ###
select *
from WLTINF01M01
where MEMBR_PK = '3281' and WLLET_CATGR_PK = '2' and WLLET_STAT_DEL = '0';

-- 지급내역 조회
select * from MEMBERS_POINT where MEMBR_PK = '3281' order by PO_ID desc ;


-- ### 아티스트 로열티 지급내역 조회 ###
select *
from NFT_ROYAL_PAID_HIS
where NFT_ARTIST_PK = '43'
order by NFT_ROYALTY_PAID_PK desc ;

select sum(NFT_ROYALTY_PAID_AMT)
from NFT_ROYAL_PAID_HIS
where NFT_ARTIST_PK = '43'
order by NFT_ROYALTY_PAID_PK desc ;


SELECT
       g.SALE_TYPE, o.INDEX_NO, o.GOODSTYPE, o.SUM_QTY, o.TOTAL_FEE_GOODS_PRICE, o.SELLER_PK, o.MEMBR_PK, o.OD_TIME,
       g.GNAME, g.SB_DATE,
       i.NID_NO, i.TOKEN_ID, gg.GRID_NO
      FROM nft_order o LEFT JOIN NFT_GOODS g ON o.GS_ID = g.INDEX_NO
            LEFT JOIN NFT_INFO_DIGITAL i ON o.NID_NO = i.NID_NO LEFT JOIN NFT_GOODS_GRID gg ON o.GRID_NO = gg.GRID_NO
where o.MEMBR_PK = 21;


select NID_NO, TOKEN_ID, TI_NO, GCODE, NFT_ADDR_CHANGE_STAT,OWNER
from NFT_INFO_DIGITAL
where TOKEN_ID in (31, 183, 201, 206, 192, 133, 134, 135, 136, 137, 143, 138, 139, 189, 190, 191, 198) order by  NID_NO;

select INDEX_NO, GCODE, GOODSTYPE, GOODS_PRICE, GOODS_PRICE_PIECE, QUANTITY, SELLED_NUM, ROYALTY,ISOPEN
from NFT_GOODS where GCODE = '1652428383231';

select NID_NO, GCODE, MEMBR_PK, OD_ID, DAN, PAY_TYPE, PAYMETHOD, PAYMENT_STATE from NFT_ORDER where GCODE = '1652428383231';

select NID_NO, TOKEN_ID, TI_NO, GCODE, NFT_ADDR_CHANGE_STAT,OWNER
from NFT_INFO_DIGITAL
where TOKEN_ID in (133,134) order by  NID_NO;


-- ######################################################################################
-- ### TRADE 관련 ###
--
select * from NFT_GOODS where GCODE = '1652424800208';
select INDEX_NO, GCODE, GOODSTYPE, QUANTITY, SELLED_NUM, OWNER_PK, ISOPEN, ISSHOW, ORI_GCODE, ORI_GRID_NO, ORI_NID_NO, ORI_JOINT_NO, SALE_TYPE, ROYALTY
from NFT_GOODS
where SALE_TYPE = 'TRADE' and ISSHOW = 0;

-- TRADE 상품
select  SALE_TYPE, INDEX_NO, GCODE, GOODSTYPE, OWNER_PK, GOODS_PRICE, QUANTITY, SELLED_NUM ,ISOPEN, ORI_GCODE, ORI_GRID_NO, ORI_NID_NO, ORI_JOINT_NO, ROYALTY, ISSHOW, GRID_PUBLICATION
from NFT_GOODS
where GCODE = '1653875900759';

--
select * from NFT_INFO_DIGITAL where GCODE = '1652429652806';
select NID_NO, GCODE, BLOCKCHAIN_OK, TOKEN_ID, TI_NO, SELLED, OWN_MEMBR_PK, NFT_ADDR_CHANGE_STAT, OWNER
from NFT_INFO_DIGITAL where OWN_MEMBR_PK = '222';
select NID_NO, GCODE, BLOCKCHAIN_OK, TOKEN_ID, TI_NO, SELLED, OWN_MEMBR_PK, NFT_ADDR_CHANGE_STAT, OWNER
from NFT_INFO_DIGITAL where GCODE = '1652428383231' and NID_NO = 676;

--
select * from NFT_GOODS_GRID where GCODE = '1652426826274' and GRID_NO = 284;

--
select * from NFT_GOODS_JOINT where JOINT_NO;

--
-- 기존 주문내역
select INDEX_NO, OD_ID, GCODE, GOODSTYPE, MEMBR_PK, GS_ID, NID_NO, GRID_NO, JOINT_NO, PAY_TYPE, PAYMETHOD, SALE_TYPE, DAN
from NFT_ORDER where GCODE = '1652426356802' and NID_NO = 631 and GRID_NO = 283;

select INDEX_NO, OD_ID, GCODE, GOODSTYPE, MEMBR_PK, GS_ID, NID_NO, GRID_NO, JOINT_NO, PAY_TYPE, PAYMETHOD, SALE_TYPE, DAN
from NFT_ORDER where INDEX_NO = 255;

select INDEX_NO, OD_ID, GCODE, GOODSTYPE, MEMBR_PK, GS_ID, NID_NO, GRID_NO, JOINT_NO, PAY_TYPE, PAYMETHOD, SALE_TYPE, DAN from NFT_ORDER where SALE_TYPE = 'TRADE';
select INDEX_NO, OD_ID, GCODE, GOODSTYPE, MEMBR_PK, GS_ID, NID_NO, GRID_NO, JOINT_NO, PAY_TYPE, PAYMETHOD, SALE_TYPE, DAN from NFT_ORDER where PAY_TYPE = '2';
select INDEX_NO, OD_ID, GCODE, GOODSTYPE, MEMBR_PK, GS_ID, NID_NO, GRID_NO, JOINT_NO, PAY_TYPE, PAYMETHOD, SALE_TYPE, DAN from NFT_ORDER where NID_NO ='631';
select INDEX_NO, OD_ID, GCODE, GOODSTYPE, MEMBR_PK, GS_ID, NID_NO, GRID_NO, JOINT_NO, PAY_TYPE, PAYMETHOD, SALE_TYPE, DAN from NFT_ORDER where DAN =12;







