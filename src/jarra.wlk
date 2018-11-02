import marcas.*

class Jarra{
	const property capacidad = 0
	var property marca
	
	method contenidoDeAlcohol(){
		return marca.graduacion() * self.capacidad() 
	}
	
	
}
