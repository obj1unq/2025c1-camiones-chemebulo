object knightRider {
	method peso() = 500
	
	method nivelPeligrosidad() = 10

	method miPesoEsPar() = self.peso().even()
}

object bumblebee {
	var property forma = auto
	
	method peso() = 800
	
	method miPesoEsPar() = self.peso().even()

	method nivelPeligrosidad() = forma.nivelDePeligrosidad()
}

object paqueteDeLadrillos {
	var property cantidadDeLadrillos = 1

	method peso() = 2 * cantidadDeLadrillos
	
	method miPesoEsPar() = self.peso().even()

	method nivelPeligrosidad() = 2
}

object arenaAGranel {
	
	var property peso = 200 // El peso es variable.

	method miPesoEsPar() = self.peso().even()
	
	method nivelPeligrosidad() = 1
}

object bateriaAntiaerea {
	var property tieneMisiles = true

	method peso() {
		return if (self.tieneMisiles()) { 300 } else { 200 }
	}
	
	method miPesoEsPar() = self.peso().even()

	method nivelPeligrosidad() {
		return if (self.tieneMisiles()) { 100 } else { 0 }
	}
}

object contenedorPortuario {

	const property cosas = []

	method peso() = 100 + self.pesoTotalDeLasCosasAdentroDelContainer()
	
	method pesoTotalDeLasCosasAdentroDelContainer() {
		return cosas.sum({cosa => cosa.peso()})
	}

	method miPesoEsPar() = self.peso().even()
	
	method nivelPeligrosidad() {
		return if (self.hayCosasEnElContainer()) {
					self.peligrosidadDelMasPeligrosoDelContainer()
				} else { 0 }
	}

	method hayCosasEnElContainer() {
		return cosas.isEmpty()
	}

	method peligrosidadDelMasPeligrosoDelContainer() = self.masPeligrosoDelContainer().peligrosidad() 

	method masPeligrosoDelContainer() {
		return cosas.max({cosa => cosa.peligrosidad()})
	}
}

object residuosRadioactivos {
	
	var property peso = 250 // El peso es variable.
	
	method miPesoEsPar() = self.peso().even()
	
	method nivelPeligrosidad() = 200
}

object embalajeDeSeguridad {

	var property cosa = paqueteDeLadrillos // La cosa es variable.

	method peso() = cosa.peso()
	
	method miPesoEsPar() = self.peso().even()
	
	method nivelPeligrosidad() = cosa.peligrosidad() / 2
}

//########################## OBJETOS AUXILIARES ##########################

object auto {
	method peso() = 100
	
	method nivelDePeligrosidad() = 15
}

object robot {
	method peso() = 100
	
	method nivelDePeligrosidad() = 30
}