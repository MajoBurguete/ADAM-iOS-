//
//  ShapesNVL3ViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//

import UIKit

class ShapesNVL3ViewController: UIViewController {
    
    let modelNVL3 = ShapesModelNVL3.instance
    
    @IBOutlet weak var ivLife1SH3: UIImageView!
    
    @IBOutlet weak var ivLife2SH3: UIImageView!
    
    @IBOutlet weak var ivLife3SH3: UIImageView!
    
    @IBOutlet weak var ivNVL3Figure1: UIImageView!
    
    @IBOutlet weak var ivNVL3Figure2: UIImageView!
    
    @IBOutlet weak var ivNVL3Figure3: UIImageView!
    
    @IBOutlet weak var ivNVL3Figure4: UIImageView!
    
    @IBOutlet weak var ivNVL3Figure5: UIImageView!
    
    @IBOutlet weak var ivNVL3Drag1: UIImageView!
    
    @IBOutlet weak var ivNVL3Drag2: UIImageView!
    
    @IBOutlet weak var ivNVL3Drag3: UIImageView!
    
    @IBOutlet weak var ivNVL3Drag4: UIImageView!
    
    @IBOutlet weak var ivNVL3Drag5: UIImageView!
    
    @IBOutlet weak var tvShapesNVL3: UILabel!
    
    @IBOutlet weak var tvScoreShapesNVL3: UILabel!
    
    @IBOutlet weak var btnCheckNVL3: UIButton!
    
    @IBOutlet weak var btnContinueNVL3: UIButton!
    
    @IBOutlet weak var btnRestartNVL3: UIButton!
    
    
    var originalCenterDrag1: CGPoint!
    var originalCenterDrag2: CGPoint!
    var originalCenterDrag3: CGPoint!
    var originalCenterDrag4: CGPoint!
    var originalCenterDrag5: CGPoint!
    var lives = 3
    var score = 0
    var newHigh = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        modelNVL3.clearModel()
        modelNVL3.startNewRound()
        setLayoutAttributes()
        
        originalCenterDrag1 = ivNVL3Drag1.center
        originalCenterDrag2 = ivNVL3Drag2.center
        originalCenterDrag3 = ivNVL3Drag3.center
        originalCenterDrag4 = ivNVL3Drag4.center
        originalCenterDrag5 = ivNVL3Drag5.center
        
        
    }
    
    //El método setLayoutAttributes revisa los atributos actuales del modelo para actualizar los valores en el Layout
    func setLayoutAttributes(){
        ivNVL3Figure1.alpha = 0
        ivNVL3Figure2.alpha = 0
        ivNVL3Figure3.alpha = 0
        ivNVL3Figure4.alpha = 0
        ivNVL3Figure5.alpha = 0
        
        ivNVL3Drag1.alpha = 0
        ivNVL3Drag1.isUserInteractionEnabled = false
        ivNVL3Drag2.alpha = 0
        ivNVL3Drag2.isUserInteractionEnabled = false
        ivNVL3Drag3.alpha = 0
        ivNVL3Drag3.isUserInteractionEnabled = false
        ivNVL3Drag4.alpha = 0
        ivNVL3Drag4.isUserInteractionEnabled = false
        ivNVL3Drag5.alpha = 0
        ivNVL3Drag5.isUserInteractionEnabled = false
        
        ivNVL3Figure1.image = modelNVL3.figure1resource
        ivNVL3Figure2.image = modelNVL3.figure2resource
        ivNVL3Figure3.image = modelNVL3.figure3resource
        ivNVL3Figure4.image = modelNVL3.figure4resource
        ivNVL3Figure5.image = modelNVL3.figure5resource
        
        ivNVL3Drag1.image = modelNVL3.drag1resource
        ivNVL3Drag2.image = modelNVL3.drag2resource
        ivNVL3Drag3.image = modelNVL3.drag3resource
        ivNVL3Drag4.image = modelNVL3.drag4resource
        ivNVL3Drag5.image = modelNVL3.drag5resource
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL3Figure1.alpha = 1
            self.ivNVL3Figure2.alpha = 1
            self.ivNVL3Figure3.alpha = 1
            self.ivNVL3Figure4.alpha = 1
            self.ivNVL3Figure5.alpha = 1
        }
        
        btnCheckNVL3.isEnabled = false
        btnRestartNVL3.isEnabled = false
        
        //El string del TextView muestra el mensaje para indicar que el usuario observe las posiciones de las figuras
        tvShapesNVL3.text = "¡Ve las posiciones!"
        
    }
    
    /*El método "hideSequence" procede a ocultar las figuras en los escalones y mostrarlas en la parte inferior de la pantalla. Permitiendo que el usuario pueda arrastrarlas hacia las posiciones que recuerda*/
    func hideSequence(){
        ivNVL3Figure1.isUserInteractionEnabled = true
        ivNVL3Figure2.isUserInteractionEnabled = true
        ivNVL3Figure3.isUserInteractionEnabled = true
        ivNVL3Figure4.isUserInteractionEnabled = true
        ivNVL3Figure5.isUserInteractionEnabled = true
        ivNVL3Drag1.isUserInteractionEnabled = true
        ivNVL3Drag2.isUserInteractionEnabled = true
        ivNVL3Drag3.isUserInteractionEnabled = true
        ivNVL3Drag4.isUserInteractionEnabled = true
        ivNVL3Drag5.isUserInteractionEnabled = true
        btnRestartNVL3.isEnabled = true
        btnContinueNVL3.isEnabled = false
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL3Figure1.alpha = 0
            self.ivNVL3Figure2.alpha = 0
            self.ivNVL3Figure3.alpha = 0
            self.ivNVL3Figure4.alpha = 0
            self.ivNVL3Figure5.alpha = 0
        }
        
        ivNVL3Drag1.alpha = 0
        ivNVL3Drag2.alpha = 0
        ivNVL3Drag3.alpha = 0
        ivNVL3Drag4.alpha = 0
        ivNVL3Drag5.alpha = 0
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL3Drag1.alpha = 1
            self.ivNVL3Drag2.alpha = 1
            self.ivNVL3Drag3.alpha = 1
            self.ivNVL3Drag4.alpha = 1
            self.ivNVL3Drag5.alpha = 1
        }
        
        //El string del TextView muestra el mensaje para indicar que el usuario debe arrastrar las figuras a su lugar
        tvShapesNVL3.text = "¡Ponlas en su lugar!"
        
        //El estado del modelo es cambiado a false, con el fin de que el siguiente paso sea la creación de una nueva ronda
        modelNVL3.state = false
    }
    
    
    // Se envia el score a la pantalla de Game Over
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is GameOverViewController{
            let destinationVC = segue.destination as? GameOverViewController
            destinationVC?.score = score
            destinationVC?.newHigh = newHigh
            destinationVC?.game = "formitas"
        }
      
    }
    
    @IBAction func dragNVL3formita1(_ sender: UIPanGestureRecognizer) {
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
    
    @IBAction func dragNVL3formita2(_ sender: UIPanGestureRecognizer) {
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
    
    @IBAction func dragNVL3formita3(_ sender: UIPanGestureRecognizer) {
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
    
    @IBAction func dragNVL3formita4(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else {
            return
        }
        // Inicio del arrastre
        if sender.state == UIGestureRecognizer.State.began {
            originalCenterDrag4 = gestureView.center
        }
        // Cambio de posición del objeto arrastrado
        else if sender.state == UIGestureRecognizer.State.changed{
            gestureView.center = CGPoint(x: originalCenterDrag4.x + translation.x, y: originalCenterDrag4.y + translation.y)
        }
        // Finalización del arrastre
        else if sender.state == UIGestureRecognizer.State.ended {
            sender.setTranslation(.zero, in: view)
            replaceImages(figure: 4)
            setCheckBtnEnablement()
        }
    }
    
    @IBAction func dragNVL3formita5(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else {
            return
        }
        // Inicio del arrastre
        if sender.state == UIGestureRecognizer.State.began {
            originalCenterDrag5 = gestureView.center
        }
        // Cambio de posición del objeto arrastrado
        else if sender.state == UIGestureRecognizer.State.changed{
            gestureView.center = CGPoint(x: originalCenterDrag5.x + translation.x, y: originalCenterDrag5.y + translation.y)
        }
        // Finalización del arrastre
        else if sender.state == UIGestureRecognizer.State.ended {
            sender.setTranslation(.zero, in: view)
            replaceImages(figure: 5)
            setCheckBtnEnablement()
        }
    }
    
    
    @IBAction func btnCheckNVL3(_ sender: Any) {
        //El número de respuestas correctas se inicializa en cero
        var correctAnswers = 0
        /*Cada recurso presente en el arreglo "figures" del modelo es comparado con el recurso actual de cada figura. De este modo, se puede identificar si la respuesta es correcta o incorrecta*/
        //Si los recursos coinciden, aumenta el contador de respuestas correctas
        
        if ivNVL3Figure1.image == modelNVL3.figure1resource {
            correctAnswers = correctAnswers + 1
        }
        /*Si los recursos no coinciden, se quita la imagen actual para dar la oportunidad de recolocarla*/
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL3Figure1.alpha = 0
            }
            ivNVL3Figure1.isUserInteractionEnabled = true
            if ivNVL3Figure1.image == modelNVL3.drag1resource {
                ivNVL3Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag1.alpha = 1
                }
            }
            if ivNVL3Figure1.image == modelNVL3.drag2resource {
                ivNVL3Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag2.alpha = 1
                }
            }
            if ivNVL3Figure1.image == modelNVL3.drag3resource {
                ivNVL3Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag3.alpha = 1
                }
            }
            if ivNVL3Figure1.image == modelNVL3.drag4resource {
                ivNVL3Drag4.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag4.alpha = 1
                }
            }
            if ivNVL3Figure1.image == modelNVL3.drag5resource {
                ivNVL3Drag5.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag5.alpha = 1
                }
            }
        }
        //Este proceso se realiza para cada una de las figuras del juego

        if ivNVL3Figure2.image == modelNVL3.figure2resource {
            correctAnswers = correctAnswers + 1
        }
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL3Figure2.alpha = 0
            }
            ivNVL3Figure2.isUserInteractionEnabled = true
            if ivNVL3Figure2.image == modelNVL3.drag1resource {
                ivNVL3Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag1.alpha = 1
                }
            }
            if ivNVL3Figure2.image == modelNVL3.drag2resource {
                ivNVL3Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag2.alpha = 1
                }
            }
            if ivNVL3Figure2.image == modelNVL3.drag3resource {
                ivNVL3Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag3.alpha = 1
                }
            }
            if ivNVL3Figure2.image == modelNVL3.drag4resource {
                ivNVL3Drag4.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag4.alpha = 1
                }
            }
            if ivNVL3Figure2.image == modelNVL3.drag5resource {
                ivNVL3Drag5.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag5.alpha = 1
                }
            }
        }
        
        if ivNVL3Figure3.image == modelNVL3.figure3resource {
            correctAnswers = correctAnswers + 1
        }
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL3Figure3.alpha = 0
            }
            ivNVL3Figure3.isUserInteractionEnabled = true
            if ivNVL3Figure3.image == modelNVL3.drag1resource {
                ivNVL3Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag1.alpha = 1
                }
            }
            if ivNVL3Figure3.image == modelNVL3.drag2resource {
                ivNVL3Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag2.alpha = 1
                }
            }
            if ivNVL3Figure3.image == modelNVL3.drag3resource {
                ivNVL3Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag3.alpha = 1
                }
            }
            if ivNVL3Figure3.image == modelNVL3.drag4resource {
                ivNVL3Drag4.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag4.alpha = 1
                }
            }
            if ivNVL3Figure3.image == modelNVL3.drag5resource {
                ivNVL3Drag5.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag5.alpha = 1
                }
            }
        }
        
        if ivNVL3Figure4.image == modelNVL3.figure4resource {
            correctAnswers = correctAnswers + 1
        }
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL3Figure4.alpha = 0
            }
            ivNVL3Figure4.isUserInteractionEnabled = true
            if ivNVL3Figure4.image == modelNVL3.drag1resource {
                ivNVL3Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag1.alpha = 1
                }
            }
            if ivNVL3Figure4.image == modelNVL3.drag2resource {
                ivNVL3Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag2.alpha = 1
                }
            }
            if ivNVL3Figure4.image == modelNVL3.drag3resource {
                ivNVL3Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag3.alpha = 1
                }
            }
            if ivNVL3Figure4.image == modelNVL3.drag4resource {
                ivNVL3Drag4.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag4.alpha = 1
                }
            }
            if ivNVL3Figure4.image == modelNVL3.drag5resource {
                ivNVL3Drag5.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag5.alpha = 1
                }
            }
        }
        
        if ivNVL3Figure5.image == modelNVL3.figure5resource {
            correctAnswers = correctAnswers + 1
        }
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL3Figure5.alpha = 0
            }
            ivNVL3Figure5.isUserInteractionEnabled = true
            if ivNVL3Figure5.image == modelNVL3.drag1resource {
                ivNVL3Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag1.alpha = 1
                }
            }
            if ivNVL3Figure5.image == modelNVL3.drag2resource {
                ivNVL3Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag2.alpha = 1
                }
            }
            if ivNVL3Figure5.image == modelNVL3.drag3resource {
                ivNVL3Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag3.alpha = 1
                }
            }
            if ivNVL3Figure5.image == modelNVL3.drag4resource {
                ivNVL3Drag4.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag4.alpha = 1
                }
            }
            if ivNVL3Figure5.image == modelNVL3.drag5resource {
                ivNVL3Drag5.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Drag5.alpha = 1
                }
            }
        }
        
        /*Si después de hacer la evaluación en todas las figuras el contador de respuestas correctas es 3, significa que todas fueron colocadas adecuadamente y se aumenta la puntuación*/
        
        if correctAnswers == 5 {
            btnContinueNVL3.isEnabled = true
            btnRestartNVL3.isEnabled = false
            
            //La puntuación es actualizada
            score = score + lives * 20 * 3
            tvScoreShapesNVL3.text = "Puntaje: " + String(score)
            tvShapesNVL3.text = "¡Muy bien!"
        }
        /*Si la respuesta total fue incorrecta, se hace la modificación correspondiente de las vidas*/
        else{
            //El valor de las vidas se disminuye en una unidad
            lives = lives - 1
            
            //Se checa el valor específico para cambiar el recurso de las las ImageViews
            if lives == 2{
                ivLife3SH3.image = UIImage.init(named: "34")
            }
            if lives == 1{
                ivLife2SH3.image = UIImage.init(named: "34")
            }
            //Se actualiza el text view
            tvShapesNVL3.text = "¡Intenta de nuevo!"
            /*Si el valor de las vidas llega a cero, además de cambiar el recurso, se hace la evaluación para mostrar la respuesta correcta*/
            if lives == 0{
                ivLife1SH3.image = UIImage.init(named: "34")
                tvShapesNVL3.text = "¡Juego terminado!"
                self.ivNVL3Drag1.isHidden = true
                self.ivNVL3Drag2.isHidden = true
                self.ivNVL3Drag3.isHidden = true
                self.ivNVL3Drag4.isHidden = true
                self.ivNVL3Drag5.isHidden = true
                
                /*Se modifican los recursos de las figuras para cambiarlos a las respuestas correctas. Solo se deja habilitado el botón de "Continuar" para permitir la finalización de la partida*/
                ivNVL3Figure1.isUserInteractionEnabled = false
                ivNVL3Figure2.isUserInteractionEnabled = false
                ivNVL3Figure3.isUserInteractionEnabled = false
                ivNVL3Figure4.isUserInteractionEnabled = false
                ivNVL3Figure5.isUserInteractionEnabled = false
                ivNVL3Drag1.isUserInteractionEnabled = false
                ivNVL3Drag2.isUserInteractionEnabled = false
                ivNVL3Drag3.isUserInteractionEnabled = false
                ivNVL3Drag4.isUserInteractionEnabled = false
                ivNVL3Drag5.isUserInteractionEnabled = false
                
                ivNVL3Figure1.alpha = 0
                ivNVL3Figure1.image = modelNVL3.figure1resource
                ivNVL3Figure2.alpha = 0
                ivNVL3Figure2.image = modelNVL3.figure2resource
                ivNVL3Figure3.alpha = 0
                ivNVL3Figure3.image = modelNVL3.figure3resource
                ivNVL3Figure4.alpha = 0
                ivNVL3Figure4.image = modelNVL3.figure4resource
                ivNVL3Figure5.alpha = 0
                ivNVL3Figure5.image = modelNVL3.figure5resource
                
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL3Figure1.alpha = 1
                    self.ivNVL3Figure2.alpha = 1
                    self.ivNVL3Figure3.alpha = 1
                    self.ivNVL3Figure4.alpha = 1
                    self.ivNVL3Figure5.alpha = 1
                }
                
                btnRestartNVL3.isEnabled = false
                btnContinueNVL3.isEnabled = true
            }
        }
        
        //Se vuelve a desabilitar el botón de "Checar"
        btnCheckNVL3.isEnabled = false
    }
    
    @IBAction func btnContinueNVL3(_ sender: Any) {
        /*En caso de haberse agotado las vidas, se obtienen los parámetros necesarios para poder hacer la evaluación de la Puntuación*/
        if lives == 0 {
            let user = ModelManager.instance.findCurrentUSer()
            if user.scoreF < score {
                newHigh = true
                ModelManager.instance.setCurrentScore(userNum: user.userNum, newScore: score, game: 1)
            }
            performSegue(withIdentifier: "formitasGameOverNVL3", sender: nil)
        }
        //Si no, si el estado del modelo es verdadero, se llama al método "hideSequence"
        else if modelNVL3.state {
            hideSequence()
        }
        else{
            modelNVL3.startNewRound()
            setLayoutAttributes()
        }
    }
    
    /*El botón "Reiniciar" permite regresar las figuras a sus valores originales para hacer un reacomodo
              sin la necesidad de tener que "checar" la respuesta y perder una vida*/
    @IBAction func btnRestartNVL3(_ sender: Any) {
        ivNVL3Figure1.isUserInteractionEnabled = true
        ivNVL3Figure2.isUserInteractionEnabled = true
        ivNVL3Figure3.isUserInteractionEnabled = true
        ivNVL3Figure4.isUserInteractionEnabled = true
        ivNVL3Figure5.isUserInteractionEnabled = true
        ivNVL3Drag1.isUserInteractionEnabled = true
        ivNVL3Drag2.isUserInteractionEnabled = true
        ivNVL3Drag3.isUserInteractionEnabled = true
        ivNVL3Drag4.isUserInteractionEnabled = true
        ivNVL3Drag5.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL3Figure1.alpha = 0
            self.ivNVL3Figure2.alpha = 0
            self.ivNVL3Figure3.alpha = 0
            self.ivNVL3Figure4.alpha = 0
            self.ivNVL3Figure5.alpha = 0
            self.ivNVL3Drag1.alpha = 1
            self.ivNVL3Drag2.alpha = 1
            self.ivNVL3Drag3.alpha = 1
            self.ivNVL3Drag4.alpha = 1
            self.ivNVL3Drag5.alpha = 1
        }
        
        btnCheckNVL3.isEnabled = false
    }
    
    /*El método "setCheckBtnEnablement" revisa si todas las posiciones han recibido un input de respuesta para habilitar el botón "Checar"*/
    func setCheckBtnEnablement(){
        if ivNVL3Figure1.alpha == 1 && ivNVL3Figure2.alpha == 1 && ivNVL3Figure3.alpha == 1 && ivNVL3Figure4.alpha == 1 && ivNVL3Figure5.alpha == 1{
            btnCheckNVL3.isEnabled = true
        }
    }
    
    
    // La función "replaceImages" remplaza las imagenes cuando son soltadas en las posiciones validas.
    func replaceImages(figure: Int){
        if(figure == 1){
            if(abs(ivNVL3Figure1.center.x - ivNVL3Drag1.center.x) < 25 && abs(ivNVL3Figure1.center.y - ivNVL3Drag1.center.y) < 25){
                ivNVL3Drag1.alpha = 0
                ivNVL3Drag1.isUserInteractionEnabled = false
                
                ivNVL3Figure1.isUserInteractionEnabled = false
                ivNVL3Figure1.image = ivNVL3Drag1.image
                ivNVL3Figure1.alpha = 1
            }
            else if(abs(ivNVL3Figure2.center.x - ivNVL3Drag1.center.x) < 25 && abs(ivNVL3Figure2.center.y - ivNVL3Drag1.center.y) < 25){
                ivNVL3Drag1.alpha = 0
                ivNVL3Drag1.isUserInteractionEnabled = false
                
                ivNVL3Figure2.isUserInteractionEnabled = false
                ivNVL3Figure2.image = ivNVL3Drag1.image
                ivNVL3Figure2.alpha = 1
            }
            else if(abs(ivNVL3Figure3.center.x - ivNVL3Drag1.center.x) < 25 && abs(ivNVL3Figure3.center.y - ivNVL3Drag1.center.y) < 25){
                ivNVL3Drag1.alpha = 0
                ivNVL3Drag1.isUserInteractionEnabled = false
                
                ivNVL3Figure3.isUserInteractionEnabled = false
                ivNVL3Figure3.image = ivNVL3Drag1.image
                ivNVL3Figure3.alpha = 1
            }
            else if(abs(ivNVL3Figure4.center.x - ivNVL3Drag1.center.x) < 25 && abs(ivNVL3Figure4.center.y - ivNVL3Drag1.center.y) < 25){
                ivNVL3Drag1.alpha = 0
                ivNVL3Drag1.isUserInteractionEnabled = false
                
                ivNVL3Figure4.isUserInteractionEnabled = false
                ivNVL3Figure4.image = ivNVL3Drag1.image
                ivNVL3Figure4.alpha = 1
            }
            else if(abs(ivNVL3Figure5.center.x - ivNVL3Drag1.center.x) < 25 && abs(ivNVL3Figure5.center.y - ivNVL3Drag1.center.y) < 25){
                ivNVL3Drag1.alpha = 0
                ivNVL3Drag1.isUserInteractionEnabled = false
                
                ivNVL3Figure5.isUserInteractionEnabled = false
                ivNVL3Figure5.image = ivNVL3Drag1.image
                ivNVL3Figure5.alpha = 1
            }
            ivNVL3Drag1.center = originalCenterDrag1
        }
        if figure == 2 {
            if(abs(ivNVL3Figure1.center.x - ivNVL3Drag2.center.x) < 25 && abs(ivNVL3Figure1.center.y - ivNVL3Drag2.center.y) < 25){
                ivNVL3Drag2.alpha = 0
                ivNVL3Drag2.isUserInteractionEnabled = false
                
                ivNVL3Figure1.isUserInteractionEnabled = false
                ivNVL3Figure1.image = ivNVL3Drag2.image
                ivNVL3Figure1.alpha = 1
            }
            else if(abs(ivNVL3Figure2.center.x - ivNVL3Drag2.center.x) < 25 && abs(ivNVL3Figure2.center.y - ivNVL3Drag2.center.y) < 25){
                ivNVL3Drag2.alpha = 0
                ivNVL3Drag2.isUserInteractionEnabled = false
                
                ivNVL3Figure2.isUserInteractionEnabled = false
                ivNVL3Figure2.image = ivNVL3Drag2.image
                ivNVL3Figure2.alpha = 1
            }
            else if(abs(ivNVL3Figure3.center.x - ivNVL3Drag2.center.x) < 25 && abs(ivNVL3Figure3.center.y - ivNVL3Drag2.center.y) < 25){
                ivNVL3Drag2.alpha = 0
                ivNVL3Drag2.isUserInteractionEnabled = false
                
                ivNVL3Figure3.isUserInteractionEnabled = false
                ivNVL3Figure3.image = ivNVL3Drag2.image
                ivNVL3Figure3.alpha = 1
            }
            else if(abs(ivNVL3Figure4.center.x - ivNVL3Drag2.center.x) < 25 && abs(ivNVL3Figure4.center.y - ivNVL3Drag2.center.y) < 25){
                ivNVL3Drag2.alpha = 0
                ivNVL3Drag2.isUserInteractionEnabled = false
                
                ivNVL3Figure4.isUserInteractionEnabled = false
                ivNVL3Figure4.image = ivNVL3Drag2.image
                ivNVL3Figure4.alpha = 1
            }
            else if(abs(ivNVL3Figure5.center.x - ivNVL3Drag2.center.x) < 25 && abs(ivNVL3Figure5.center.y - ivNVL3Drag2.center.y) < 25){
                ivNVL3Drag2.alpha = 0
                ivNVL3Drag2.isUserInteractionEnabled = false
                
                ivNVL3Figure5.isUserInteractionEnabled = false
                ivNVL3Figure5.image = ivNVL3Drag2.image
                ivNVL3Figure5.alpha = 1
            }
            ivNVL3Drag2.center = originalCenterDrag2
        }
        if figure == 3 {
            if(abs(ivNVL3Figure1.center.x - ivNVL3Drag3.center.x) < 25 && abs(ivNVL3Figure1.center.y - ivNVL3Drag3.center.y) < 25){
                ivNVL3Drag3.alpha = 0
                ivNVL3Drag3.isUserInteractionEnabled = false
                
                ivNVL3Figure1.isUserInteractionEnabled = false
                ivNVL3Figure1.image = ivNVL3Drag3.image
                ivNVL3Figure1.alpha = 1
            }
            else if(abs(ivNVL3Figure2.center.x - ivNVL3Drag3.center.x) < 25 && abs(ivNVL3Figure2.center.y - ivNVL3Drag3.center.y) < 25){
                ivNVL3Drag3.alpha = 0
                ivNVL3Drag3.isUserInteractionEnabled = false
                
                ivNVL3Figure2.isUserInteractionEnabled = false
                ivNVL3Figure2.image = ivNVL3Drag3.image
                ivNVL3Figure2.alpha = 1
            }
            else if(abs(ivNVL3Figure3.center.x - ivNVL3Drag3.center.x) < 25 && abs(ivNVL3Figure3.center.y - ivNVL3Drag3.center.y) < 25){
                ivNVL3Drag3.alpha = 0
                ivNVL3Drag3.isUserInteractionEnabled = false
                
                ivNVL3Figure3.isUserInteractionEnabled = false
                ivNVL3Figure3.image = ivNVL3Drag3.image
                ivNVL3Figure3.alpha = 1
            }
            else if(abs(ivNVL3Figure4.center.x - ivNVL3Drag3.center.x) < 25 && abs(ivNVL3Figure4.center.y - ivNVL3Drag3.center.y) < 25){
                ivNVL3Drag3.alpha = 0
                ivNVL3Drag3.isUserInteractionEnabled = false
                
                ivNVL3Figure4.isUserInteractionEnabled = false
                ivNVL3Figure4.image = ivNVL3Drag3.image
                ivNVL3Figure4.alpha = 1
            }
            else if(abs(ivNVL3Figure5.center.x - ivNVL3Drag3.center.x) < 25 && abs(ivNVL3Figure5.center.y - ivNVL3Drag3.center.y) < 25){
                ivNVL3Drag3.alpha = 0
                ivNVL3Drag3.isUserInteractionEnabled = false
                
                ivNVL3Figure5.isUserInteractionEnabled = false
                ivNVL3Figure5.image = ivNVL3Drag3.image
                ivNVL3Figure5.alpha = 1
            }
            ivNVL3Drag3.center = originalCenterDrag3
        }
        if figure == 4 {
            if(abs(ivNVL3Figure1.center.x - ivNVL3Drag4.center.x) < 25 && abs(ivNVL3Figure1.center.y - ivNVL3Drag4.center.y) < 25){
                ivNVL3Drag4.alpha = 0
                ivNVL3Drag4.isUserInteractionEnabled = false
                
                ivNVL3Figure1.isUserInteractionEnabled = false
                ivNVL3Figure1.image = ivNVL3Drag4.image
                ivNVL3Figure1.alpha = 1
            }
            else if(abs(ivNVL3Figure2.center.x - ivNVL3Drag4.center.x) < 25 && abs(ivNVL3Figure2.center.y - ivNVL3Drag4.center.y) < 25){
                ivNVL3Drag4.alpha = 0
                ivNVL3Drag4.isUserInteractionEnabled = false
                
                ivNVL3Figure2.isUserInteractionEnabled = false
                ivNVL3Figure2.image = ivNVL3Drag4.image
                ivNVL3Figure2.alpha = 1
            }
            else if(abs(ivNVL3Figure3.center.x - ivNVL3Drag4.center.x) < 25 && abs(ivNVL3Figure3.center.y - ivNVL3Drag4.center.y) < 25){
                ivNVL3Drag4.alpha = 0
                ivNVL3Drag4.isUserInteractionEnabled = false
                
                ivNVL3Figure3.isUserInteractionEnabled = false
                ivNVL3Figure3.image = ivNVL3Drag4.image
                ivNVL3Figure3.alpha = 1
            }
            else if(abs(ivNVL3Figure4.center.x - ivNVL3Drag4.center.x) < 25 && abs(ivNVL3Figure4.center.y - ivNVL3Drag4.center.y) < 25){
                ivNVL3Drag4.alpha = 0
                ivNVL3Drag4.isUserInteractionEnabled = false
                
                ivNVL3Figure4.isUserInteractionEnabled = false
                ivNVL3Figure4.image = ivNVL3Drag4.image
                ivNVL3Figure4.alpha = 1
            }
            else if(abs(ivNVL3Figure5.center.x - ivNVL3Drag4.center.x) < 25 && abs(ivNVL3Figure5.center.y - ivNVL3Drag4.center.y) < 25){
                ivNVL3Drag4.alpha = 0
                ivNVL3Drag4.isUserInteractionEnabled = false
                
                ivNVL3Figure5.isUserInteractionEnabled = false
                ivNVL3Figure5.image = ivNVL3Drag4.image
                ivNVL3Figure5.alpha = 1
            }
            ivNVL3Drag4.center = originalCenterDrag4
        }
        if figure == 5 {
            if(abs(ivNVL3Figure1.center.x - ivNVL3Drag5.center.x) < 25 && abs(ivNVL3Figure1.center.y - ivNVL3Drag5.center.y) < 25){
                ivNVL3Drag5.alpha = 0
                ivNVL3Drag5.isUserInteractionEnabled = false
                
                ivNVL3Figure1.isUserInteractionEnabled = false
                ivNVL3Figure1.image = ivNVL3Drag5.image
                ivNVL3Figure1.alpha = 1
            }
            else if(abs(ivNVL3Figure2.center.x - ivNVL3Drag5.center.x) < 25 && abs(ivNVL3Figure2.center.y - ivNVL3Drag5.center.y) < 25){
                ivNVL3Drag5.alpha = 0
                ivNVL3Drag5.isUserInteractionEnabled = false
                
                ivNVL3Figure2.isUserInteractionEnabled = false
                ivNVL3Figure2.image = ivNVL3Drag5.image
                ivNVL3Figure2.alpha = 1
            }
            else if(abs(ivNVL3Figure3.center.x - ivNVL3Drag5.center.x) < 25 && abs(ivNVL3Figure3.center.y - ivNVL3Drag5.center.y) < 25){
                ivNVL3Drag5.alpha = 0
                ivNVL3Drag5.isUserInteractionEnabled = false
                
                ivNVL3Figure3.isUserInteractionEnabled = false
                ivNVL3Figure3.image = ivNVL3Drag5.image
                ivNVL3Figure3.alpha = 1
            }
            else if(abs(ivNVL3Figure4.center.x - ivNVL3Drag5.center.x) < 25 && abs(ivNVL3Figure4.center.y - ivNVL3Drag5.center.y) < 25){
                ivNVL3Drag5.alpha = 0
                ivNVL3Drag5.isUserInteractionEnabled = false
                
                ivNVL3Figure4.isUserInteractionEnabled = false
                ivNVL3Figure4.image = ivNVL3Drag5.image
                ivNVL3Figure4.alpha = 1
            }
            else if(abs(ivNVL3Figure5.center.x - ivNVL3Drag5.center.x) < 25 && abs(ivNVL3Figure5.center.y - ivNVL3Drag5.center.y) < 25){
                ivNVL3Drag5.alpha = 0
                ivNVL3Drag5.isUserInteractionEnabled = false
                
                ivNVL3Figure5.isUserInteractionEnabled = false
                ivNVL3Figure5.image = ivNVL3Drag5.image
                ivNVL3Figure5.alpha = 1
            }
            ivNVL3Drag5.center = originalCenterDrag5
        }
    }
    
    @IBAction func btnPauseF3(_ sender: Any) {
        let titleFont = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 20)]
        let titleAttrString = NSMutableAttributedString(string: "Pausa", attributes: titleFont)
        let alert = UIAlertController(title: "Pausa", message: nil, preferredStyle: .actionSheet)
        alert.setValue(titleAttrString, forKey:"attributedTitle")
        let returnAction = UIAlertAction(title: "Seguir Jugando", style: .cancel) {
            (_) in }
        let exitAction = UIAlertAction(title: "Salir", style: .destructive) {action in
            self.performSegue(withIdentifier: "toHomeF3", sender: nil)
        }
        alert.addAction(returnAction)
        alert.addAction(exitAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}

