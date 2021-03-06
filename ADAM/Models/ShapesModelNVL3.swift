//
//  ShapesModelNVL3.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 18/10/21.
//

import Foundation
import UIKit

let shapesModelNVL3 = ShapesModelNVL3()

class ShapesModelNVL3{
    
    //Se instancian todas las variables necesarias para el sistema del Modelo
    var figure1resource: UIImage!
    var figure2resource: UIImage!
    var figure3resource: UIImage!
    var figure4resource: UIImage!
    var figure5resource: UIImage!
    var drag1resource: UIImage!
    var drag2resource: UIImage!
    var drag3resource: UIImage!
    var drag4resource: UIImage!
    var drag5resource: UIImage!
    //El estado del modelo es inicializado con un valor false
    var state = false
    
    //"Figures" almacena las UIImage disponibles para las figuras del juego
    var figures: [UIImage] = [
        UIImage.init(named: "circulito_amarillo")!,
        UIImage.init(named: "circulito_azul")!,
        UIImage.init(named: "circulito_naranja")!,
        UIImage.init(named: "circulito_rosa")!,
        UIImage.init(named: "circulito_verde")!,
        UIImage.init(named: "cuadradito_amarillo")!,
        UIImage.init(named: "cuadradito_azul")!,
        UIImage.init(named: "cuadradito_naranja")!,
        UIImage.init(named: "cuadradito_rosa")!,
        UIImage.init(named: "cuadradito_verde")!,
        UIImage.init(named: "estrellita_amarillo")!,
        UIImage.init(named: "estrellita_azul")!,
        UIImage.init(named: "estrellita_naranja")!,
        UIImage.init(named: "estrellita_rosa")!,
        UIImage.init(named: "estrellita_verde")!,
        UIImage.init(named: "hex_amarillo")!,
        UIImage.init(named: "hex_azul")!,
        UIImage.init(named: "hex_naranja")!,
        UIImage.init(named: "hex_rosa")!,
        UIImage.init(named: "hex_verde")!,
        UIImage.init(named: "triangulito_amarillo")!,
        UIImage.init(named: "triangulito_azul")!,
        UIImage.init(named: "triangulito_naranja")!,
        UIImage.init(named: "triangulito_rosa")!,
        UIImage.init(named: "triangulito_verde")!
    ]
    
    //"Drags" se inicializa como un arreglo vac??o, que posteriormente recibir?? elementos al crear una nueva ronda
    var drags: [UIImage] = []
    
    class var instance: ShapesModelNVL3 {
        return shapesModelNVL3
    }
    
    //El m??todo "startNewRound" asigna valores aleatorios a las figuras y a los elementos de arrastre
    func startNewRound(){
        //Los elementos en el arreglo "figures" se revuelven a trav??s del m??todo shuffle
        figures.shuffle()
        
        //Los 3 enteros que hacen referencia a los recursos de las figuras reciben su valor de los elementos en el arreglo "figures"
        figure1resource = figures[0]
        figure2resource = figures[1]
        figure3resource = figures[2]
        figure4resource = figures[3]
        figure5resource = figures[4]
        
        //Se remueven todos los elementos actuales en el arreglo "drags", evitando arrastrar recursos de rondas pasadas
        drags.removeAll()
        
        //Se a??aden los primeros 3 valores del arreglo "figures" en "drags"
        drags.append(figures[0])
        drags.append(figures[1])
        drags.append(figures[2])
        drags.append(figures[3])
        drags.append(figures[4])
        
        //Los elementos en el arreglo "drags" se revuelven a trav??s del m??todo shuffle
        drags.shuffle()
        
        //Los 3 enteros que hacen referencia a los recursos de los elementos de arrastre reciben su valor de los elementos en el arreglo "drags"
        drag1resource = drags[0]
        drag2resource = drags[1]
        drag3resource = drags[2]
        drag4resource = drags[3]
        drag5resource = drags[4]
        
        //El estado es cambiado a un valor true
        state = true
        
    }
    
    func clearModel(){
        figure1resource = nil
        figure2resource = nil
        figure3resource = nil
        figure4resource = nil
        figure5resource = nil
        drag1resource = nil
        drag2resource = nil
        drag3resource = nil
        drag4resource = nil
        drag5resource = nil
        state = false
        drags = []
    }
    
    
    
}

