import persona.*

class Carpa{
	const property genteQueAdmite = 0
	var property marcaDeCerveza 
	var property tieneBandaDeMusica	
	var property gentePresente = []
	
	method hayGentePar(){
		return self.gentePresente().size() % 2 == 0
	}
	
	method puedeEntrarGente(){
		return self.gentePresente().size() < self.genteQueAdmite()
	} 
	
	method dejaIngresarAPersona(persona){
		return self.puedeEntrarGente()
			   and not persona.estaEbrio()
	}
	
	method entraPersona(persona){
		self.gentePresente().add(persona)
	}
}

