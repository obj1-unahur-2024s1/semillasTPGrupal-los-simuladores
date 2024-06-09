import semillas.*

class Parcela{
	
	// El ejercicio no aclara nada al respecto, así que asumo que no pueden cambiar el ancho y largo
	const ancho
	const largo 
	
	// Asumo que las horas de sol que recibe por día no varían
	const property horasDeSolDiarias
	
	const plantasQueTiene = #{}
	
	method superficie() = ancho * largo
	
	method cantidadMaximaDePlantasQueTolera() = if(ancho < largo) {self.superficie() / 5} 
												else{self.superficie() / 3 + largo}

	method tieneComplicaciones() = plantasQueTiene.any({ planta =>
										 	planta.horasDeSolToleradas() < 
											horasDeSolDiarias
	})
	
	method plantarUnaPlanta(planta){
		if( self.sePuedePlantar(planta) ){
			plantasQueTiene.add(planta)
		}
		else{
			self.error("La planta no se puede plantar.")
		}
	}
	// Métodos auxiliares para el anterior
	method sePuedePlantar(planta) =  not 
							(self.superaLaCantidadMaxima(planta) or 
							self.recibeMasSol(planta))
	method superaLaCantidadMaxima(planta) = self.cantidadMaximaDePlantasQueTolera() > 
											plantasQueTiene.size() + 1
	method recibeMasSol(planta) = 	horasDeSolDiarias >
									planta.horasDeSolToleradas() + 2

	// Métodos auxiliares para el punto 4
	method tieneDosOMasPlantas() = plantasQueTiene.size() <= 2
	method tieneUnaPlantaAlta() = plantasQueTiene.any({
									planta => planta.esAlta()
	})
	
	// Método auxiliar para la parcela industrial
	method tieneComoMaximoDosPlantas() = plantasQueTiene.size() <= 2
		
	// Lo hago abstracto para que no se pueda instanciar parcela, y que cada parcela sea sí o sí ecológica o industrial
	method seAsociaBien(unaPlanta)
} 

class ParcelaEcologica inherits Parcela{
	override method seAsociaBien(unaPlanta) = not self.tieneComplicaciones() and unaPlanta.leResultaIdeal(self)
}

class ParcelaIndustrial inherits Parcela{
	override method seAsociaBien(unaPlanta) = self.tieneComoMaximoDosPlantas() and unaPlanta.esFuerte()
}