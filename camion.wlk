import cosas.*

object camion {
	const property cosas = []
	const tara = 1000
		
	method cargar(cosa) {
		cosas.forEach({cosa => cosa.consecuenciasDeCarga()})
		cosas.add(cosa)
	}

	method descargar(cosa){
		cosas.remove(cosa)
	}
	
	method todoPesoPar(){
		return cosas.all({cosa => cosa.peso().even()})
	}
	
	method hayAlgunoQuePesa(peso){
		return cosas.any({cosa => cosa.peso() == peso})
	}
	
	method elDeNivel(nivel){
		return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
	}
	
	method pesoTotal(){
		return tara + self.pesoDeTodaLaCarga()
	}
	
	method excedidoDePeso(){
		return self.pesoTotal() > 2500
	}

	method objetosQueSuperanPeligrosidad(nivel){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
	}
	
	method objetosMasPeligrososQue(cosaATenerEnCuenta){
		return cosas.filter({cosa => cosa.nivelPeligrosidad() > cosaATenerEnCuenta.nivelPeligrosidad()})
	}
	
	method puedeCircularEnRuta(nivelMaximoPeligrosidad){
		return not self.excedidoDePeso() && self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad).isEmpty()
	}

	method tieneAlgoQuePesaEntre(min, max){
		return cosas.any({cosa => cosa.peso() > min && cosa.peso() < max})
	}

	method cosaMasPesada(){
		return cosas.max({cosa => cosa.peso()})
	}

	method pesos(){
		return cosas.map({cosa => cosa.peso()})
	}

	method totalBultos(){
		return cosas.sum({cosa => cosa.valorEnBulto()})
	}

	method transportar(destino, camino){
		self.validarSiPuedeTransportar(destino, camino)
		self.moverLasCosasDelCaminoAlDestino(destino)
	}

	// ##################################### AUXILIARES #####################################

	method pesoDeTodaLaCarga() = cosas.sum({cosa => cosa.peso()})

	method moverLasCosasDelCaminoAlDestino(destino){
		cosas.forEach({cosa => destino.agregarACosas(cosa)})
		cosas.clear()
	}

	method validarSiPuedeTransportar(destino, camino) {
		self.validarSiEstaExcedidoDePeso()
		self.validarSiDestinoAdmiteBultos(destino)
		self.validarSiPuedeViajarEnCamino(camino)
	}

	method validarSiEstaExcedidoDePeso(){
		if(self.excedidoDePeso()){
			self.error("El camion está excedido de peso.")
		}
	}

	method validarSiDestinoAdmiteBultos(destino){
		if(not destino.admiteBultos(self.totalBultos())){
			self.error("El destino no admite la cantidad de bultos del camion actualmente.")
		}
	}

	method validarSiPuedeViajarEnCamino(camino){
		if(not camino.puedeCircular(self)){
			self.error("El camion no cumple las condiciones para circular por el camino.")
		}
	}
}

// ######################################### ALMACEN ########################################

object almacen {
	const property cosas = []
	const property maximoDeBultos = 3 

	method admiteBultos(cantidadDeBultos){
		return cantidadDeBultos - self.totalBultos() <= self.maximoDeBultos()
	}

	method totalBultos(){
		return cosas.sum({cosa => cosa.valorEnBulto()})
	}

	method agregarACosas(cosa) {
		cosas.add(cosa)
	}
}

// ######################################### CAMINOS ########################################

object ruta9 {
	const property nivelPeligrosidad = 11

	method puedeCircular(vehiculo){
		return vehiculo.puedeCircularEnRuta(nivelPeligrosidad)
	}
}

object caminosVecinales {
	const property maximoPesoSoportado = 0

	method puedeCircular(vehiculo){
		return vehiculo.pesoTotal(vehiculo) <= maximoPesoSoportado
	}
}