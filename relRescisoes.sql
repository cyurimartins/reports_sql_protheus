SELECT * FROM SRD100
SELECT * FROM SRV100
SELECT * FROM SRA100
SELECT * FROM SRG100


SELECT RV_COD, RV_DESC, RD_VALOR, RD_DATPGT, * FROM SRV100 SRV
	LEFT JOIN SRD100 SRD ON SRD.RD_PD = SRV.RV_COD
WHERE RV_COD IN ('701', '702', '703', '825', '832')

	



SELECT * FROM SRS100
