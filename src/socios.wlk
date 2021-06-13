import viajes.*

class Socio {
	var property edad
	var property idiomas = []
	var property actividades = []
	var property maxActividades = 0
	
	method adoradorDelSol() = actividades.all({ act => act.broncearse() })
	
	method actividadesEsforzadas() = actividades.filter({ act => act.esfuerzo() })

	method actividades(actividad) { 
		if (actividades.size() < maxActividades) actividades.add(actividad)
		else self.error("No se puede agregar actividad") 
	}
	
	method leAtrae(actividad) = {}
}

class SocioTranquilo inherits Socio {
	
	override method leAtrae(actividad) = actividad.diasActividad() >= 4
	
}

class SocioCoherente inherits Socio {
	
	override method leAtrae(actividad) = if (self.adoradorDelSol()) actividad.broncearse() else actividad.esfuerzo()
	
}

class SocioRelajado inherits Socio {
	
	override method leAtrae(actividad) = idiomas.any({ i => actividad.idiomas().contains(i) })
	
}


