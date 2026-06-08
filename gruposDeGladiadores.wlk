import gladiadores.*
import equipamiento.*
class GrupoDeGladiadores {
    const property nombre
    var property cantidadDePeleasRealizadas = 0
    const property gladiadoresActuales = []
    
    method reclutarGladiador(unGladiador) {
        if (not gladiadoresActuales.contains(unGladiador)) {
            gladiadoresActuales.add(unGladiador)
        }
    }
    method despedirGladiador(unGladiador) {
        if (gladiadoresActuales.contains(unGladiador)) {
            gladiadoresActuales.remove(unGladiador)
        }
    }
}

const a = new GrupoDeGladiadores(nombre = "bala")
const roca = new Mirmillones(nombre = roca, armaActual = espada, fuerza = 10)