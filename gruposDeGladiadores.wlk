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
    method campeonActualMasFuerte() = gladiadoresActuales.filter({p => p.vida() > 0}).max({g => g.poderDeAtaque()})
    
}
class Combate {
    method round(unGrupo, otroGrupo) {
        unGrupo.campeonActualMasFuerte().pelea(otroGrupo.campeonActualMasFuerte())
    }
}
