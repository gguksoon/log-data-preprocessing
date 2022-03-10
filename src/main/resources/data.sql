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
, ('C:\\Users\\msjo\\Desktop\\test_log_files\\localhost_access_log.2022-02-14.txt', 'CD0101', 'MariaDB', '10.10.250.105', '23306', 'lpp', 'root', 'Dpfdlxpzm08!', 'TEST_TABLE', 'CD0201', now())
, ('/logs', 'CD0101', 'H2', 'mem', null, 'testdb', 'sa', '', 'TEST_TABLE2', 'CD0203', now())
, ('/logs', 'CD0102', null, null, null, null, null, null, null, 'CD0204', now())
, ('진행중 테스트용, 실제로 진행중 아님', 'CD0102', null, null, null, null, null, null, null, 'CD0202', now())
;

DELETE FROM REGEX;
INSERT INTO REGEX (REGEX, COLUMN_NAME, LPP_ID) VALUES 
  ('^(.*?)\s-', 'IP', 1)
, ('\[(.*?)\]', 'DATE', 1)
, ('\"(.*?)\s/', 'METHOD', 1)
, ('\s(/.*?)\s', 'PATH', 1)
, ('\"\s(.*?)\s[0-9]', 'RESPONSE', 1)
, ('[0-9]\s([0-9].*?)$', 'BYTE', 1)
, ('^(.*?)\s-', 'IP', 2)
, ('\[(.*?)\]', 'DATE', 2)
, ('\"(.*?)\s/', 'METHOD', 2)
, ('\s(/.*?)\s', 'PATH', 2)
, ('\"\s(.*?)\s[0-9]', 'RESPONSE', 2)
, ('[0-9]\s([0-9].*?)$', 'BYTE', 2)
;
