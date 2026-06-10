import gladiadores.*
class Grupo{
    const gladiadores = []
    const nombre
    var cantPeleas = 0
    
    method agregarGladiador(gladiador){gladiadores.add(gladiador)}
    method quitarGladiador(gladiador){gladiadores.remove(gladiador)}
    method campeon(){
        return gladiadores.filter({g=> g.puedeCombatir()}).max({g=> g.poderDeAtaque()})
    }
    method registrarPelea() {
        cantPeleas += 1
    }
    method gladiadores() = gladiadores
}

object coliseo{
    method curar(unGladiador)= unGladiador.curar()
    method curarGrupo(unGrupo){
        unGrupo.gladiadores().forEach({g=> self.curar(g)})
    }

    method organizarPelea(guerrero1, guerrero2) {
        (1..3).forEach({ round =>
            const campeon1 = guerrero1.campeon()
            const campeon2 = guerrero2.campeon()
            campeon1.pelear(campeon2)
        })
        guerrero1.registrarPelea()
        guerrero2.registrarPelea()
    }
}