DELETE FROM LPP;
INSERT INTO LPP (FILE_PATH, EXTR_METHOD, DB_URL, DB_PORT, DB_NAME, DB_USER, DB_PASS, TABLE_NAME) VALUES
  ('/logs', '1', '10.10.250.105', '23306', 'lpp', 'root', 'Dpfdlxpzm08!', 'TEST_TABLE')
, ('/logs', '2', null, null, null, null, null, null)
;

DELETE FROM REGEX;
INSERT INTO REGEX (REGEX, COLUMN_NAME, LPP_ID) VALUES 
  ('^(.*?)\s-', 'ip', 1)
, ('\\[(.*?)\\]', 'date', 1)
, ('\"(.*?)\s/', 'method', 1)
, ('\"\s(.*?)\s[0-9]', 'response', 1)
, ('[0-9]\s([0-9].*?)$', 'byte', 1)
;