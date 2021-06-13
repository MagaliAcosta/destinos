class Viaje {
	var property idiomas = []
	var property esfuerzo = false
	var property broncearse = false
	var property diasActividad = 0
	
	method esInteresante() = idiomas.size() > 1
	
	method esRecomendadaPara(socio) = self.esInteresante() and socio.leAtrae(self) and
										socio.actividades().contains(self)
	
}

class ViajeDePlaya inherits Viaje {
	const property largoPlaya
	
	
	override method diasActividad() = largoPlaya / 500
	
	override method esfuerzo() = largoPlaya > 1200
	
	override method broncearse() = true 
	
	
	
}

class ExcursionCiudad inherits Viaje {
	const property cantAtracciones
	
	
	override method diasActividad() = cantAtracciones / 2
	
	override method esfuerzo() = cantAtracciones.between(5,8)
	
	override method esInteresante() = super() or cantAtracciones == 5
	
}

class ExcursionCiudadTropical inherits ExcursionCiudad {
	
	override method diasActividad() = super() + 1
	
	override method broncearse() = true
	
}

class Trekking inherits Viaje {
	const property kilometros
	const property diasDeSol
	
	override method diasActividad() = kilometros / 50
	
	override method esfuerzo() = kilometros > 80
	
	override method broncearse() = diasDeSol > 200 or (diasDeSol.between(100, 200)  and kilometros > 120)  
	
	override method esInteresante() = super() and diasDeSol > 140
	
}

class ClaseGimnasia  {
	const property idiomas = ["español"]
	var property esfuerzo = true
	var property broncearse = false
	var property diasActividad = 1
	
	method esRecomendadaPara(socio) = socio.edad().between(20, 30)
	
}


class TaellerLiterario {
	var property libros = []
	var property idiomas = []
	const property broncearse = false
	var property diasActividad = 0
	
	method esfuerzo() = libros.any({ libro => libro.paginas() > 500 }) or libros.all({ libro => libro.autor() })
	
	method esRecomendadaPara(socio) = socio.idiomas().size() > 1
}

