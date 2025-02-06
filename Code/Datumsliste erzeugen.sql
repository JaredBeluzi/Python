/*
Ergebnis ist

01.01.2023 00:00:00
02.01.2023 00:00:00
03.01.2023 00:00:00
04.01.2023 00:00:00
05.01.2023 00:00:00
06.01.2023 00:00:00
07.01.2023 00:00:00
...
*/

DECLARE @Start DATE = '2023-01-01'
DECLARE @Ende DATE = CAST(GETDATE() AS DATE)

CREATE TABLE #tmp (Datum DATE)

WHILE @Start <= @Ende
BEGIN
    INSERT INTO #tmp (Datum) VALUES (@Start)
    SET @Start = DATEADD(DAY, 1, @Start)
END

SELECT Datum 
INTO	dbo.{Anzeigesicht}
FROM #tmp

DROP TABLE #tmp
