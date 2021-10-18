

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


extension UIColor {
    static let amarillo: UIColor = UIColor(named: "amarillo_r")!
    static let azul: UIColor = UIColor(named: "azul_fuerte_r")!
    static let cafe: UIColor = UIColor(named: "cafe_r")!
    static let morado: UIColor = UIColor(named: "morado_r")!
    static let naranja: UIColor = UIColor(named: "naranja_r")!
    static let rojo: UIColor = UIColor(named: "rojo_r")!
    static let rosa: UIColor = UIColor(named: "rosa_r")!
    static let verde: UIColor = UIColor(named: "verde_r")!
}

//Esta clase representa el Modelo para el nivel de dificultad "fácil" del juego "Arcoiris"
class RainbowModelNVL1 {
    //Se instancian todas las variables necesarias para el sistema del Modelo
    var score = 0
    var globalAnswer = -1;
    var globalLives = 3;
    var colorText: String?
    var colorValue: UIColor?
    var imageView1: UIImage?
    var imageView2: UIImage?
    var imageView3: UIImage?
    //"Colors" almacena los nombres de los posibles colores
    let colors: [String] = [
        "Amarillo",
        "Azul",
        "Café",
        "Morado",
        "Naranja",
        "Rojo",
        "Rosa",
        "Verde"
    ]
    //"Figures" almacena los recursos UIImage
    let figures: [UIImage] = [
        UIImage(named: "boton_amarillo.svg")!,
        UIImage(named: "boton_azul.svg")!,
        UIImage(named: "boton_cafe.svg")!,
        UIImage(named: "boton_morado.svg")!,
        UIImage(named: "boton_naranja.svg")!,
        UIImage(named: "boton_rojo.svg")!,
        UIImage(named: "boton_rosa.svg")!,
        UIImage(named: "boton_verde.svg")!
    ]
    //"ColorValues" almacena todos los valores enteros existentes en el xml de colores
    let colorValues: [UIColor] = [
        .amarillo,
        .azul,
        .cafe,
        .morado,
        .naranja,
        .rojo,
        .rosa,
        .verde
    ]

    //El método "randomIndex" recibe un entero y regresa un aleatorio desde cero hasta ese valor
    func RandomIndex(value: Int) -> Int{
        return Int.random(in: 0...value)

    }

    /*El método "gameRound" toma valores aleatorios para asignarlos a las variables de los recursos drawables, el nombre del color como la respuesta correcta y el color para la font*/
    func gameRound() {
        let randomColor = RandomIndex(value: 7)
        colorText = colors[randomColor]
        var randomValue = RandomIndex(value: 7)
        while randomValue == randomColor {
            randomValue = RandomIndex(value: 7)
        }
        var randomOption = RandomIndex(value: 7)
        while randomOption == randomColor || randomOption == randomValue {
            randomOption = RandomIndex(value: 7)
        }
        colorValue = colorValues[randomValue]
        let correctAnswer = RandomIndex(value: 2)
        globalAnswer = correctAnswer
        if correctAnswer == 0 {
            imageView1 = figures[randomColor]
        }
        if correctAnswer == 1 {
            imageView2 = figures[randomColor]
        }
        if correctAnswer == 2 {
            imageView3 = figures[randomColor]
        }
        var incorrectAnswer1 = RandomIndex(value: 2)
        while incorrectAnswer1 == correctAnswer {
            incorrectAnswer1 = RandomIndex(value: 2)
        }
        if incorrectAnswer1 == 0 {
            imageView1 = figures[randomValue]
        }
        if incorrectAnswer1 == 1 {
            imageView2 = figures[randomValue]
        }
        if incorrectAnswer1 == 2 {
            imageView3 = figures[randomValue]
        }
        var incorrectAnswer2 = RandomIndex(value: 2)
        while incorrectAnswer2 == correctAnswer || incorrectAnswer2 == incorrectAnswer1 {
            incorrectAnswer2 = RandomIndex(value: 2)
        }
        if incorrectAnswer2 == 0 {
            imageView1 = figures[randomOption]
        }
        if incorrectAnswer2 == 1 {
            imageView2 = figures[randomOption]
        }
        if incorrectAnswer2 == 2 {
            imageView3 = figures[randomOption]
        }
    }

    /*El método "checkAnswer" recibe un valor entero y lo compara con la respuesta global*/
    func checkAnswer(answer: Int){
        //Si la respuesta coincide con la global, se aumenta el valor de la puntuación
        if answer == globalAnswer {
            score += 10 * globalLives
        }
        //En caso contrario, el número de vidas se reduce en una unidad
        else {
            globalLives -= 1
        }
        globalAnswer = -1
    }

}
