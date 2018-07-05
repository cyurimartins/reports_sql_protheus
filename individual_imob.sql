--VERSAO 01

SELECT N3_FILIAL, N1_CBASE, N3_CCONTAB, N3_HISTOR, N3_VORIG1, N1_GRUPO, N1_CHAPA, N1_AQUISIC, N1_BAIXA, N1_FORNEC, N1_NFISCAL, N3_CUSTBEM, N4_DATA, N3_AMPLIA1,
N3_CDEPREC, N4_OCORR, N4_TIPOCNT, N3_CCDEPR, N3_TXDEPR1, N3_CCUSTO, N3_FIMDEPR, N3_DINDEPR, N3_VRDMES1, N3_VRDACM1, N4_VLROC1
FROM SN3100 N3 
INNER JOIN SN1100 N1 ON N1.D_E_L_E_T_ = '' 
	AND N1.N1_FILIAL = N3.N3_FILIAL
	AND N1.N1_CBASE = N3.N3_CBASE 
	AND N1.N1_ITEM = N3.N3_ITEM 
LEFT JOIN SN4100 N4 ON N4.D_E_L_E_T_ = '' 
	AND N4.N4_FILIAL = N3.N3_FILIAL 
	AND N4.N4_CBASE = N3.N3_CBASE 
	AND N4.N4_ITEM = N3.N3_ITEM  
	AND N4.N4_TIPOCNT = '4' 
WHERE N3.D_E_L_E_T_ = '' 
	AND N3.N3_DTBAIXA = SPACE(8) 
	AND N3.N3_FILIAL= '01' 

--versao 02

SELECT N3_FILIAL, N1_CBASE, N3_CCONTAB, N3_HISTOR, N3_VORIG1, N1_GRUPO, N1_CHAPA, N1_AQUISIC, N1_BAIXA, N1_FORNEC, N1_NFISCAL, N3_CUSTBEM, N4_DATA, N3_AMPLIA1,
N3_CDEPREC, N4_OCORR, N4_TIPOCNT, N3_CCDEPR, N3_TXDEPR1, N3_CCUSTO, N3_FIMDEPR, N3_DINDEPR, N3_VRDMES1, N3_VRDACM1, N4_VLROC1
FROM SN3100 N3 
INNER JOIN SN1100 N1 ON N1.D_E_L_E_T_ = '' 
	AND N1.N1_FILIAL = N3.N3_FILIAL
	AND N1.N1_CBASE = N3.N3_CBASE 
	AND N1.N1_ITEM = N3.N3_ITEM 
LEFT JOIN SN4100 N4 ON N4.D_E_L_E_T_ = '' 
	AND N4.N4_FILIAL = N3.N3_FILIAL 
	AND N4.N4_CBASE = N3.N3_CBASE 
	AND N4.N4_ITEM = N3.N3_ITEM  
	AND N4.N4_TIPOCNT IN ('4', '1') 
	AND N4.N4_OCORR <> '05'
WHERE N3.D_E_L_E_T_ = '' 
	AND N3.N3_DTBAIXA = SPACE(8) 
	AND N3.N3_FILIAL= '01' 
