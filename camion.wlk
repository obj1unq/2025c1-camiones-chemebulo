import cosas.*

object camion {
	const property cosas = #{}
		
	method cargar(unaCosa) {
		cosas.add(unaCosa)
	}

	method descargar(cosa){
		cosas.remove(cosa)
	}
	
	method todoPesoPar(){
		return cosas.all({cosa => cosa.miPesoEsPar()})
	}
	
	method hayAlgunoQuePasa(peso){
		return cosas.any({cosa => e})
	}
	
	method elDeNivel(nivel){}
	
	method pesoTotal(){}
	
	method excedidoDePeso(){}
	
	method objetosQueSuperanPeligrosidad(nivel){}
	
	method objetosMasPeligrososQue(){}
	
	method puedoCircularEnRuta(nivelMaximoPeligrosidad){}

	method tieneAlgoQuePesaEntre(min, max){}

	method cosaMasPesada(){}

	method pesos(){}

	method totalBultos(){}
}
