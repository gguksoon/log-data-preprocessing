DELETE FROM CD;
INSERT INTO CD (CD_ID, CD_NM, UP_CD_ID) VALUES
  ('CD01', '저장 방법', null) 
, ('CD0101', 'DB 적재', 'CD01')
, ('CD0102', '다운로드', 'CD01')
, ('CD02', '진행 상태', null)
, ('CD0201', '대기중', 'CD02')
, ('CD0202', '진행중', 'CD02')
, ('CD0203', '완료', 'CD02')
, ('CD0204', '에러', 'CD02')
;

DELETE FROM LPP;
INSERT INTO LPP (FILE_PATH, EXTR_METHOD, DB_TYPE, DB_URL, DB_PORT, DB_NAME, DB_USER, DB_PASS, TABLE_NAME, STATUS, REG_DATE) VALUES
  ('C:\\Users\\msjo\\Desktop\\test_log_files\\localhost_access_log.2022-02-14.txt', 'CD0101', 'MariaDB', '10.10.250.105', '23306', 'lpp', 'root', 'Dpfdlxpzm08!', 'TEST_TABLE', 'CD0201', now())
, ('/logs', 'CD0101', 'H2', 'mem', null, 'testdb', 'sa', '', 'TEST_TABLE2', 'CD0203', now())
, ('/logs', 'CD0102', null, null, null, null, null, null, null, 'CD0204', now())
, ('/진행중 테스트용, 실제로 진행중 아님', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now())
, ('페이징 테스트용1', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용2', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용3', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용4', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용5', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용6', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용7', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용8', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용9', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용10', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용11', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용12', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용13', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용14', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용15', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용16', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용17', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용18', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용19', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용20', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용21', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용22', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용23', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용24', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
, ('페이징 테스트용25', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now()-1)
;

DELETE FROM REGEX;
INSERT INTO REGEX (REGEX, COLUMN_NAME, LPP_ID) VALUES 
  ('^(.*?)\s-', 'IP', 1)
, ('\[(.*?)\]', 'DATE', 1)
, ('\"(.*?)\s/', 'METHOD', 1)
, ('\s(/.*?)\s', 'PATH', 1)
, ('\"\s(.*?)\s[0-9]', 'RESPONSE', 1)
, ('[0-9]\s([0-9].*?)$', 'BYTE', 1)
;
