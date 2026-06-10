class Casco {
    method puntosDeDefensa(unGladiador) = 10
}

class Escudo {
    method puntosDeDefensa(unGladiador) = 5 + (unGladiador.destreza() * 0.1)
}