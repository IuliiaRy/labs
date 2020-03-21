PROGRAM Hello_people(INPUT, OUTPUT);
USES
  DOS;
VAR
  Query, Name: STRING;
  Inc: INTEGER;
BEGIN
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Name := '';
  Query := GetEnv('QUERY_STRING');
  Inc := POS('=', GetEnv('QUERY_STRING')) + 1;
  WHILE (Inc <= LENGTH(Query))
  DO
    BEGIN
      Name := Name + Query[Inc];
      Inc := Inc +1;
    END;
  IF Name = ''
  THEN
    WRITELN('Hello Anonymous!')
  ELSE
    WRITELN('Hello dear, ', Name, ' !');
END.
