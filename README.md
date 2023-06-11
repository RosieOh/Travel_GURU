# Travel_GURU

## Data Base
```
CREATE TABLE users (
    id VARCHAR(100) PRIMARY KEY,
    password CHAR(64) NOT NULL,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    address VARCHAR(100) NOT NULL,
    auth VARCHAR(5) NOT NULL,
    kakaoid BIGINT,
    naverid BIGINT,
    createdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE users ADD CHECK (auth IN ('admin', 'user'));

CREATE TABLE product (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    price INT NOT NULL,
    category VARCHAR(100) NOT NULL,
    summary VARCHAR(500) NOT NULL,
    content VARCHAR(5000) NOT NULL,
    imgurl_1 VARCHAR(100) NOT NULL,
    imgurl_2 VARCHAR(100),
    imgurl_3 VARCHAR(100),
    imgurl_4 VARCHAR(100)
);

CREATE TABLE favorite (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(100) NOT NULL,
    product_id INT NOT NULL
);

ALTER TABLE favorite ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE favorite ADD FOREIGN KEY (product_id) REFERENCES product(id);

CREATE TABLE cart (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(100) NOT NULL,
    product_id INT NOT NULL
);

ALTER TABLE cart ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE cart ADD FOREIGN KEY (product_id) REFERENCES product(id);

CREATE TABLE board (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(100) NOT NULL,
    title VARCHAR(500) NOT NULL,
    content VARCHAR(5000) NOT NULL,
    viewcount INT NOT NULL DEFAULT 0,
    isDeleted BOOLEAN DEFAULT FALSE,
    createdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedate TIMESTAMP,
    deletedate TIMESTAMP
);

ALTER TABLE board ADD FOREIGN KEY (user_id) REFERENCES users(id);

CREATE TABLE comment (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id VARCHAR(100) NOT NULL,
    bbs_id INT NOT NULL,
    content VARCHAR(5000) NOT NULL,
    isDeleted BOOLEAN DEFAULT FALSE,
    createdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updatedate TIMESTAMP,
    deletedate TIMESTAMP
);

ALTER TABLE comment ADD FOREIGN KEY (user_id) REFERENCES users(id);
ALTER TABLE comment ADD FOREIGN KEY (bbs_id) REFERENCES bbs(id);
```

## DB 내용
```
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('대만(taiwan)', 380000, '아시아', '~4박 5일~ 대만 투어 타이베이/전세기출발/인천', 'null', '/images/product/taiwan.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('베트남(vietnam)', 570000, '아시아', '~5박 6일~ 베트남 투어 하노이/나트랑', 'null', '/images/product/vietnam.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('싱가포르(singapore)', 800000, '아시아', '~3박 4일~ 싱가포르 호캉스 투어/센토사', 'null', '/images/product/singapore.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('일본(japan)', 250000, '아시아', '~2박 3일~ 일본 오사카 시티투어', 'null', '/images/product/japan.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('이스탄불(istanbul)', 1500000, '아시아', '~10박 11일~ 튀르키예 여행의 진수, 이스탄불 투어', 'null', '/images/product/istanbul.png');

INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('미국(Disney)', 2500000, '미주', '~8박 9일~ 환상의 디즈니월드 투어/디즈니 호텔', 'null', '/images/product/disney.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('미국(Grandcanyon)', 2200000, '미주', '~10박 11일~ 신비한 계곡, 그랜드캐년 투어', 'null', '/images/product/grand.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('미국(Newyork)', 2000000, '미주', '~8박 9일~ 진정한 미국투어의 끝, 뉴욕 야경 시티투어', 'null', '/images/product/newyork.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('캐나다(Toronto)', 2000000, '미주', '~5박 6일~ 캐나다 최대의 도시/시티투어', 'null', '/images/product/toronto.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('캐나다(Vancouver)', 1800000, '미주', '~7박 8일~ 환상의 캐나다 자연의 위엄, 벤쿠버 투어', 'null', '/images/product/vancouver.jpg');

INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('스페인(Barcelona)', 380000, '유럽', '~10박 11일~ 정열의 나라 스페인, 바르셀로나 투어', 'null', '/images/product/barcelona.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('헝가리(Budapest)', 570000, '유럽', '~10박 11일~ 동유럽 문화의 정수, 헝가리 부다페스트 투어/오페라 투어', 'null', '/images/product/budapest.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('프랑스(Paris)', 800000, '유럽', '~10박 11일~  유럽 최고의 도시, 예술과 패션 유행의 선도적인 도시 파리 투어', 'null', '/images/product/paris.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('이탈리아(Rome)', 250000, '유럽', '~10박 11일~ 로마문화의 발상지, 이탈리아 로마 투어', 'null', '/images/product/rome.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('폴란드(Warsaw)', 1500000, '유럽', '~9박 10일~ 동유럽 문화와 현대적인 건축물의 만남, 폴란드 바르샤바 투어', 'null', '/images/product/warsaw.jpg');

INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('두바이(Dubai)', 2300000, '중동', '~9박 10일~ 최고의 휴양도시 두바이 투어. 6성급 호텔/에미레트항공사', 'null', '/images/product/dubai.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('사우디(Saudi)', 2000000, '중동', '~7박 8일~ 이슬람의 성지, 최신 도시의 감성과 사막의 감성을 합친 복합적인 투어', 'null', '/images/product/saudi.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('아랍에미레이트(UAE)', 2150000, '중동', '~6박 7일~ 거대한 모스크와 환상적인 호텔, 아부다비 투어', 'null', '/images/product/uae.jpg');

INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('호주(Australia)', 1300000, '오세아니아', '~10박 11일~ 호주 최대의 도시 시드니 투어. 아름다운 오페라 하우스와 하버브릿지의 만남', 'null', '/images/product/australia.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('피지(Fiji)', 1200000, '오세아니아', '~6박 7일~ 남태평양 아름다운 휴양섬 피지. 남국의 여유로움과 에메랄드빛 바다를 즐겨라!', 'null', '/images/product/fiji.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('뉴질랜드(Newzealand)', 1800000, '오세아니아', '~7박 8일~ 태고의 섬 뉴질랜드, 숨막히는 자연의 아름다움과 화려한 도시를 함께 즐기자', 'null', '/images/product/newzealand.jpg');
INSERT INTO product(name, price, category, summary, content, imgurl_1) VALUES('뉴질랜드 북섬(Newzealandnorth)', 1400000, '오세아니아', '~5박 6일~ 특가! 뉴질랜드 북섬만을 즐겨보자. 웅장한 자연을 즐기고 싶은 당신에게', 'null', '/images/product/newzealandnorth.jpg');

INSERT INTO users(id, password, name, email, phone, address, auth) VALUES('admin', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', '관리자', 'admin@guru.com', '01012345678', '머전팡역시', 'admin');
INSERT INTO users(id, password, name, email, phone, address, auth) VALUES('parkjh', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', '박종현', 'parkjh@guru.com', '01012345678', '머전팡역시', 'user');
INSERT INTO users(id, password, name, email, phone, address, auth) VALUES('leeks', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', '이규석', 'leeks@guru.com', '01012345678', '머전팡역시', 'user');
INSERT INTO users(id, password, name, email, phone, address, auth) VALUES('kimmk', '0ffe1abd1a08215353c233d6e009613e95eec4253832a761af28ff37ac5a150c', '김민규', 'kimmk@guru.com', '01012345678', '머전팡역시', 'user');

INSERT INTO board(user_id, title, content) VALUES('parkjh', '테스트 글입니다 1', '테스트 내용입니다 1');
INSERT INTO board(user_id, title, content) VALUES('leeks', '테스트 글입니다 2', '테스트 내용입니다 2');
INSERT INTO board(user_id, title, content) VALUES('kimmk', '테스트 글입니다 3', '테스트 내용입니다 3');
INSERT INTO board(user_id, title, content) VALUES('parkjh', '테스트 글입니다 4', '테스트 내용입니다 4');
INSERT INTO board(user_id, title, content) VALUES('leeks', '테스트 글입니다 5', '테스트 내용입니다 5');
INSERT INTO board(user_id, title, content) VALUES('kimmk', '테스트 글입니다 6', '테스트 내용입니다 6');
INSERT INTO board(user_id, title, content) VALUES('parkjh', '테스트 글입니다 7', '테스트 내용입니다 7');
INSERT INTO board(user_id, title, content) VALUES('leeks', '테스트 글입니다 8', '테스트 내용입니다 8');
INSERT INTO board(user_id, title, content) VALUES('kimmk', '테스트 글입니다 9', '테스트 내용입니다 9');
INSERT INTO board(user_id, title, content) VALUES('parkjh', '테스트 글입니다 10', '테스트 내용입니다 10');
INSERT INTO board(user_id, title, content) VALUES('leeks', '테스트 글입니다 11', '테스트 내용입니다 11');
INSERT INTO board(user_id, title, content) VALUES('kimmk', '테스트 글입니다 12', '테스트 내용입니다 12');
INSERT INTO board(user_id, title, content) VALUES('parkjh', '테스트 글입니다 13', '테스트 내용입니다 13');
INSERT INTO board(user_id, title, content) VALUES('leeks', '테스트 글입니다 14', '테스트 내용입니다 14');
INSERT INTO board(user_id, title, content) VALUES('kimmk', '테스트 글입니다 15', '테스트 내용입니다 15');
```
