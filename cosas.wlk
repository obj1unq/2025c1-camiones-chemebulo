object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10

	method elPesoEsPar() = self.peso().even()
}

object bumblebee {
	var property forma = auto
	
	method peso() = 800
	
	method elPesoEsPar() = self.peso().even()

	method nivelPeligrosidad() = forma.nivelDePeligrosidad()
}

object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 1

	method peso() = 2 * cantidadDeLadrillos
	
	method elPesoEsPar() = self.peso().even()

	method nivelPeligrosidad() = 2
}

object arenaAGranel {
	
	var property peso = 200 // El peso es variable.

	method elPesoEsPar() = self.peso().even()
	
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	var property tieneMisiles  = true

	method peso() = if (tieneMisiles) {300} else {200}
	
	method elPesoEsPar() = self.peso().even()

	method nivelPeligrosidad() = if (tieneMisiles) {100} else {0}
}

object contenedorPortuario {

	const property cosasAdentroDelContenedor = [] // La cantidad de cosas que pueden estar adentro del contenedor es variable.

	method peso() = 100 + self.pesoTotalDeLasCosas()
	
	method pesoTotalDeLasCosas() = cosasAdentroDelContenedor.sum({cosa => cosa.peso()})

	method elPesoEsPar() = self.peso().even()
	
	method nivelPeligrosidad() = if (self.hayCosasEnElContenedor()) self.peligrosidadDelMasPeligrosoDelContenedor() else { 0 }

	method hayCosasEnElContenedor() = not cosasAdentroDelContenedor.isEmpty()

	method peligrosidadDelMasPeligrosoDelContenedor() = self.masPeligrosoDelContenedor().peligrosidad() 

	method masPeligrosoDelContenedor() = cosasAdentroDelContenedor.max({cosa => cosa.peligrosidad()})
}

object residuosRadioactivos {
	
	var property peso = 250 // El peso es variable.
	
	method elPesoEsPar() = self.peso().even()
	
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad {

	var property cosaAEmbalar = paqueteDeLadrillos // La cosa a embalar es variable.

	method peso() = cosaAEmbalar.peso()
	
	method elPesoEsPar() = self.peso().even()
	
	method nivelPeligrosidad() = cosaAEmbalar.peligrosidad() / 2
}

//########################################### OBJETOS AUXILIARES ###########################################

object auto {
	method peso() = 100
	
	method nivelDePeligrosidad() = 15
}

object robot {
	method peso() = 100
	
	method nivelDePeligrosidad() = 30
}