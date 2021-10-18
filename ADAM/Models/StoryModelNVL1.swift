/*Esta clase representa el Modelo para el nivel de dificultad "fácil" del juego "Te Cuento un Cuento" */

import Foundation
import UIKit

let modelStoryNVL1 = StoryModelNVL1()

class StoryModelNVL1 {
    
    //Se instancian todas las variables necesarias para el sistema del Modelo
    var randomStory = 0
    var actualQuestion = 0
    var firstAns: String!
    var secondAns: String!
    var thirdAns: String!
    var question: String!
    var firstAnsOption: String!
    var secondAnsOption: String!
    var thirdAnsOption: String!
    var paragraphGenerated = false
    var firstOptionsPool: [String] = []
    var secondOptionsPool: [String] = []
    var thirdOptionsPool: [String] = []
    
    //"Stories" segmenta los 5 cuentos en 3 párrafos diferentes cada uno
    let stories = [["Caperucita era una niña de # años que vivía cerca del bosque, en una casa #. Un día, # le pidió que le llevara comida a su abuelita.", "Caperucita llenó una cesta con # y salió # de su casa. Por el camino, se encontró con #.", "De repente, un lobo # apareció. Asustó a caperucita con sus #, haciéndola correr de regreso a su casa por el #."], ["Había una vez un conejo # y una tortuga que participaron en una carrera de # vueltas por la #.", "El conejo se burlaba de la tortuga con su amiga #, diciendo: \"eres más lenta que un #, en cambio yo soy tan rápido como el #\".", "Al iniciar, el conejo rebasó a la tortuga y se sentó a #, confiado. La tortuga lo pasó, ganando #. Al llegar el conejo se enojó y #, derrotado."], ["Había una vez una princesa con un vestido #, que tenía un perrito llamado #. Pero un día lo fue a ver # y había desaparecido.", "Fue a preguntarle # si lo había visto, pero no sabía dónde estaba. Corrió por el #, cuando encontró huellas que la guiaban al #.", "Encontró una cueva, donde estaba su perro y # más. Parecían atrapados por unas #. Al final, la princesa construyó # y los rescató."], ["Había una vez un pastorcito llamado # que cuidaba a su rebaño en la #. Un día # estaba aburrido, cuando se le ocurrió gritar \"¡lobo!\" como broma.", "Al escucharlo, # corrieron de prisa para ayudarlo. Pero al llegar, no encontraron a ningún lobo. #, regresaron a sus #. Esto pasó varias veces.", "A la #, las personas decidieron no volver a creerle. Pero # llegó un lobo de verdad. El niño gritó de nuevo, pero nadie vino. El lobo se comió # ovejas."], ["Había una vez un zorro que buscaba algo de comer, cuando vio a un cuervo en un # muy alto con un pedazo de # en su # pico que se le antojó.", "Decidió usar su astucia para conseguirlo, saludando al cuervo, el cual lo miró #. \"¡Gran rey cuervo!, qué # plumas y qué # figura tienes!\"", "Los halagos hicieron al cuervo abrir el pico para #, pero su comida cayó justo en la boca del zorro, quien salió corriendo hacia #. Él iba # porque había logrado su meta."]]
    
    //"Variants" almacena las diferentes opciones existentes para construir los párrafos de las historias con pequeñas variantes.
    
    let variants = [
        [[["5", "8", "10"], ["azul", "morada", "rosa"], ["su mamá", "su papá", "su hermana"]], [["fresas", "manzanas", "peras"], ["corriendo", "caminando", "saltando"], ["una rosa", "una dalia", "una margarita"]], [["feroz", "astuto", "mentiroso"], ["garras", "colmillos", "aullidos"], ["bosque", "prado", "valle"]]],
        [[["blanco", "gris", "café"], ["2", "3", "5"], ["montaña", "isla", "selva"]], [["la rana", "la cebra", "la serpiente"], ["caracol", "perezoso", "koala"], ["viento", "rayo", "río"]], [["comer", "dormir", "jugar"], ["un listón", "un trofeo", "una medalla"], ["gritó", "lloró", "suspiró"]]],
        [[["dorado", "rojo", "morado"], ["Max", "Rocky", "Toby"], ["al jardín", "al patio", "al gran salón"]], [["a su padre", "a su madrastra", "a su guardia"], ["pasillo", "puente", "jardín"], ["pueblo", "sótano", "pozo"]], [["2", "5", "8"], ["rocas", "cajas", "tablas"], ["una escalera", "una rampa", "una polea"]]],
        [[["Pablo", "Juan", "Pedro"], ["montaña", "pradera", "colina"], ["en la mañana", "en la tarde", "en la noche"]], [["sus amigos", "sus familiares", "sus vecinos"], ["Frustrados", "Enojados", "Confundidos"], ["casas", "granjas", "actividades"]], [["tercera vez", "cuarta vez", "quinta vez"], ["una tarde", "una noche", "una mañana"], ["3", "6", "9"]]],
        [[["árbol", "arbusto", "poste"], ["queso", "manzana", "sandía"], ["grande", "pequeño", "ancho"]], [["desconfiado", "inseguro", "irritado"], ["magníficas", "brillantes", "coloridas"], ["hermosa", "espléndida", "increíble"]], [["reír", "sonreír", "cantar"], ["su madriguera", "su cueva", "su escondite"], ["contento", "saciado", "complacido"]]]
    ]
    
    //"Questions" almacena las posibles preguntas para cada párrafo de las historias
    
    let questions = [
        [["¿Cuántos años tenía Caperucita?", "¿De qué color era la casa de Caperucita?", "¿Quién le pidió a Caperucita que llevara comida a su abuelita?"], ["¿Qué llevaba la cesta?", "¿Cómo salió Caperucita de su casa?", "¿Qué flor se encontró Caperucita por el camino?"], ["¿Cómo era el lobo que apareció?", "El lobo asustó a Caperucita con sus...", "¿Por dónde regresó Caperucita a su casa?"]],
        [["¿De qué color era el conejo?", "¿De cuántas vueltas era la carrera?", "La carrera se hizo en la..."], ["¿Quién era amiga del conejo?", "El conejo decía que la tortuga era más lenta que un…", "El conejo decía que era tan rápido como el..."], ["El conejo confiado se sentó a…", "¿Qué ganó la tortuga?", "Cuando perdió, el conejo se enojó y..."]],
        [["¿De qué color era el vestido de la princesa?", "¿Cómo se llamaba el perrito de la princesa?", "¿A dónde fue la princesa para buscar a su perrito?"], ["¿A quién le preguntó la princesa si había visto a su perrito?", "La princesa corrió por el…", "La princesa encontró huellas que la guiaban al..."], ["Además del perrito de la princesa, ¿cuántos más había en la cueva?", "Los perritos estaban atrapados por unas…", "¿Qué construyó la princesa para rescatar a los perritos?"]],
        [["¿Cómo se llamaba el pastorcito?", "El pastorcito cuidaba a sus ovejas en la…", "¿Cuándo hizo la broma el pastorcito?"], ["¿Quiénes corrieron de prisa para ayudar al pastorcito?", "¿Cómo se sintieron los que habían corrido a ayudar por no encontrar al lobo?", "Las personas regresaron a sus..."], ["Las personas ya no le creyeron al pastorcito a la…", "¿Cuándo llegó un lobo de verdad?", "¿Cuántas ovejas se comió el lobo?"]],
        [["El cuervo estaba en un…", "El cuervo tenía un pedazo de…", "¿Cómo era el pico del cuervo?"], ["¿Cómo miró el cuervo al zorro?", "El zorro le dijo al cuervo que sus plumas eran…", "El zorro le dijo al cuervo que tenía una figura..."], ["Luego de los halagos, el cuervo abrió su pico para…", "¿A dónde se fue corriendo el zorro?", "¿Cómo se sentía el zorro por haber logrado su meta?"]]
    ]
    
    class var instance: StoryModelNVL1  {
        return modelStoryNVL1;
    }
    
    func clearModel(){
        randomStory = 0
        actualQuestion = 0
        firstAns = ""
        secondAns = ""
        thirdAns = ""
        question = ""
        firstAnsOption = ""
        secondAnsOption = ""
        thirdAnsOption = ""
        paragraphGenerated = false
        firstOptionsPool.removeAll()
        secondOptionsPool.removeAll()
        thirdOptionsPool.removeAll()
    }
    
    /*El método "generateParagraph" se encarga de construir el párrafo, seleccionando una historia y variantes
          de forma aleatoria. Regresa el texto como un NSMutableAttributedString*/
    func generateParagraph() -> NSMutableAttributedString {
        //Se instancia el valor aleatorio para seleccionar la historia del arreglo "stories"
        randomStory = Int.random(in: 0..<5)
        
        //Se toma el primer párrafo de la historia seleccionada
        var paragraph = stories[randomStory][0]
        
        //Se instancia el valor aleatorio para seleccionar la primera variante
        let randomVariant1 = Int.random(in: 0..<3)
        let firstVariant = variants[randomStory][0][0][randomVariant1]
        //Se define el rango donde aparece por primera vez '#'
        if let range = paragraph.range(of:"#") {
            // '#' se sustituye por firstVariant
            paragraph = paragraph.replacingCharacters(in: range, with:firstVariant)
        }
        
        //La segunda y tercera vez que se encuentra '#' se realiza el mismo proceso con las variantes correspondientes.
        let randomVariant2 = Int.random(in: 0..<3)
        let secondVariant = variants[randomStory][0][1][randomVariant2]
        if let range = paragraph.range(of:"#") {
            paragraph = paragraph.replacingCharacters(in: range, with:secondVariant)
        }
        
        let randomVariant3 = Int.random(in: 0..<3)
        let thirdVariant = variants[randomStory][0][2][randomVariant3]
        if let range = paragraph.range(of:"#") {
            paragraph = paragraph.replacingCharacters(in: range, with:thirdVariant)
        }
        
        //Las tres variantes insertadas se resaltan con colores distintos.

        let range1  = (paragraph as NSString).range(of: firstVariant)
        let finalParagraph = NSMutableAttributedString(string:paragraph)
        finalParagraph.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.verdePa, range: range1)
        
        let finalParNSS = finalParagraph.string as NSString;
        
        let range2 = (finalParNSS).range(of: secondVariant)
        finalParagraph.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.naranja, range: range2)
        
        let range3 = (paragraph as NSString).range(of: thirdVariant)
        finalParagraph.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.azul, range: range3)
        
        // Se cambia el formato del parrafo a la font y alineación correcta
        
        let range4 = (finalParagraph.string as NSString).range(of: finalParagraph.string)
        finalParagraph.addAttribute(NSAttributedString.Key.font, value: UIFont.silkaM(size: 18), range: range4)
        
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.right
        finalParagraph.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: range4)
        
        /*Las variantes son guardadas, para poder hacer referencia a las respuestas correctas de las preguntas. También se almacenan las 3 opciones disponibles para cada pregunta*/
        
        firstAns = firstVariant
        firstOptionsPool = [variants[randomStory][0][0][0], variants[randomStory][0][0][1], variants[randomStory][0][0][2]]
        
        secondAns = secondVariant
        secondOptionsPool = [variants[randomStory][0][1][0], variants[randomStory][0][1][1], variants[randomStory][0][1][2]]
        
        thirdAns = thirdVariant
        thirdOptionsPool = [variants[randomStory][0][2][0], variants[randomStory][0][2][1], variants[randomStory][0][2][2]]
        
        paragraphGenerated = true
        
        
        return finalParagraph
    }
    
    /*El método "generateQuestionAndAnswers" revisa el valor de la pregunta actual para cambiar los atributos de la pregunta como tal y las opciones de respuesta múltiple. Se aplica un shuffle a cada pool para presentarlas en un orden aleatorio*/
    func generateQuestionAndAnswer(){
        if (actualQuestion == 0){
            question = questions[randomStory][0][0]
            firstOptionsPool.shuffle()
            firstAnsOption = firstOptionsPool[0]
            secondAnsOption = firstOptionsPool[1]
            thirdAnsOption = firstOptionsPool[2]
        }
        if (actualQuestion == 1){
            question = questions[randomStory][0][1]
            secondOptionsPool.shuffle()
            firstAnsOption = secondOptionsPool[0]
            secondAnsOption = secondOptionsPool[1]
            thirdAnsOption = secondOptionsPool[2]
        }
        if (actualQuestion == 2){
            question = questions[randomStory][0][2]
            thirdOptionsPool.shuffle()
            firstAnsOption = thirdOptionsPool[0]
            secondAnsOption = thirdOptionsPool[1]
            thirdAnsOption = thirdOptionsPool[2]
        }
    }
    
    
    
}

extension UIColor {
    static let naranjaP: UIColor = UIColor(named: "naranja")!
    static let verdePa: UIColor = UIColor(named: "verde_palido")!
}

extension UIFont {
    public enum silka: String {
            case light = "-light"
            case medium = "-medium"
            case bold = "-bold"
    }

    static func silkaB(_ type: silka = .bold, size: CGFloat) -> UIFont {
        return UIFont(name: "silka\(type.rawValue)", size: size)!
    }
    
    static func silkaM(_ type: silka = .medium, size: CGFloat) -> UIFont {
        return UIFont(name: "silka\(type.rawValue)", size: size)!
    }
    
    static func silkaL(_ type: silka = .light, size: CGFloat) -> UIFont {
        return UIFont(name: "silka\(type.rawValue)", size: size)!
    }
}
