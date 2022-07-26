 SELECT 1;

-- 한줄 주속
/*
 여러줄 주석
 */

-- 구성요소의 이름을 명시할때는 (`)로 감싼다.
-- 모든 쿼리는 끝에 ;로 끝낸다.
-- 구성 요소의 이름은 Snake Case로 한다.

-- 사용자(User) | DBMS에 접속하여 명령 할 수 있는 사용자

-- Database(스키마, Schema) | 서로 관련있는 테이블을 보유하는 역할
-- Schema | CREATE
 CREATE SCHEMA `testschema`; -- 오휴 발생시 near 확인

-- Schema | READ
 SHOW SCHEMAS;
-- Schema | UPDATE 없음
-- Schema | DELETE
 DROP SCHEMA `testschema`; -- 모든 데이터가 제거 되므로 주의 요망

-- 테이블(Table) | 레코드를 담을 수 있는 대상
-- Table | CREATE
CREATE TABLE `testschema`.`test_table` (
    `test_column_one` INT UNSIGNED,
    `test_column_two` VARCHAR(10),
    `test_column_three` BOOLEAN,
    `test_column_four` DATETIME
);
 -- 테이블 이름은 주로 복수형으로 한다.
 -- 기본키(Primary Key) : 그 테이블의 주 축이되는 열(들)을 의미한다. 해당 열 값은 중복 될 수 없으면, DBMS 엔진이 색인(indexing)을 하기 때문에 조회(select) 속도가 빨라진다.
 -- 실질적으로 모든 테이블이 가지고 있어야 한다. 줄여서 PK이라고 한다.
 -- 외래키(Foreign Key) : 어떠한 열들이 가질 수 있는 값을 다른 테이블의 여들이 가진 값으로 제한한다. 소로 다른 테이블 간의 상관 관계를 만들어 줌.
 -- 참조 되는 키는 Primary key 이거나 UNIQUE 이여야 한다.

-- Table | READ
SHOW TABLES IN `testschema`; -- 스키마 안의 테이블 나열
DESC `testschema`.`test_table`; -- DESCRIBE 테이블 열 구조 설명

-- Table | UPDATE
ALTER TABLE `testschema`.`test_table` ADD COLUMN `test_column_five` YEAR; -- 열 추가 테이블 열 중 가장 뒤에 추가
ALTER TABLE `testschema`.`test_table` ADD COLUMN `test_column_three` BOOLEAN AFTER `test_column_two`; -- after 값 뒤에 추가
ALTER TABLE `testschema`.`test_table` ADD COLUMN `test_column_zero` BOOLEAN FIRST; -- 가장 앞에 열 추가

ALTER TABLE `testschema`.`test_table` DROP COLUMN `test_column_three`; -- 열 삭제

ALTER TABLE `testschema`.`test_table` MODIFY COLUMN `test_column_two` VARCHAR(20); -- 열 수정
ALTER TABLE `testschema`.`test_table` MODIFY COLUMN `test_column_zero` BOOLEAN NOT NULL; -- 열 수정
ALTER TABLE `testschema`.`test_table` MODIFY COLUMN `test_column_zero` BOOLEAN NOT NULL DEFAULT FALSE; -- 열 수정
ALTER TABLE `testschema`.`test_table` RENAME COLUMN `test_column_five` TO `test_column_last`; -- 열 이름 변경

ALTER TABLE `world`.`countries`ADD CONSTRAINT PRIMARY KEY (`code`); -- 제약 조건 추가 같은 값 추가 불가능
ALTER TABLE `world`.`populations` ADD FOREIGN KEY (`country_code`) REFERENCES `world`.`countries` (`code`);
-- countries의 code에 존재 하지 않는 country_code 입력 불가능 Foreign Key 외래키
-- Table | DELETE
DROP TABLE `testschema`.`test_table`; -- 테이블이 포함하고 있는 레코드가 모두 삭제

TRUNCATE `testschema`.`test_table`; -- 테이블이 가진 모든 데이터를 삭제한다.

-- 열(Column) | 데이터의 종류와 목적을 제한하고 테이블의 구조를 정의할 수 있는 대상
-- 열 구조 | `열 이름` 열 타입 <? NOT NULL> <? DEFAULT X> X는 기본 값
    /*
  열 타입
   정수
    TINYINT 1byte -128 - 127,
    SMALLINT 2byte -32768 - 32768,
    MEDIUMINT 3byte, -8388608 - 8388607
    INT 4byte,
    BIGINT 8byte 무제한 수
    부호 없는 정수 옵션 : 위 각 정수 타입 뒤에 UNSIGNED 라는 키워드를 붙이면 부호가 사라지는 대신 양의 범위가 그만큼 늘어난다.
    가령, TINY 타입은 -128부터 127까지 인대 반해, TINY UNSIGNED 타입은 0부터 256까지이다.
    타입 뒤에 괄호 열고 자리수를 명시할 수 있다. 가령 TINYINT(1) UNSIGNED 타입은 0부터 9까지의 데이터만 들어갈 수 있다.
   실수
    FLOAT 4byte
    DOUBLE 8byte
    소수자리의 유실 경우가 많아 정밀한 계산이 필요한 경우 사용하지 않는다.
    UNSIGNED 사용 가능
   부동 소수점
    DECIMAL(a, b) a byte | a는 소수점을 제외한 전체길이를, b는 그중 소수부의 길이를 정의한다.
                  가령 DECIMAL(5, 2)는 -999.99 부터 999.99까지이다.
  문자
    VARCHAR(n) 최대 2N byte 문자 n개를 담을 수 있다. 빈 공간은 차지 않지 않는다. n은 최대 65535
    TINYTEXT(n) n은 최대 255
    TEXT(n) n byte 문자 n개를 담을 수 있다. 이때 n은 최대 65535 빈 공간도 차지한다.
    MEDIUMTEXT(n) n은 최대 16777215
    LONGTEXT(n) n은 최대 4294967295

  날짜와 시간
    DATE 3byte 년/월/일
    TIME 3byte 시/분초
    YEAR 1byte 년도
    DATETIME 8byte 년/월/일 시:분:초
    TIMESTAMP  4byte 년/월/일 시:분:초, UNIX 시간을 가짐. 시스템 시간이 변경될 경우 함께 변경됨
                                      UNIX 시간은 1970-01-01 00:00:00부터 지금(시스템 시간)까지 흐른 시간을 초로 나타낸 값.
                                      UNIX 시간이 INT 값을 초과하면 오버플로우(Overflow)가 발행해 -INT로 돌아간다.
                                      이 일시가 2038-01-19 03:14:07이고 이런 문제를 2038년 문제 (Year 2038 Problem)이라고 한다.
    TIME 타입과 DATETIME 타입은 뒤에 (n)을 붙여 밀리초를 포함할 수 있다. 가령 DATETIME(3) 타입은 yyyy-mm-dd HH:mm:ss'SSS까지 포현할 수 있다.

  이진데이터
    TINYBLOB(n) n은 최대 255
    BLOB(n) n byte 이진데이터 n개를 담을 수 있다. 이때 n은 최대 65535 빈 공간도 차지한다.
    MEDIUMBLOB(n) n은 최대 16777215
    LONGBLOB(n) n은 최대 4294967295

  기타
    BOOLEAN 1byte 참 거짓 값을 가지는 논리 값.

     */

-- 레코드(행, Record) | 실제 데이터
-- Record | CREATE
INSERT INTO `testschema`.`test_table`(`test_column_one`,`test_column_two`)
VALUES (5,'가나다라마바사'); -- INSERT 시, 명시하지 않은 열에는 DEFAULT 값이 없다 NULL 값이 들어간다.

INSERT INTO `testschema`.`test_table` (`test_column_three`,`test_column_four`)
VALUES (TRUE, '2022-07-13 21:00:00'),
       (TRUE, '2022-07-13 21:00:00'); -- ,를 이용하여 여러줄도 가능

INSERT INTO `testschema`.`test_table`(`test_column_one`, `test_column_two`, `test_column_three`, `test_column_four`, `test_column_five`, `test_column_zero`)
VALUES (10, 'HELLO', FALSE, NOW(), '2022', TRUE);

 -- Record | READ
SELECT * FROM `testschema`.`test_table`; -- * 위치 조회할 열 *은 전체
SELECT `test_column_one` FROM `testschema`.`test_table`;
SELECT `test_column_zero`, `test_column_one`, 312 FROM `testschema`.`test_table`;
-- ORDER BY `이름` 이름을 기준으로 정렬 LIMIT N 불러올 개수를 N개로 제한

 -- Record | UPDATE

 UPDATE `testschema`.`test_table` SET `test_column_one`= 55;
 UPDATE `testschema`.`test_table` SET `test_column_one`= 55 WHERE test_column_one = 1;

 -- Record | DELETE

 DELETE FROM `testschema`.`test_table` -- 모든 데이터 제거
 DELETE FROM  `testschema`.`test_table` WHERE `test_column_zero` = 1;
 DELETE FROM  `testschema`.`test_table` WHERE `test_column_zero` = 1 LIMIT 1;
 DELETE FROM  `testschema`.`test_table` WHERE `test_column_zero` = 1 AND `test_column_three` = 1;
 DELETE FROM  `testschema`.`test_table` WHERE `test_column_zero` = 1 OR `test_column_three` = 1;
-- CRUD | CREATE READ UPDATE DELETE

Function

-- COUNT(x) x열의 개수를 반환
-- CONCAT(v,...) 주어진 값들을 모두 이어 붙임
-- MIN(x) x열 값 중 가장 작은 값
-- MAX(x) x열 값 중 가장 큰 값
-- AVG(x) x열 값 평균
-- CEIL(x) x값을 올림함
-- FLOOR(x) x값을 내림함
-- ROUND(a, b) a값을 소수점 b자리 까지 반올림 함
-- ABS(x) x값의 절댓값
-- IF(c < 10, t, f) c 조건이 참이면 t를 거짓이면 f를 반환
-- IFNULL(x, a) x열(값)이 NULL 일 경우 a값을 반환 아니라면 x값을 반환
-- LEFT(s, n) s 문자열에서 왼쪽 n개의 문자를 반환
-- RIGHT(s, n) s 문자열에서 오른쪽 n개의 문자를 반환
-- REPLACE(s, f, t) s 문자열에서 f 문자열을 찾아 t 문자열로 치환
-- SUBSTRING(s, p, n) s 문자열에서 p 위치부터 n개의 문자열을 반환
-- TRIM([BOTH|LEADING|TRAILING] FROM s] s 문자열에서 앞 뒤 혹은 양쪽 공백을 찾아 제거 LEADING 앞 TRAILING 뒤 BOTH 양쪽
-- LENGTH(s) s 문자열의 길이를 반환
