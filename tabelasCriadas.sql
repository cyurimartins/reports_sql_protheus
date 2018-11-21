SELECT name, crdate
FROM sysobjects
WHERE xtype='U' AND name LIKE 'Z%'
ORDER BY crdate desc
