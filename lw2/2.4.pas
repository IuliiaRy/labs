PROGRAM GetQueryParameter(INPUT, OUTPUT);
USES
  DOS;
VAR
  Value: STRING;
FUNCTION GetQueryStringParameter(Key: STRING): STRING;
VAR
  Query, Val: STRING;
  Position: INTEGER;
BEGIN
  Val := '';
  Query := GetEnv('QUERY_STRING');
  Position := POS(Key + '=', Query);
  IF (Position <> 0) AND ((Position + Length(Key) + 1) <= Length(Query))
  THEN
    BEGIN
      Position := Position + Length(Key) + 1;
      WHILE ((Query[Position] <> '&') AND (Position <= Length(Query)))
      DO
        BEGIN
          Val := Val + Query[Position];
          Position := Position + 1
        END;
      GetQueryStringParameter := Val
    END
  ELSE
    GetQueryStringParameter := 'Key not found.'
END;
BEGIN
  WRITELN('Content-Type: text/plain');
  WRITELN;
  Value := GetQueryStringParameter('name');
  WRITELN(Value)
END.
