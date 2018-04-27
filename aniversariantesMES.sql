SELECT EMPRESA, RA_MAT, RA_NOMECMP, CONVERT(DATE,RA_NASC) DATA_NASCIMENTO, SUBSTRING(RA_NASC,7,2) AS DIA, RA_DESFUNC, CTT_DESC01 
FROM(	select 'EMP 01' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC 
	FROM SRA010 SRA
	INNER JOIN CTT010 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_FILIAL = '01'
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 0102' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC 
	FROM SRA010 SRA
	INNER JOIN CTT010 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' AND CTT_FILIAL = '02'
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_FILIAL = '02'
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 03' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC 
	FROM SRA030 SRA
	INNER JOIN CTT030 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 04' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC 
	FROM SRA040 SRA
	INNER JOIN CTT040 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 05' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC
	FROM SRA050 SRA
	INNER JOIN CTT050 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 06' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC 
	FROM SRA060 SRA
	INNER JOIN CTT060 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 07' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC
	FROM SRA070 SRA
	INNER JOIN CTT070 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 08' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC
	FROM SRA080 SRA
	INNER JOIN CTT080 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 09' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC 
	FROM SRA090 SRA
	INNER JOIN CTT090 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 10' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC 
	FROM SRA100 SRA
	INNER JOIN CTT100 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'	
	UNION ALL
	select 'EMP 12' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC 
	FROM SRA120 SRA
	INNER JOIN CTT120 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'
	UNION ALL
	select 'EMP 13' AS EMPRESA, RA_MAT, RA_NOMECMP, RA_SITFOLH, RA_NASC, RA_DESFUNC, CTT_DESC01, RA_DEMISSA, RA_CATFUNC
	FROM SRA130 SRA
	INNER JOIN CTT130 CTT ON RA_CC = CTT_CUSTO AND CTT.D_E_L_E_T_ = '' 
	WHERE SRA.D_E_L_E_T_ = ' ' 
		AND RA_SITFOLH <> 'D'
) FUNC
WHERE RA_SITFOLH <> 'D' 
AND RA_DEMISSA = ' '
--FILTRAR CATEGORIA
--AND RA_CATFUNC = 'M'
--BUSCAR MES ATUAL
--AND MONTH(RA_NASC) = (SELECT MONTH(GETDATE( )))
--BUSCAR MES
AND SUBSTRING(RA_NASC,5,2) = '05' 
ORDER BY EMPRESA
