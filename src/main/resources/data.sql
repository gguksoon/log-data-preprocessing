DELETE FROM LPP;
INSERT INTO LPP (FILE_PATH, EXTR_METHOD, DB_TYPE, DB_URL, DB_PORT, DB_NAME, DB_USER, DB_PASS, TABLE_NAME) VALUES
  ('/logs', '1', 'MariaDB', '10.10.250.105', '23306', 'lpp', 'root', 'Dpfdlxpzm08!', 'TEST_TABLE')
, ('/logs', '1', 'H2', 'mem', null, 'testdb', 'sa', '', 'TEST_TABLE2')
, ('/logs', '2', null, null, null, null, null, null, null)
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