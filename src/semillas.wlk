class Semilla{
	const property anioObtencion 
	const property altura
	
	method esFuerte()= self.horasDeSolToleradas() > 10	
	
	method daSemillas()= self.esFuerte() or self.condicionAlternativaSemillas()
	
	method horasDeSolToleradas()
	
	method condicionAlternativaSemillas()
}

class Menta inherits Semilla{
	override method horasDeSolToleradas()= 6
	
	override method condicionAlternativaSemillas()= altura > 0.4 
	
	method espacioQueOcupa()= altura * 3
}

class Soja inherits Semilla{
	override method horasDeSolToleradas(){
		if(altura < 0.5){
			return 6
		}
		else if(altura.between(0.5 , 1)){
			return 7
		}
		else{
			return 9
		}
	}
	
	override method condicionAlternativaSemillas()= anioObtencion > 2007 and altura > 1
	
	method espacioQueOcupa()= altura / 2
	
}

class Quinoa inherits Semilla{
	const property horasDeSolToleradas
	
	override method condicionAlternativaSemillas()= anioObtencion < 2005
	
	method espacioQueOcupa()= 0.5
}

class SojaTransgenica inherits Soja{
	override method daSemillas()= false
}

class Hierbabuena inherits Menta{
	override method espacioQueOcupa()= super() * 2
}