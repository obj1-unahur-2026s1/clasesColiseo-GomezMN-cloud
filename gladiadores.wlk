import equipamiento.*
import gruposDeGladiadores.*
class Gladiador {
    const property nombre
    var unidadDeVida = 100
    var armaActual
    const property fuerza = 10
    var contrincanteActual = null

    method atacar(unGladiador)
    method defenderse()
    method armaEquipada()
    method defensaEquipada()
    method poderDeAtaque()

    method crearGrupo(unGladiador)

    method recibirAtaque(daño) {
        unidadDeVida = (unidadDeVida - daño).max(0)
    }
    method contrincante(unGladiador) {
        contrincanteActual = unGladiador
    }
    method pelea(otroGladiador) {
        self.atacar(otroGladiador)
        otroGladiador.defenderse()
    }
    method cambiarArma(nuevaArma) {
        armaActual = nuevaArma
    }
    method vida() = unidadDeVida
}

class Mirmillones inherits Gladiador {
    var armaduraActual = cascoConCresta
    var property grupoActual = sinGrupo

    method cambiarArmadura(nuevaArmadura) {
        armaduraActual = nuevaArmadura
    }
    
    override method atacar(unGladiador) {
        unGladiador.contrincante(self)
        unGladiador.recibirAtaque(self.poderDeAtaque() - unGladiador.defensaEquipada())
    }
    override method defenderse() {
        self.atacar(contrincanteActual)
    }
    override method armaEquipada() = armaActual
    override method defensaEquipada() = armaduraActual.defensa() + self.destreza()
    method destreza() = 15
    override method poderDeAtaque() = self.fuerza() + armaActual.valorDeAtaque()

    override method crearGrupo(unGladiador) {
        grupoActual = new GrupoDeGladiadores(nombre = "mirmillolandia")
        grupoActual.reclutarGladiador(unGladiador)
        unGladiador.grupoActual(grupoActual)
    }
}
class Dimachaerus inherits Gladiador {
    var destreza
    var property grupoActual = sinGrupo

    override method atacar(unGladiador) {
        unGladiador.contrincante(self)
        unGladiador.recibirAtaque(self.poderDeAtaque() - unGladiador.defensaEquipada()) 
        self.aumentarDestreza()
    }
    override method defenderse() {
        self.atacar(contrincanteActual)
    }
    method aumentarDestreza() {
        destreza += 1
    }

    override method armaEquipada() = armaActual
    override method defensaEquipada() = destreza / 2
    override method poderDeAtaque() = self.fuerza() + armaActual.sum({a => a.valorDeAtaque()})

    override method crearGrupo(unGladiador) {
        grupoActual = new GrupoDeGladiadores(nombre = "d" + (self.poderDeAtaque() + unGladiador.poderDeAtaque()).toString())
        grupoActual.reclutarGladiador(unGladiador)
        unGladiador.grupoActual(grupoActual)
    }
}




object sinGrupo {}