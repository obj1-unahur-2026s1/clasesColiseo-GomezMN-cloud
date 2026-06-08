import equipamiento.*

class Gladiador {
    var unidadDeVida = 100
    var armaActual
    const fuerza


    method atacar(unGladiador)
    method defenderse()
    method armaEquipada()
    method defensaEquipada()
    method poderDeAtaque()
}

class Mirmillones inherits Gladiador {
    var armaduraActual = desarmado

    method cambiarArmadura(nuevaArmadura) {
        armaduraActual = nuevaArmadura
    }
    method cambiarArma(nuevaArma) {
        armaActual = nuevaArma
    }
    
    override method atacar(unGladiador) {
        self.poderDeAtaque() - unGladiador.defensaEquipada()
    }
    override method defenderse() {

    }
    override method armaEquipada() = armaActual
    override method defensaEquipada() = armaduraActual
    method destreza() = 15
    override method poderDeAtaque() = fuerza + armaActual.valorDeAtaque()

}
class Dimachaerus inherits Gladiador {
    const property destreza

    override method atacar(unGladiador) {
        self.poderDeAtaque() - unGladiador.defensaEquipada()
    }
    override method defenderse() {
        
    }

    method fuerza() = 10
    override method armaEquipada() = armaActual
    override method defensaEquipada() = desarmado.unidadDeDefensa()
}




object desarmado {
    method unidadDeDefensa() = 0
}