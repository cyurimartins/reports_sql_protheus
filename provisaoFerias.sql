SELECT RA_FILIAL,CC,COD,RV_DESC,SUM(ANTERIOR) ANTERIOR, SUM(ATUAL) ATUAL, SUM(ATUAL-ANTERIOR) NOMES
FROM
(
SELECT RA_FILIAL,RT_CC CC,RT_DATACAL,RV_COD AS COD,RV_DESC,
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201709' THEN RT_VALOR ELSE 0 END) AS ANTERIOR,
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201710' THEN RT_VALOR ELSE 0 END) AS ATUAL
FROM SRV100 SRV
LEFT JOIN CT5100 CT5 ON SRV.RV_LCTOP=CT5.CT5_LANPAD AND CT5.D_E_L_E_T_ = '' AND CT5.CT5_FILIAL = '01'
INNER JOIN SRT100 SRT ON SRV.RV_COD=SRT.RT_VERBA
INNER JOIN SRA100 SRA ON SRA.RA_FILIAL = SRT.RT_FILIAL AND SRA.RA_MAT=SRT.RT_MAT AND SRT.D_E_L_E_T_ = ''
WHERE Substring(SRT.RT_DATACAL,1,6) BETWEEN '201709' AND '201710'
AND SRA.RA_FILIAL = '01' 
AND SRT.RT_VERBA IN ('730','731','732','741','749','754','755','772','773','774','775','802','803','804','805','806','811','812','813','814','815')
GROUP BY RA_FILIAL,RT_CC,RT_DATACAL,RV_COD,RV_DESC
) AS PROVFERIAS
GROUP BY RA_FILIAL,CC,COD,RV_DESC
ORDER BY COD


--VERSAO 02 TESTES

--FERIAS VENCIDAS
SELECT RT_MAT, RT_CC, RT_VERBA, RV_DESC, RT_VALOR, RT_DATACAL FROM SRT100 SRT 
	LEFT JOIN SRV100 SRV ON SRV.RV_COD = SRT.RT_VERBA AND SRV.D_E_L_E_T_ = ''
WHERE RT_TIPPROV = '1' AND SUBSTRING(SRT.RT_DATACAL,1,6) BETWEEN '201709' AND '201710' AND RT_CC = '210110'


-- versao 03 

--FERIAS VENCIDAS
SELECT RT_MAT, RT_CC, RT_VERBA, RV_DESC, RT_VALOR, RT_DATACAL, RT_DATABAS, RT_TIPPROV,
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201708' THEN RT_VALOR ELSE 0 END) AS ANTERIOR,
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201710' THEN RT_VALOR ELSE 0 END) AS ATUAL
FROM SRT100 SRT 
	LEFT JOIN SRV100 SRV ON SRV.RV_COD = SRT.RT_VERBA 
		AND SRV.D_E_L_E_T_ = ''
WHERE RT_TIPPROV IN ('1','2') 
	AND SUBSTRING(SRT.RT_DATACAL,1,6) BETWEEN '201708' AND '201710'
	AND RT_CC = '210210'
	AND SRT.D_E_L_E_T_ = ''
	AND RT_VERBA = '730'
	AND RT_TIPPROV = '1'
GROUP BY RT_MAT, RT_CC, RT_VERBA, RV_DESC, RT_VALOR, RT_DATACAL, RT_DATABAS, RT_TIPPROV
ORDER BY RT_DATACAL

SELECT RA_FILIAL,CC,COD,RV_DESC,SUM(ANTERIOR) ANTERIOR, SUM(ATUAL) ATUAL, RT_TIPPROV, RT_DATACAL
FROM
(
SELECT RA_FILIAL,RT_CC CC,RT_DATACAL,RV_COD AS COD,RV_DESC, RT_TIPPROV,
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201708' THEN RT_VALOR ELSE 0 END) AS ANTERIOR,
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201709' THEN RT_VALOR ELSE 0 END) AS ATUAL
FROM SRV100 SRV
LEFT JOIN CT5100 CT5 ON SRV.RV_LCTOP=CT5.CT5_LANPAD AND CT5.D_E_L_E_T_ = '' AND CT5.CT5_FILIAL = '01'
INNER JOIN SRT100 SRT ON SRV.RV_COD = SRT.RT_VERBA
INNER JOIN SRA100 SRA ON SRA.RA_FILIAL = SRT.RT_FILIAL AND SRA.RA_MAT=SRT.RT_MAT AND SRT.D_E_L_E_T_ = ''
WHERE Substring(SRT.RT_DATACAL,1,6) BETWEEN '201708' AND '201709' AND 
SRA.RA_FILIAL = '01' 
AND RT_TIPPROV IN ('1', '2')
--AND SRT.RT_VERBA IN ('730','731','732','741','749','754','755','772','773','774','775','802','803','804','805','806','811','812','813','814','815')
GROUP BY RA_FILIAL,RT_CC,RT_DATACAL,RV_COD,RV_DESC, RT_TIPPROV
) AS PROVFERIAS
WHERE CC = '210210'
GROUP BY RA_FILIAL,CC,COD,RV_DESC, RT_TIPPROV, RT_DATACAL
ORDER BY COD, RT_TIPPROV

-- VERSAO 04

--FERIAS VENCIDAS

SELECT RT_CC, RT_VERBA, RV_DESC, RT_DATACAL, RT_TIPPROV, 
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201708' THEN RT_VALOR ELSE 0 END) AS ANTERIOR,
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201709' THEN RT_VALOR ELSE 0 END) AS ATUAL
FROM SRT100 SRT 
	LEFT JOIN SRV100 SRV ON SRV.RV_COD = SRT.RT_VERBA 
		AND SRV.D_E_L_E_T_ = ''
WHERE RT_TIPPROV IN ('1','2') 
	AND SUBSTRING(SRT.RT_DATACAL,1,6) BETWEEN '201708' AND '201709'
	AND RT_CC = '210210'
	AND SRT.D_E_L_E_T_ = ''
	AND RT_VERBA = '731'
	AND RT_TIPPROV = '1'
GROUP BY  RT_CC, RT_VERBA, RV_DESC, RT_DATACAL, RT_TIPPROV, RT_VERBA
ORDER BY RT_DATACAL

--FERIAS A VENCER

SELECT RT_CC, RT_VERBA, RV_DESC, RT_DATACAL, RT_TIPPROV, 
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201708' THEN RT_VALOR ELSE 0 END) AS ANTERIOR,
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201709' THEN RT_VALOR ELSE 0 END) AS ATUAL
FROM SRT100 SRT 
	LEFT JOIN SRV100 SRV ON SRV.RV_COD = SRT.RT_VERBA 
		AND SRV.D_E_L_E_T_ = ''
WHERE RT_TIPPROV IN ('1','2') 
	AND SUBSTRING(SRT.RT_DATACAL,1,6) BETWEEN '201708' AND '201709'
	AND RT_CC = '210210'
	AND SRT.D_E_L_E_T_ = ''
	AND RT_VERBA = '731'
	AND RT_TIPPROV = '2'
GROUP BY  RT_CC, RT_VERBA, RV_DESC, RT_DATACAL, RT_TIPPROV, RT_VERBA
ORDER BY RT_DATACAL

SELECT RT_FILIAL, RT_CC, RT_TIPPROV, RT_VERBA, RV_DESC,SUM(ANTERIOR) ANTERIOR, SUM(ATUAL) ATUAL, SUM(ATUAL-ANTERIOR) NOMES
FROM
(
SELECT RT_FILIAL, RT_CC, RT_VERBA, RV_DESC, RT_DATACAL, RT_TIPPROV, 
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201708' THEN RT_VALOR ELSE 0 END) AS ANTERIOR,
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201709' THEN RT_VALOR ELSE 0 END) AS ATUAL
FROM SRT100 SRT 
	LEFT JOIN SRV100 SRV ON SRV.RV_COD = SRT.RT_VERBA 
		AND SRV.D_E_L_E_T_ = ''
WHERE RT_TIPPROV IN ('1','2') 
	AND SUBSTRING(SRT.RT_DATACAL,1,6) BETWEEN '201708' AND '201709'
	AND RT_CC = '210210'
	AND SRT.D_E_L_E_T_ = ''
	AND RT_VERBA IN ('730', '749', '811', '774', '772', '812', '775', '773', '813', '731', '754', '814', '732', '755', '815')
	AND RT_TIPPROV IN ('1','2')
GROUP BY  RT_FILIAL, RT_CC, RT_VERBA, RV_DESC, RT_DATACAL, RT_TIPPROV, RT_VERBA ) PROVFERIAS
GROUP BY RT_FILIAL, RT_CC, RT_VERBA, RV_DESC,RT_TIPPROV
ORDER BY  RT_TIPPROV


VERSAO FINAL

SELECT '" + cUser + "' USUARIO, RT_FILIAL, RT_CC, RT_VERBA, RV_DESC,SUM(ANTERIOR) ANTERIOR, SUM(ANTERIOR - ATUAL) NOMES, SUM(ATUAL) ATUAL 
FROM ( SELECT RT_FILIAL, RT_CC, RT_VERBA, RV_DESC, RT_DATACAL,  
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201709' THEN RT_VALOR ELSE 0 END) AS ANTERIOR, 
SUM(CASE Substring(SRT.RT_DATACAL,1,6) WHEN '201710' THEN RT_VALOR ELSE 0 END) AS ATUAL 
FROM SRT050 SRT  
LEFT JOIN SRV100 SRV ON SRV.RV_COD = SRT.RT_VERBA 
AND SRV.D_E_L_E_T_ = '' 
WHERE RT_TIPPROV IN ('1','2') 
AND SUBSTRING(SRT.RT_DATACAL,1,6) BETWEEN '201709' AND '201710' 
AND SRT.D_E_L_E_T_ = '' 
--AND RT_VERBA IN ('730', '749', '811', '774', '772', '812', '775', '773', '813', '731', '754', '814', '732', '755', '815') 
AND RT_VERBA = '770'
AND RT_TIPPROV IN ('1','2') AND RT_FILIAL = '02' 
GROUP BY  RT_FILIAL, RT_CC, RT_VERBA, RV_DESC, RT_DATACAL, RT_TIPPROV, RT_VERBA 
) PROVFERIAS 
GROUP BY RT_FILIAL, RT_CC, RT_VERBA, RV_DESC 
