class ArmaDeFilo {
    const property filo 
    const property longitud  

    method valorDeAtaque() = filo * longitud
}
class ArmaContundente {
    const property peso

    method valorDeAtaque() = peso 
}
class Armadura {
    var player = null
    method defensa()
    method equiparse(unPlayer) {
        player = unPlayer
    }
}
class Casco inherits Armadura {
    override method defensa() = 10
}
class Escudo inherits Armadura {
    override method defensa() = 5 + player.destreza() * 0.1
}

const cascoConCresta = new Casco()
const espada = new ArmaDeFilo(filo = 1, longitud = 0.8)