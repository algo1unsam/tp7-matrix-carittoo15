import mensajeros.*
object mensajeria {
    var property empleados = []

    method contratar(mensajero) {
        empleados.add(mensajero)
    }

    method despedir(mensajero) {
        empleados.remove(mensajero)
    }

    method despedirATodos() {
        empleados.clear()
    }

    method esGrande() = empleados.size() > 2

method puedeEntregarPrimer(paquete) {
    if (empleados.isEmpty()) {
        return false
    }
    return paquete.puedeSerEntregadoPor(empleados.get(0))
}

method pesoUltimoMensajero() {
    if (empleados.isEmpty()) {
        return 0
    }
    return empleados.last().peso()
}

var property paquetesPendientes = []
var property facturacion = 0

method puedeEntregar(paquete) =
    empleados.any({mensajero => paquete.puedeSerEntregadoPor(mensajero)})

method quienesPuedenEntregar(paquete) =
    empleados.filter({mensajero => paquete.puedeSerEntregadoPor(mensajero)})

method tieneSobrepeso() =
    empleados.any({m => m.peso() > 1000})

method enviar(paquete) {
    if (self.puedeEntregar(paquete)) {
        facturacion += paquete.precio()
        paquetesPendientes.remove(paquete)
    } else {
        if (!paquetesPendientes.contains(paquete)) {
            paquetesPendientes.add(paquete)
        }
    }
}
method empleados() = empleados

method enviarTodos(paquetes) {
    paquetes.forEach({paquete => self.enviar(paquete)})
}
method obtenerFacturacion() = facturacion
}
