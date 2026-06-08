import equipamiento.*

class Gladiador {
    const property nombre
    var unidadDeVida = 100
    var armaActual
    const fuerza
    var contrincanteActual = null

    method atacar(unGladiador)
    method defenderse()
    method armaEquipada()
    method defensaEquipada()
    method poderDeAtaque()
    method recibirAtaque(daño) {
        unidadDeVida = (unidadDeVida - daño).max(0)
    }
    method contrincante(unGladiador) {
        contrincanteActual = unGladiador
    }
    method pelea(unGladiador, otroGladiador) {
        unGladiador.atacar(otroGladiador)
        otroGladiador.defenderse()
    }
}

class Mirmillones inherits Gladiador {
    var armaduraActual = cascoConCresta

    method cambiarArmadura(nuevaArmadura) {
        armaduraActual = nuevaArmadura
    }
    method cambiarArma(nuevaArma) {
        armaActual = nuevaArma
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
    override method poderDeAtaque() = fuerza + armaActual.valorDeAtaque()

}
class Dimachaerus inherits Gladiador {
    var destreza

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

    method fuerza() = 10
    override method armaEquipada() = armaActual
    override method defensaEquipada() = destreza / 2
    override method poderDeAtaque() = self.fuerza() + armaActual.sum({a => a.valorDeAtaque()})
}




object desarmado {
    method unidadDeDefensa() = 0
}