//lugares
object puente{
    method dejarPasar(mensajero)= mensajero.peso() <= 1000
}
object matrix{
    method dejarPasar(mensajero)= mensajero.puedeLlamar()
}
//mensajeros

object morfeo
{
    var property transporte = camion
    var property pesoMorfeo = 90
    var property cantidadDinero = 0

    method peso() = self.pesoMorfeo() + transporte.peso()
    method puedeLlamar() = cantidadDinero > 0
}

object camion
{
    var property pesoBasePorAcoplado = 500
    var property acoplados = 1 

    method peso() = self.pesoBasePorAcoplado() * self.acoplados()
}

object monopatin
{
    var property peso = 1
}

object trinity{
    var property peso = 900 
    var property pulgarEnOido = true
    var property meñiqueEnBoca = true

    method puedeLlamar() = pulgarEnOido && meñiqueEnBoca
}
object neo
{
    var property peso = 0 //no pesa nd 
    var property cantSaldo = 0
    method puedeLlamar() = cantSaldo > 0
}
object paquete {
    var property pagado = false
    var property precio = 50
    var property destino = puente

    method pagar(usuario) {
        if (usuario.cantidadDinero() >= precio) {
            pagado = true
        }
    }

    method estaPago() = pagado

    method puedeSerEntregadoPor(mensajero) =
        self.estaPago() && destino.dejarPasar(mensajero)
}
object usuario {
    var property cantidadDinero = 100
}
