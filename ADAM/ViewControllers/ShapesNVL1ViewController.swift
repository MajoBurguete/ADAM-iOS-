/*Esta clase representa el Controlador para el primer nivel del juego "En Formitas"*/


import UIKit
import Foundation
import MobileCoreServices

class ShapesNVL1ViewController: UIViewController {
    
    //Se instancian todas las variables necesarias para el sistema del Controlador
    
    let modelNVL1 = ShapesModelNVL1.instance
    
    @IBOutlet weak var ivLife1SH: UIImageView!
    
    @IBOutlet weak var ivLife2SH: UIImageView!
    
    @IBOutlet weak var ivLife3SH: UIImageView!
    
    @IBOutlet weak var ivNVL1Figure1: UIImageView!
    
    @IBOutlet weak var ivNVL1Figure2: UIImageView!
    
    @IBOutlet weak var ivNVL1Figure3: UIImageView!
    
    @IBOutlet weak var ivNVL1Drag1: UIImageView!
    
    @IBOutlet weak var ivNVL1Drag2: UIImageView!
    
    @IBOutlet weak var ivNVL1Drag3: UIImageView!
    
    @IBOutlet weak var tvShapesNVL1: UILabel!
    
    @IBOutlet weak var tvScoreShapesNVL1: UILabel!
    
    @IBOutlet weak var btnCheckNVL1: UIButton!
    
    @IBOutlet weak var btnContinueNVL1: UIButton!
    
    @IBOutlet weak var btnRestartNVL1: UIButton!
    
    var dragImage: UIImageView!
    var originalCenterDrag1: CGPoint!
    var originalCenterDrag2: CGPoint!
    var originalCenterDrag3: CGPoint!
    var lives = 3
    var score = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelNVL1.clearModel()
        modelNVL1.startNewRound()
        setLayoutAttributes()
        
        originalCenterDrag1 = ivNVL1Drag1.center
        originalCenterDrag2 = ivNVL1Drag2.center
        originalCenterDrag3 = ivNVL1Drag3.center
        
    }
    
    //El método setLayoutAttributes revisa los atributos actuales del modelo para actualizar los valores en el Layout
    func setLayoutAttributes(){
        ivNVL1Figure1.alpha = 0
        ivNVL1Figure2.alpha = 0
        ivNVL1Figure3.alpha = 0
        
        ivNVL1Drag1.alpha = 0
        ivNVL1Drag1.isUserInteractionEnabled = false
        ivNVL1Drag2.alpha = 0
        ivNVL1Drag2.isUserInteractionEnabled = false
        ivNVL1Drag3.alpha = 0
        ivNVL1Drag3.isUserInteractionEnabled = false
        
        ivNVL1Figure1.image = modelNVL1.figure1resource
        ivNVL1Figure2.image = modelNVL1.figure2resource
        ivNVL1Figure3.image = modelNVL1.figure3resource
        
        ivNVL1Drag1.image = modelNVL1.drag1resource
        ivNVL1Drag2.image = modelNVL1.drag2resource
        ivNVL1Drag3.image = modelNVL1.drag3resource
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL1Figure1.alpha = 1
            self.ivNVL1Figure2.alpha = 1
            self.ivNVL1Figure3.alpha = 1
        }
        
        btnCheckNVL1.isEnabled = false
        btnRestartNVL1.isEnabled = false
        
        //El string del TextView muestra el mensaje para indicar que el usuario observe las posiciones de las figuras
        tvShapesNVL1.text = "¡Ve las posiciones!"
        
    }
    
    /*El método "hideSequence" procede a ocultar las figuras en los escalones y mostrarlas en la parte inferior de la pantalla. Permitiendo que el usuario pueda arrastrarlas hacia las posiciones que recuerda*/
    func hideSequence(){
        ivNVL1Figure1.isUserInteractionEnabled = true
        ivNVL1Figure2.isUserInteractionEnabled = true
        ivNVL1Figure3.isUserInteractionEnabled = true
        ivNVL1Drag1.isUserInteractionEnabled = true
        ivNVL1Drag2.isUserInteractionEnabled = true
        ivNVL1Drag3.isUserInteractionEnabled = true
        btnRestartNVL1.isEnabled = true
        btnContinueNVL1.isEnabled = false
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL1Figure1.alpha = 0
            self.ivNVL1Figure2.alpha = 0
            self.ivNVL1Figure3.alpha = 0
        }
        
        ivNVL1Drag1.alpha = 0
        ivNVL1Drag2.alpha = 0
        ivNVL1Drag3.alpha = 0
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL1Drag1.alpha = 1
            self.ivNVL1Drag2.alpha = 1
            self.ivNVL1Drag3.alpha = 1
        }
        
        //El string del TextView muestra el mensaje para indicar que el usuario debe arrastrar las figuras a su lugar
        tvShapesNVL1.text = "¡Ponlas en su lugar!"
        
        //El estado del modelo es cambiado a false, con el fin de que el siguiente paso sea la creación de una nueva ronda
        modelNVL1.state = false
    }
    
    // Se implementa la funcionalidad del botón de pausa
    @IBAction func pauseLevel1(_ sender: Any) {
        performSegue(withIdentifier: "pauseFormitas1", sender: nil)
    }
    
    // Se implementa la funcionalidad del Pan Gesture Recognizer para identificar el arrastre de las tres figuras existentes.
    
    @IBAction func dragFormita(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else {
            return
        }
        // Inicio del arrastre
        if sender.state == UIGestureRecognizer.State.began {
            originalCenterDrag1 = gestureView.center
        }
        // Cambio de posición del objeto arrastrado
        else if sender.state == UIGestureRecognizer.State.changed{
            gestureView.center = CGPoint(x: originalCenterDrag1.x + translation.x, y: originalCenterDrag1.y + translation.y)
        }
        // Finalización del arrastre
        else if sender.state == UIGestureRecognizer.State.ended {
            sender.setTranslation(.zero, in: view)
            replaceImages(figure: 1)
            setCheckBtnEnablement()
        }
        
    }
    
    @IBAction func dragFormita2(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else {
            return
        }
        // Inicio del arrastre
        if sender.state == UIGestureRecognizer.State.began {
            originalCenterDrag2 = gestureView.center
        }
        // Cambio de posición del objeto arrastrado
        else if sender.state == UIGestureRecognizer.State.changed{
            gestureView.center = CGPoint(x: originalCenterDrag2.x + translation.x, y: originalCenterDrag2.y + translation.y)
        }
        // Finalización del arrastre
        else if sender.state == UIGestureRecognizer.State.ended {
            sender.setTranslation(.zero, in: view)
            replaceImages(figure: 2)
            setCheckBtnEnablement()
        }
    }
    
    @IBAction func dragFormita3(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else {
            return
        }
        // Inicio del arrastre
        if sender.state == UIGestureRecognizer.State.began {
            originalCenterDrag3 = gestureView.center
        }
        // Cambio de posición del objeto arrastrado
        else if sender.state == UIGestureRecognizer.State.changed{
            gestureView.center = CGPoint(x: originalCenterDrag3.x + translation.x, y: originalCenterDrag3.y + translation.y)
        }
        // Finalización del arrastre
        else if sender.state == UIGestureRecognizer.State.ended {
            sender.setTranslation(.zero, in: view)
            replaceImages(figure: 3)
            setCheckBtnEnablement()
        }
    }
    
    // Se envia el score a la pantalla de Game Over
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is GameOverViewController{
            let destinationVC = segue.destination as? GameOverViewController
            destinationVC?.score = score
        }
      
    }
    
    // Se crea la funcionalidad del botón continuar
    @IBAction func btnContinue(_ sender: Any) {
        /*En caso de haberse agotado las vidas, se obtienen los parámetros necesarios para poder hacer la evaluación de la Puntuación*/
        if lives == 0 {
            performSegue(withIdentifier: "formitasGameOverNVL1", sender: nil)
        }
        //Si no, si el estado del modelo es verdadero, se llama al método "hideSequence"
        else if modelNVL1.state {
            hideSequence()
        }
        else{
            modelNVL1.startNewRound()
            setLayoutAttributes()
        }
        
    }
    
    //El botón "Checar" evalúa si el input de respuesta es correcto o no y hace los cambios oportunos
    @IBAction func btnCheck(_ sender: Any) {
        //El número de respuestas correctas se inicializa en cero
        var correctAnswers = 0
        /*Cada recurso presente en el arreglo "figures" del modelo es comparado con el recurso actual de cada figura. De este modo, se puede identificar si la respuesta es correcta o incorrecta*/
        //Si los recursos coinciden, aumenta el contador de respuestas correctas
        
        if ivNVL1Figure1.image == modelNVL1.figure1resource {
            correctAnswers = correctAnswers + 1
        }
        /*Si los recursos no coinciden, se quita la imagen actual para dar la oportunidad de recolocarla*/
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL1Figure1.alpha = 0
            }
            ivNVL1Figure1.isUserInteractionEnabled = true
            if ivNVL1Figure1.image == modelNVL1.drag1resource {
                ivNVL1Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Drag1.alpha = 1
                }
            }
            if ivNVL1Figure1.image == modelNVL1.drag2resource {
                ivNVL1Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Drag2.alpha = 1
                }
            }
            if ivNVL1Figure1.image == modelNVL1.drag3resource {
                ivNVL1Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Drag3.alpha = 1
                }
            }
        }
        //Este proceso se realiza para cada una de las figuras del juego

        if ivNVL1Figure2.image == modelNVL1.figure2resource {
            correctAnswers = correctAnswers + 1
        }
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL1Figure2.alpha = 0
            }
            ivNVL1Figure2.isUserInteractionEnabled = true
            if ivNVL1Figure2.image == modelNVL1.drag1resource {
                ivNVL1Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Drag1.alpha = 1
                }
            }
            if ivNVL1Figure2.image == modelNVL1.drag2resource {
                ivNVL1Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Drag2.alpha = 1
                }
            }
            if ivNVL1Figure2.image == modelNVL1.drag3resource {
                ivNVL1Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Drag3.alpha = 1
                }
            }
        }
        
        if ivNVL1Figure3.image == modelNVL1.figure3resource {
            correctAnswers = correctAnswers + 1
        }
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL1Figure3.alpha = 0
            }
            ivNVL1Figure3.isUserInteractionEnabled = true
            if ivNVL1Figure3.image == modelNVL1.drag1resource {
                ivNVL1Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Drag1.alpha = 1
                }
            }
            if ivNVL1Figure3.image == modelNVL1.drag2resource {
                ivNVL1Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Drag2.alpha = 1
                }
            }
            if ivNVL1Figure3.image == modelNVL1.drag3resource {
                ivNVL1Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Drag3.alpha = 1
                }
            }
        }
        
        /*Si después de hacer la evaluación en todas las figuras el contador de respuestas correctas es 3, significa que todas fueron colocadas adecuadamente y se aumenta la puntuación*/
        
        if correctAnswers == 3 {
            btnContinueNVL1.isEnabled = true
            btnRestartNVL1.isEnabled = false
            
            //La puntuación es actualizada
            score = score + lives * 20
            tvScoreShapesNVL1.text = "Puntaje: " + String(score)
            tvShapesNVL1.text = "¡Muy bien!"
        }
        /*Si la respuesta total fue incorrecta, se hace la modificación correspondiente de las vidas*/
        else{
            //El valor de las vidas se disminuye en una unidad
            lives = lives - 1
            
            //Se checa el valor específico para cambiar el recurso de las las ImageViews
            if lives == 2{
                ivLife3SH.image = UIImage.init(named: "34")
            }
            if lives == 1{
                ivLife2SH.image = UIImage.init(named: "34")
            }
            //Se actualiza el text view
            tvShapesNVL1.text = "¡Intenta de nuevo!"
            /*Si el valor de las vidas llega a cero, además de cambiar el recurso, se hace la evaluación para mostrar la respuesta correcta*/
            if lives == 0{
                ivLife1SH.image = UIImage.init(named: "34")
                tvShapesNVL1.text = "¡Juego terminado!"
                self.ivNVL1Drag1.isHidden = true
                self.ivNVL1Drag2.isHidden = true
                self.ivNVL1Drag3.isHidden = true
                
                /*Se modifican los recursos de las figuras para cambiarlos a las respuestas correctas. Solo se deja habilitado el botón de "Continuar" para permitir la finalización de la partida*/
                ivNVL1Figure1.isUserInteractionEnabled = false
                ivNVL1Figure2.isUserInteractionEnabled = false
                ivNVL1Figure3.isUserInteractionEnabled = false
                ivNVL1Drag1.isUserInteractionEnabled = false
                ivNVL1Drag2.isUserInteractionEnabled = false
                ivNVL1Drag3.isUserInteractionEnabled = false
                
                ivNVL1Figure1.alpha = 0
                ivNVL1Figure1.image = modelNVL1.figure1resource
                ivNVL1Figure2.alpha = 0
                ivNVL1Figure2.image = modelNVL1.figure2resource
                ivNVL1Figure3.alpha = 0
                ivNVL1Figure3.image = modelNVL1.figure3resource
                
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL1Figure1.alpha = 1
                    self.ivNVL1Figure2.alpha = 1
                    self.ivNVL1Figure3.alpha = 1
                }
                
                btnRestartNVL1.isEnabled = false
                btnContinueNVL1.isEnabled = true
            }
        }
        
        //Se vuelve a desabilitar el botón de "Checar"
        btnCheckNVL1.isEnabled = false
        
    }
    
    /*El botón "Reiniciar" permite regresar las figuras a sus valores originales para hacer un reacomodo
              sin la necesidad de tener que "checar" la respuesta y perder una vida*/
    @IBAction func btnRestart(_ sender: Any) {
        ivNVL1Figure1.isUserInteractionEnabled = true
        ivNVL1Figure2.isUserInteractionEnabled = true
        ivNVL1Figure3.isUserInteractionEnabled = true
        ivNVL1Drag1.isUserInteractionEnabled = true
        ivNVL1Drag2.isUserInteractionEnabled = true
        ivNVL1Drag3.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL1Figure1.alpha = 0
            self.ivNVL1Figure2.alpha = 0
            self.ivNVL1Figure3.alpha = 0
            self.ivNVL1Drag1.alpha = 1
            self.ivNVL1Drag2.alpha = 1
            self.ivNVL1Drag3.alpha = 1
        }
        
        btnCheckNVL1.isEnabled = false
        
    }
    
    /*El método "setCheckBtnEnablement" revisa si todas las posiciones han recibido un input de respuesta para habilitar el botón "Checar"*/
    func setCheckBtnEnablement(){
        if ivNVL1Figure1.alpha == 1 && ivNVL1Figure2.alpha == 1 && ivNVL1Figure3.alpha == 1 {
            btnCheckNVL1.isEnabled = true
        }
    }
    
    
    // La función "replaceImages" remplaza las imagenes cuando son soltadas en las posiciones validas.
    func replaceImages(figure: Int){
        if(figure == 1){
            if(abs(ivNVL1Figure1.center.x - ivNVL1Drag1.center.x) < 25 && abs(ivNVL1Figure1.center.y - ivNVL1Drag1.center.y) < 25){
                ivNVL1Drag1.alpha = 0
                ivNVL1Drag1.isUserInteractionEnabled = false
                
                ivNVL1Figure1.isUserInteractionEnabled = false
                ivNVL1Figure1.image = ivNVL1Drag1.image
                ivNVL1Figure1.alpha = 1
            }
            else if(abs(ivNVL1Figure2.center.x - ivNVL1Drag1.center.x) < 25 && abs(ivNVL1Figure2.center.y - ivNVL1Drag1.center.y) < 25){
                ivNVL1Drag1.alpha = 0
                ivNVL1Drag1.isUserInteractionEnabled = false
                
                ivNVL1Figure2.isUserInteractionEnabled = false
                ivNVL1Figure2.image = ivNVL1Drag1.image
                ivNVL1Figure2.alpha = 1
            }
            else if(abs(ivNVL1Figure3.center.x - ivNVL1Drag1.center.x) < 25 && abs(ivNVL1Figure3.center.y - ivNVL1Drag1.center.y) < 25){
                ivNVL1Drag1.alpha = 0
                ivNVL1Drag1.isUserInteractionEnabled = false
                
                ivNVL1Figure3.isUserInteractionEnabled = false
                ivNVL1Figure3.image = ivNVL1Drag1.image
                ivNVL1Figure3.alpha = 1
            }
            ivNVL1Drag1.center = originalCenterDrag1
        }
        if figure == 2 {
            if(abs(ivNVL1Figure1.center.x - ivNVL1Drag2.center.x) < 25 && abs(ivNVL1Figure1.center.y - ivNVL1Drag2.center.y) < 25){
                ivNVL1Drag2.alpha = 0
                ivNVL1Drag2.isUserInteractionEnabled = false
                
                ivNVL1Figure1.isUserInteractionEnabled = false
                ivNVL1Figure1.image = ivNVL1Drag2.image
                ivNVL1Figure1.alpha = 1
            }
            else if(abs(ivNVL1Figure2.center.x - ivNVL1Drag2.center.x) < 25 && abs(ivNVL1Figure2.center.y - ivNVL1Drag2.center.y) < 25){
                ivNVL1Drag2.alpha = 0
                ivNVL1Drag2.isUserInteractionEnabled = false
                
                ivNVL1Figure2.isUserInteractionEnabled = false
                ivNVL1Figure2.image = ivNVL1Drag2.image
                ivNVL1Figure2.alpha = 1
            }
            else if(abs(ivNVL1Figure3.center.x - ivNVL1Drag2.center.x) < 25 && abs(ivNVL1Figure3.center.y - ivNVL1Drag2.center.y) < 25){
                ivNVL1Drag2.alpha = 0
                ivNVL1Drag2.isUserInteractionEnabled = false
                
                ivNVL1Figure3.isUserInteractionEnabled = false
                ivNVL1Figure3.image = ivNVL1Drag2.image
                ivNVL1Figure3.alpha = 1
            }
            ivNVL1Drag2.center = originalCenterDrag2
        }
        if figure == 3 {
            if(abs(ivNVL1Figure1.center.x - ivNVL1Drag3.center.x) < 25 && abs(ivNVL1Figure1.center.y - ivNVL1Drag3.center.y) < 25){
                ivNVL1Drag3.alpha = 0
                ivNVL1Drag3.isUserInteractionEnabled = false
                
                ivNVL1Figure1.isUserInteractionEnabled = false
                ivNVL1Figure1.image = ivNVL1Drag3.image
                ivNVL1Figure1.alpha = 1
            }
            else if(abs(ivNVL1Figure2.center.x - ivNVL1Drag3.center.x) < 25 && abs(ivNVL1Figure2.center.y - ivNVL1Drag3.center.y) < 25){
                ivNVL1Drag3.alpha = 0
                ivNVL1Drag3.isUserInteractionEnabled = false
                
                ivNVL1Figure2.isUserInteractionEnabled = false
                ivNVL1Figure2.image = ivNVL1Drag3.image
                ivNVL1Figure2.alpha = 1
            }
            else if(abs(ivNVL1Figure3.center.x - ivNVL1Drag3.center.x) < 25 && abs(ivNVL1Figure3.center.y - ivNVL1Drag3.center.y) < 25){
                ivNVL1Drag3.alpha = 0
                ivNVL1Drag3.isUserInteractionEnabled = false
                
                ivNVL1Figure3.isUserInteractionEnabled = false
                ivNVL1Figure3.image = ivNVL1Drag3.image
                ivNVL1Figure3.alpha = 1
            }
            ivNVL1Drag3.center = originalCenterDrag3
        }
    }
    

}
