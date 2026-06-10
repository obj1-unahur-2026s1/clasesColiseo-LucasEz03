class Arma{
  
}

class ArmaDeFilo inherits Arma{
  const longitud
  const filo
  method valorAtaque()= filo * longitud 
}

class ArmaContundente inherits Arma{
  const peso
  method valorAtaque()= peso
}