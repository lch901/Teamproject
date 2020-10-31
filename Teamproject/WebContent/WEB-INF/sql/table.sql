drop table member;
drop table product;
drop table product_import;
drop table product_order;

create table member(
	i_member number primary key,
	id varchar(30) not null unique,
	pw varchar(30) not null,
	name varchar(100),
	tel varchar(20),
	email varchar(100),
	addr varchar(100),
	sex varchar(10),
	r_date date default sysdate
);
create table product(
	i_product number primary key,
	name varchar(100),
	price number(10) default 0,
	pic varchar(255),
	qty number(4) default 0,
	info varchar(255),
	category varchar(100)
);
create table product_import(
	i_pi number primary key,
	i_product number,
    i_member number,
	qty number(4) default 0,
	colorsize varchar(50),
	i_date date default sysdate,
	foreign key(i_product) references product(i_product),
    foreign key(i_member) references member(i_member)
);
create table product_order(
    i_po number primary key,
    i_member number,
    pic varchar(255),
	name varchar(100),
    colorsize varchar(50),
	price number(10) default 0,
	qty number(4) default 0,
    i_date date default sysdate,
    foreign key (i_member)references member(i_member)
);

select * from member;
select * from product;
select * from product_import;
select * from product_order;







insert into product(i_product,name,price,pic,info,category)values(1,'지퍼벨트 라이더 레더자켓',79000,'best/best1.jpg','지퍼벨트 라이더 레더자켓입니다','best');
insert into product(i_product,name,price,pic,info,category)values(2,'노블체크 오버 투버튼 자켓',75000,'best/best2.jpg','노블체크 오버 투버튼 자켓입니다','best');
insert into product(i_product,name,price,pic,info,category)values(3,'10부 르메 뒷밴딩 코튼 슬림슬랙스',36000,'best/best3.jpg','10부 르메 뒷밴딩 코튼 슬림슬랙스입니다','best');
insert into product(i_product,name,price,pic,info,category)values(4,'셀럽레터링 배색바람막이 오버자켓',29900,'best/best4.jpg','셀럽레터링 배색바람막이 오버자켓입니다','best');
insert into product(i_product,name,price,pic,info,category)values(5,'투포켓 카라 헨델 오버가디건',43200,'best/best5.jpg','투포켓 카라 헨델 오버가디건입니다','best');
insert into product(i_product,name,price,pic,info,category)values(6,'10부 쓰리선 슬림 트랙바지',14900,'best/best6.jpg','10부 쓰리선 슬림 트랙바지입니다','best');
insert into product(i_product,name,price,pic,info,category)values(7,'앵두 오버 니트베스트',15000,'outer/outer1.jpg','앵두 오버 니트베스트입니다','outer');
insert into product(i_product,name,price,pic,info,category)values(8,'어쩜따뜻해 오버 체크셔츠자켓',55000,'outer/outer2.jpg','어쩜따뜻해 오버 체크셔츠자켓입니다','outer');
insert into product(i_product,name,price,pic,info,category)values(9,'스냅핑 오버 트러커자켓',25500,'outer/outer3.jpg','스냅핑 오버 트러커자켓입니다','outer');
insert into product(i_product,name,price,pic,info,category)values(10,'트위스트 항공 후드자켓',62000,'outer/outer4.jpg','트위스트 항공 후드자켓입니다','outer');
insert into product(i_product,name,price,pic,info,category)values(11,'제리뽀 오버 체크 가디건',39000,'outer/outer5.jpg','제리뽀 오버 체크 가디건입니다','outer');
insert into product(i_product,name,price,pic,info,category)values(12,'헤라시 오픈 오버 가디건',36000,'outer/outer6.jpg','헤라시 오픈 오버 가디건입니다','outer');
insert into product(i_product,name,price,pic,info,category)values(13,'원버튼V넥 베이직 분또긴팔티',18000,'top/top1.jpg','원버튼V넥 베이직 분또긴팔티입니다','top');
insert into product(i_product,name,price,pic,info,category)values(14,'노팅힐 세미오버 분또 긴팔티',18000,'top/top2.jpg','노팅힐 세미오버 분또 긴팔티입니다','top');
insert into product(i_product,name,price,pic,info,category)values(15,'기모 홀리데이 오버 맨투맨',27000,'top/top3.jpg','기모 홀리데이 오버 맨투맨입니다','top');
insert into product(i_product,name,price,pic,info,category)values(16,'샌프란 레터링 자수 오버맨투맨',32000,'top/top4.jpg','샌프란 레터링 자수 오버맨투맨입니다','top');
insert into product(i_product,name,price,pic,info,category)values(17,'애드뚜와 레터링 오버 분또긴팔티',18000,'top/top5.jpg','애드뚜와 레터링 오버 분또긴팔티입니다','top');
insert into product(i_product,name,price,pic,info,category)values(18,'컬러라벨 포인트 오버 긴팔티',16800,'top/top6.jpg','컬러라벨 포인트 오버 긴팔티입니다','top');
insert into product(i_product,name,price,pic,info,category)values(19,'카키색슬랙스바지',18000,'pants/pants1.jpg','카키색슬랙스바지입니다','pants');
insert into product(i_product,name,price,pic,info,category)values(20,'흰색 슬랙스 바지',20000,'pants/pants2.jpg','흰색 슬랙스 바지입니다','pants');
insert into product(i_product,name,price,pic,info,category)values(21,'연청바지',25000,'pants/pants3.jpg','연청바지입니다.','pants');
insert into product(i_product,name,price,pic,info,category)values(22,'검정바지',22000,'pants/pants4.jpg','검정바지입니다.','pants');
insert into product(i_product,name,price,pic,info,category)values(23,'검정 슬랙스',15000,'pants/pants5.jpg','검정 슬랙스입니다','pants');
insert into product(i_product,name,price,pic,info,category)values(24,'청바지',12000,'pants/pants6.jpg','청바지입니다','pants');
insert into product(i_product,name,price,pic,info,category)values(25,'라떼처럼 체크 오버셔츠',19900,'shirt/shirt1.jpg','라떼처럼 체크 오버셔츠입니다','shirt');
insert into product(i_product,name,price,pic,info,category)values(26,'탄탄 브이넥 오버 카라셔츠',27000,'shirt/shirt2.jpg','탄탄 브이넥 오버 카라셔츠입니다','shirt');
insert into product(i_product,name,price,pic,info,category)values(27,'화사한나날들 오버셔츠',24900,'shirt/shirt3.jpg','화사한나날들 오버셔츠','shirt');
insert into product(i_product,name,price,pic,info,category)values(28,'마초 세미오버 셔츠',29900,'shirt/shirt4.jpg','마초 세미오버 셔츠입니다','shirt');
insert into product(i_product,name,price,pic,info,category)values(29,'밀크티 오버 체크 셔츠자켓',48000,'shirt/shirt5.jpg','밀크티 오버 체크 셔츠자켓입니다','shirt');
insert into product(i_product,name,price,pic,info,category)values(30,'히든 링클프리 오버 반팔셔츠',18600,'shirt/shirt6.jpg','히든 링클프리 오버 반팔셔츠','shirt');
insert into product(i_product,name,price,pic,info,category)values(31,'키높이소가죽수제화',34900,'shoes/shoes1.jpg','키높이소가죽수제화입니다','shoes');
insert into product(i_product,name,price,pic,info,category)values(32,'썬셋 소프트 스니커즈',28000,'shoes/shoes2.jpg','썬셋 소프트 스니커즈입니다','shoes');
insert into product(i_product,name,price,pic,info,category)values(33,'호테 방울 로퍼 슈즈',39500,'shoes/shoes3.jpg','호테 방울 로퍼 슈즈입니다','shoes');
insert into product(i_product,name,price,pic,info,category)values(34,'비트 어글리 키높이 운동화',50000,'shoes/shoes4.jpg','비트 어글리 키높이 운동화입니다','shoes');
insert into product(i_product,name,price,pic,info,category)values(35,'클리크 로퍼 슈즈',45000,'shoes/shoes5.jpg','클리크 로퍼 슈즈입니다','shoes');
insert into product(i_product,name,price,pic,info,category)values(36,'알렉스 벨크로 키높이운동화',36000,'shoes/shoes6.jpg','알렉스 벨크로 키높이운동화입니다','shoes');
insert into product(i_product,name,price,pic,info,category)values(37,'심플 기본 발목양말',27900,'item/item1.jpg','심플 기본 발목양말입니다','item');
insert into product(i_product,name,price,pic,info,category)values(38,'써클 벨트',19500,'item/item2.jpg','써클 벨트입니다','item');
insert into product(i_product,name,price,pic,info,category)values(39,'모노시크 안경',16900,'item/item3.jpg','모노시크 안경입니다','item');
insert into product(i_product,name,price,pic,info,category)values(40,'블랙 슬림 자동넥타이',18700,'item/item4.jpg','블랙 슬림 자동넥타이입니다','item');
insert into product(i_product,name,price,pic,info,category)values(41,'무드 파나마 모자',19900,'item/item5.jpg','무드 파나마 모자입니다','item');
insert into product(i_product,name,price,pic,info,category)values(42,'키높이 양말깔창',12900,'item/item6.jpg','키높이 양말깔창입니다','item');
insert into product(i_product,name,price,pic,info,category)values(43,'시그니쳐 슬림 슬랙스',1000,'sale85/sale1.jpg','시그니쳐 슬림 슬랙스입니다','sale85');
insert into product(i_product,name,price,pic,info,category)values(44,'시크릿밴딩 슬림청바지',15000,'sale85/sale2.jpg','시크릿밴딩 슬림청바지입니다','sale85');
insert into product(i_product,name,price,pic,info,category)values(45,'와치미 슬림 슬랙스',5000,'sale85/sale3.jpg','와치미 슬림 슬랙스입니다','sale85');
insert into product(i_product,name,price,pic,info,category)values(46,'달리 세미와이드 연청바지',5000,'sale85/sale4.jpg','달리 세미와이드 연청바지입니다','sale85');
insert into product(i_product,name,price,pic,info,category)values(47,'쿨가이 슬림 밴딩슬랙스',10500,'sale85/sale5.jpg','쿨가이 슬림 밴딩슬랙스입니다','sale85');
insert into product(i_product,name,price,pic,info,category)values(48,'델리 배색 슬림 밴딩조거바지',6000,'sale85/sale6.jpg','델리 배색 슬림 밴딩조거바지입니다','sale85');
commit;


-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------
