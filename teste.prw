#include "rwmake.ch"
#include "topconn.ch"


User Function teste()

	If alltrim(M->E2_NATUREZ) <> ''		
		
		c_Nome:= alert("Possui E2_NATUREZ")
		
		If alltrim(M->ED_MSBLQL) == "1"
			c_Nome:= alert("NATUREZA BLOQUEADO")
		Else
		  	c_Nome:= alert("NATUREZA DISPONIVEL")
		  	
		  	If alltrim(M->ED_CALCIRF) == "S" 
		  		alert("Calcula IRF")
		  		
		  		if alltrim(M->ED_XCODRET) <> ""
		  			alert("Possui XCODRET")
		  		Else
		  			alert("Não possui XCODRET, solicitar código retenção")
		  		Endif
		  	Else
		  		alert("Não Calcula IRF")
		  	Endif
		Endif
	Else 		
		c_Nome:= alert("Não possui E2_NATUREZ")		
	Endif		

Return(c_Nome)
