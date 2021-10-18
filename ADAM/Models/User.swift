
/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/
import Foundation
import UIKit

//clase que crea un objeto con todos los datos que se necesitan almacenar de los usuarios
class User: NSObject {
    var userNum = Int()
    var username = String()
    var userImage = String()
    var userMini = String()
    var scoreR = Int()
    var scoreF = Int()
    var scoreC = Int()
    var current = Int()
    
}
