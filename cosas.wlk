object knightRider {
	const valorEnBulto = 1

	method peso() = 500
	
	method nivelPeligrosidad() = 10

	method valorEnBulto() = valorEnBulto
	
	method consecuenciasDeCarga(){}
}

object bumblebee {
	const valorEnBulto = 2
	var property forma = auto
	
	method peso() = 800
	
	method nivelPeligrosidad() = forma.nivelPeligrosidad()
	
	method valorEnBulto() = valorEnBulto

	method consecuenciasDeCarga(){
		forma = robot
	}
}

object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 10

	method peso() = 2 * cantidadDeLadrillos
	
	method nivelPeligrosidad() = 2

	method valorEnBulto(){
		return if(self.cantidadDeLadrillos() <= 100) {1} else 
			   if(self.cantidadDeLadrillos() <= 300) {2} else {3}
	}

	method consecuenciasDeCarga(){
		cantidadDeLadrillos += 12
	}
}

object arenaAGranel {
	const valorEnBulto = 1
	var property peso = 200 // El peso es variable.

	method nivelPeligrosidad() = 1

	method valorEnBulto() = valorEnBulto

	method consecuenciasDeCarga(){
		peso += 20
	}
}

object bateriaAntiaerea {
	var tieneMisiles = true

	method peso() = if (tieneMisiles) {300} else {200}
	
	method nivelPeligrosidad() = if (tieneMisiles) {100} else {0}

	method cambiarANoTieneMisiles(){
		tieneMisiles = false
	}

	method cambiarATieneMisiles(){
		tieneMisiles = true
	}

	method tieneMisiles() = tieneMisiles

	method valorEnBulto(){
		return if(not self.tieneMisiles()) {1} else {2}
	}

	method consecuenciasDeCarga(){
		self.cambiarATieneMisiles()
	}
}

object contenedorPortuario {
	const property contenido = [] // La cantidad de cosas que pueden estar adentro del contenedor es variable.

	method peso() = 100 + self.pesoTotalDelContenido()

	method nivelPeligrosidad() {
		return if(self.hayCosasEnElContenedor()) {self.peligrosidadDelMasPeligroso()} else {0}
	}

	method hayCosasEnElContenedor() = not contenido.isEmpty()

	method peligrosidadDelMasPeligroso() = self.masPeligrosoDelContenedor().nivelPeligrosidad() 

	method masPeligrosoDelContenedor() = contenido.max({cosa => cosa.nivelPeligrosidad()})

	method pesoTotalDelContenido() = contenido.sum({cosa => cosa.peso()})

	method agregarAlContenedor(cosa) {
		contenido.add(cosa)
	}

	method quitarDelContenedor(cosa) {
		contenido.remove(cosa)
	}

	method valorEnBulto(){
		return 1 + contenido.sum({cosa => cosa.valorEnBulto()})
	}

	method consecuenciasDeCarga(){
		contenido.forEach({cosa => cosa.consecuenciasDeCarga()})
	}
}

object residuosRadioactivos {
	const valorEnBulto = 1
	var property peso = 250 // El peso es variable.
	
	method nivelPeligrosidad() = 200

	method valorEnBulto() = valorEnBulto

	method consecuenciasDeCarga(){
		peso += 15
	}
}

object embalajeDeSeguridad {
	const valorEnBulto = 2
	var property cosaAEmbalar = paqueteDeLadrillos // La cosa a embalar es variable.

	method peso() = cosaAEmbalar.peso()
	
	method nivelPeligrosidad() = cosaAEmbalar.peligrosidad() / 2

	method valorEnBulto() = valorEnBulto

	method consecuenciasDeCarga(){}
}

//########################################### OBJETOS AUXILIARES ###########################################

object auto {
	method nivelPeligrosidad() = 15
}

object robot {
	method nivelPeligrosidad() = 30
}