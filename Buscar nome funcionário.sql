--Substituir "{?empresa}" por empresa que deseja consultar. 

SELECT * FROM (
	select RA_NOMECMP, RA_SITFOLH, RA_CATFUNC FROM SRA{?empresa}0 WHERE D_E_L_E_T_ = ' '
	UNION ALL
	select RA_NOMECMP, RA_SITFOLH, RA_CATFUNC FROM SRA{?empresa}0 WHERE D_E_L_E_T_ = ' '
	UNION ALL 
	select RA_NOMECMP, RA_SITFOLH, RA_CATFUNC FROM SRA{?empresa}0 WHERE D_E_L_E_T_ = ' '
	UNION ALL
	select RA_NOMECMP, RA_SITFOLH, RA_CATFUNC FROM SRA{?empresa}0 WHERE D_E_L_E_T_ = ' '
	UNION ALL
	select RA_NOMECMP, RA_SITFOLH, RA_CATFUNC FROM SRA{?empresa}0 WHERE D_E_L_E_T_ = ' '
	UNION ALL
	select RA_NOMECMP, RA_SITFOLH, RA_CATFUNC FROM SRA{?empresa}0 WHERE D_E_L_E_T_ = ' '
	UNION ALL
	select RA_NOMECMP, RA_SITFOLH, RA_CATFUNC FROM SRA{?empresa}0 WHERE D_E_L_E_T_ = ' '
)  AS FUNC  
WHERE RA_NOMECMP LIKE 'Carlos%'
ORDER BY RA_NOMECMP
