import marcas.*

class Persona{
	var property peso = 0
	var property jarrasQueCompro = []
	var property leGustaLaMusica = ""
	const property aguante = 0
	
	method alcoholQueIngirio(){
		return jarrasQueCompro.sum{jarra => jarra.contenidoDeAlcohol()}
	}
	
	method estaEbrio(){
		return self.alcoholQueIngirio() * self.peso() >= self.aguante()
	}
	
	method leGustaLaMarca(marca){
		return true
	}
	
	method quiereEntrarACarpa(carpa){
		return self.leGustaLaMarca(carpa.marcaDeCerveza())
			   and self.leGustaLaMusica() == carpa.tieneBandaDeMusica()
	}
	
	method puedoEntrarAUnaCarpa(carpa){
		return self.quiereEntrarACarpa(carpa)
			   and carpa.dejaIngresarAPersona(self)
	}
	
	method entrarAUnaCarpa(carpa){
		if(self.quiereEntrarACarpa(carpa) and self.puedoEntrarAUnaCarpa(carpa)){
			carpa.entraPersona(self)
		}else{
			self.error("No puede ingresar a esta carpa")
		}
	}
}

class PersonaBelga inherits Persona{
	override method leGustaLaMarca(marca){
		return marca.cantDeLupulo() > 4
	}
}

class PersonaCheca inherits Persona{
	override method leGustaLaMarca(marca){
		return marca.graduacion() > 8
	}	
}

class PersonaAlemana inherits Persona{
	override method leGustaLaMarca(marca){
		return true
	}
	
	override method quiereEntrarACarpa(carpa){
		return super(carpa) and carpa.hayGentePar()
	}	
}
