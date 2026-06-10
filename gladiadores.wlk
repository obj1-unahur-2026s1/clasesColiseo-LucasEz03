import armas.*
import grupos.*

class Gladiador {
    var vida = 100
    method atacar(unGladiador)
    method defensa()
    method campeon() = self
    method recibirDaño(cantidad){
        vida -= cantidad
    }
    method pelear(otroGladiador){
        self.atacar(otroGladiador)
        otroGladiador.atacar(self)
    }
    method puedeCombatir()= vida > 0
    method crearGrupo(otroGladiador)
    method curar(){
        vida = 100
    }
    method registrarPelea(){}
}

class Mirmillon inherits Gladiador {
    const destreza = 15
    var fuerza
    var arma
    const armaduras = []

    method equiparArmadura(armadura){armaduras.add(armadura)}
    method desequiparArmadura(armadura){armaduras.remove(armadura)}

    method poderDeAtaque() = fuerza + arma.valorAtaque()
    
    override method atacar(unGladiador){
        const dañoHecho = (self.poderDeAtaque() - unGladiador.defensa()).max(0)
        unGladiador.recibirDaño(dañoHecho)
    }
    override method defensa()= destreza + armaduras.sum({a=> a.puntosDeDefensa(self)})
    override method crearGrupo(otroGladiador){
        const grupo = new Grupo(nombre= "mirmillolandia")
        grupo.agregarGladiador(self)
        grupo.agregarGladiador(otroGladiador)
        return grupo
    }
    method destreza() = destreza
}

class Dimachaerus inherits Gladiador{
    var destreza
    const fuerza = 10
    const armas = []

    method equiparArma(arma){armas.add(arma)}
    method desequiparArma(arma){armas.remove(arma)}

    method poderDeAtaque()= fuerza + armas.sum({a=>a.valorAtaque()})

    override method atacar(unGladiador){
        const dañoHecho = (self.poderDeAtaque() - unGladiador.defensa()).max(0)
        unGladiador.recibirDaño(dañoHecho)
        destreza += 1
    }
    override method defensa()= destreza / 2
    override method crearGrupo(otroGladiador){
        const grupo = new Grupo(nombre= "D-" + (self.poderDeAtaque() + otroGladiador.poderDeAtaque()).toString())
        grupo.agregarGladiador(self)
        grupo.agregarGladiador(otroGladiador)
        return grupo
    }
    method destreza() = destreza
}