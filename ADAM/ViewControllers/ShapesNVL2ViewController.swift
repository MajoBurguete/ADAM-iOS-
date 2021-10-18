//
//  ShapesNVL2ViewController.swift
//  ADAM
//
//  Created by Maria jose Burguete euan on 15/10/21.
//


import UIKit

class ShapesNVL2ViewController: UIViewController {
    
    let modelNVL2 = ShapesModelNVL2.instance
    
    @IBOutlet weak var ivLife1SH2: UIImageView!
    
    @IBOutlet weak var ivLife2SH2: UIImageView!
    
    @IBOutlet weak var ivLife3SH2: UIImageView!
    
    @IBOutlet weak var ivNVL2Figure1: UIImageView!
    
    @IBOutlet weak var ivNVL2Figure2: UIImageView!
    
    @IBOutlet weak var ivNVL2Figure3: UIImageView!
    
    @IBOutlet weak var ivNVL2Figure4: UIImageView!
    
    @IBOutlet weak var ivNVL2Drag1: UIImageView!
    
    @IBOutlet weak var ivNVL2Drag2: UIImageView!
    
    @IBOutlet weak var ivNVL2Drag3: UIImageView!
    
    @IBOutlet weak var ivNVL2Drag4: UIImageView!
    
    @IBOutlet weak var tvShapesNVL2: UILabel!
    
    @IBOutlet weak var tvScoreShapesNVL2: UILabel!
    
    @IBOutlet weak var btnCheckNVL2: UIButton!
    
    @IBOutlet weak var btnContinueNVL2: UIButton!
    
    @IBOutlet weak var btnRestartNVL2: UIButton!
    
    var dragImage: UIImageView!
    var originalCenterDrag1: CGPoint!
    var originalCenterDrag2: CGPoint!
    var originalCenterDrag3: CGPoint!
    var originalCenterDrag4: CGPoint!
    var lives = 3
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        modelNVL2.clearModel()
        modelNVL2.startNewRound()
        setLayoutAttributes()
        
        originalCenterDrag1 = ivNVL2Drag1.center
        originalCenterDrag2 = ivNVL2Drag2.center
        originalCenterDrag3 = ivNVL2Drag3.center
        originalCenterDrag4 = ivNVL2Drag4.center
        
        
    }
    
    //El método setLayoutAttributes revisa los atributos actuales del modelo para actualizar los valores en el Layout
    func setLayoutAttributes(){
        ivNVL2Figure1.alpha = 0
        ivNVL2Figure2.alpha = 0
        ivNVL2Figure3.alpha = 0
        ivNVL2Figure4.alpha = 0
        
        ivNVL2Drag1.alpha = 0
        ivNVL2Drag1.isUserInteractionEnabled = false
        ivNVL2Drag2.alpha = 0
        ivNVL2Drag2.isUserInteractionEnabled = false
        ivNVL2Drag3.alpha = 0
        ivNVL2Drag3.isUserInteractionEnabled = false
        ivNVL2Drag4.alpha = 0
        ivNVL2Drag4.isUserInteractionEnabled = false
        
        ivNVL2Figure1.image = modelNVL2.figure1resource
        ivNVL2Figure2.image = modelNVL2.figure2resource
        ivNVL2Figure3.image = modelNVL2.figure3resource
        ivNVL2Figure4.image = modelNVL2.figure4resource
        
        ivNVL2Drag1.image = modelNVL2.drag1resource
        ivNVL2Drag2.image = modelNVL2.drag2resource
        ivNVL2Drag3.image = modelNVL2.drag3resource
        ivNVL2Drag4.image = modelNVL2.drag4resource
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL2Figure1.alpha = 1
            self.ivNVL2Figure2.alpha = 1
            self.ivNVL2Figure3.alpha = 1
            self.ivNVL2Figure4.alpha = 1
        }
        
        btnCheckNVL2.isEnabled = false
        btnRestartNVL2.isEnabled = false
        
        //El string del TextView muestra el mensaje para indicar que el usuario observe las posiciones de las figuras
        tvShapesNVL2.text = "¡Ve las posiciones!"
        
    }
    
    /*El método "hideSequence" procede a ocultar las figuras en los escalones y mostrarlas en la parte inferior de la pantalla. Permitiendo que el usuario pueda arrastrarlas hacia las posiciones que recuerda*/
    func hideSequence(){
        ivNVL2Figure1.isUserInteractionEnabled = true
        ivNVL2Figure2.isUserInteractionEnabled = true
        ivNVL2Figure3.isUserInteractionEnabled = true
        ivNVL2Figure4.isUserInteractionEnabled = true
        ivNVL2Drag1.isUserInteractionEnabled = true
        ivNVL2Drag2.isUserInteractionEnabled = true
        ivNVL2Drag3.isUserInteractionEnabled = true
        ivNVL2Drag4.isUserInteractionEnabled = true
        btnRestartNVL2.isEnabled = true
        btnContinueNVL2.isEnabled = false
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL2Figure1.alpha = 0
            self.ivNVL2Figure2.alpha = 0
            self.ivNVL2Figure3.alpha = 0
            self.ivNVL2Figure4.alpha = 0
        }
        
        ivNVL2Drag1.alpha = 0
        ivNVL2Drag2.alpha = 0
        ivNVL2Drag3.alpha = 0
        ivNVL2Drag4.alpha = 0
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL2Drag1.alpha = 1
            self.ivNVL2Drag2.alpha = 1
            self.ivNVL2Drag3.alpha = 1
            self.ivNVL2Drag4.alpha = 1
        }
        
        //El string del TextView muestra el mensaje para indicar que el usuario debe arrastrar las figuras a su lugar
        tvShapesNVL2.text = "¡Ponlas en su lugar!"
        
        //El estado del modelo es cambiado a false, con el fin de que el siguiente paso sea la creación de una nueva ronda
        modelNVL2.state = false
    }
    
    
    // Se envia el score a la pantalla de Game Over
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is GameOverViewController{
            let destinationVC = segue.destination as? GameOverViewController
            destinationVC?.score = score
        }
      
    }
    
    
    
    @IBAction func dragFormita1(_ sender: UIPanGestureRecognizer) {
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
    
    @IBAction func dragNVL2Formita2(_ sender: UIPanGestureRecognizer) {
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
    
    @IBAction func dragNVL2Formita3(_ sender: UIPanGestureRecognizer) {
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
    
    @IBAction func dragNVL2Formita4(_ sender: UIPanGestureRecognizer) {
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
    
    
    
    @IBAction func btnCheckNVL2(_ sender: Any) {
        //El número de respuestas correctas se inicializa en cero
        var correctAnswers = 0
        /*Cada recurso presente en el arreglo "figures" del modelo es comparado con el recurso actual de cada figura. De este modo, se puede identificar si la respuesta es correcta o incorrecta*/
        //Si los recursos coinciden, aumenta el contador de respuestas correctas
        
        if ivNVL2Figure1.image == modelNVL2.figure1resource {
            correctAnswers = correctAnswers + 1
        }
        /*Si los recursos no coinciden, se quita la imagen actual para dar la oportunidad de recolocarla*/
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL2Figure1.alpha = 0
            }
            ivNVL2Figure1.isUserInteractionEnabled = true
            if ivNVL2Figure1.image == modelNVL2.drag1resource {
                ivNVL2Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag1.alpha = 1
                }
            }
            if ivNVL2Figure1.image == modelNVL2.drag2resource {
                ivNVL2Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag2.alpha = 1
                }
            }
            if ivNVL2Figure1.image == modelNVL2.drag3resource {
                ivNVL2Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag3.alpha = 1
                }
            }
            if ivNVL2Figure1.image == modelNVL2.drag4resource {
                ivNVL2Drag4.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag4.alpha = 1
                }
            }
        }
        //Este proceso se realiza para cada una de las figuras del juego

        if ivNVL2Figure2.image == modelNVL2.figure2resource {
            correctAnswers = correctAnswers + 1
        }
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL2Figure2.alpha = 0
            }
            ivNVL2Figure2.isUserInteractionEnabled = true
            if ivNVL2Figure2.image == modelNVL2.drag1resource {
                ivNVL2Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag1.alpha = 1
                }
            }
            if ivNVL2Figure2.image == modelNVL2.drag2resource {
                ivNVL2Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag2.alpha = 1
                }
            }
            if ivNVL2Figure2.image == modelNVL2.drag3resource {
                ivNVL2Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag3.alpha = 1
                }
            }
            if ivNVL2Figure2.image == modelNVL2.drag4resource {
                ivNVL2Drag4.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag4.alpha = 1
                }
            }
        }
        
        if ivNVL2Figure3.image == modelNVL2.figure3resource {
            correctAnswers = correctAnswers + 1
        }
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL2Figure3.alpha = 0
            }
            ivNVL2Figure3.isUserInteractionEnabled = true
            if ivNVL2Figure3.image == modelNVL2.drag1resource {
                ivNVL2Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag1.alpha = 1
                }
            }
            if ivNVL2Figure3.image == modelNVL2.drag2resource {
                ivNVL2Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag2.alpha = 1
                }
            }
            if ivNVL2Figure3.image == modelNVL2.drag3resource {
                ivNVL2Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag3.alpha = 1
                }
            }
            if ivNVL2Figure3.image == modelNVL2.drag4resource {
                ivNVL2Drag4.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag4.alpha = 1
                }
            }
        }
        
        if ivNVL2Figure4.image == modelNVL2.figure4resource {
            correctAnswers = correctAnswers + 1
        }
        else{
            UIView.animate(withDuration: 1, delay: 0) {
                self.ivNVL2Figure4.alpha = 0
            }
            ivNVL2Figure4.isUserInteractionEnabled = true
            if ivNVL2Figure4.image == modelNVL2.drag1resource {
                ivNVL2Drag1.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag1.alpha = 1
                }
            }
            if ivNVL2Figure4.image == modelNVL2.drag2resource {
                ivNVL2Drag2.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag2.alpha = 1
                }
            }
            if ivNVL2Figure4.image == modelNVL2.drag3resource {
                ivNVL2Drag3.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag3.alpha = 1
                }
            }
            if ivNVL2Figure4.image == modelNVL2.drag4resource {
                ivNVL2Drag4.isUserInteractionEnabled = true
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Drag4.alpha = 1
                }
            }
        }
        
        /*Si después de hacer la evaluación en todas las figuras el contador de respuestas correctas es 3, significa que todas fueron colocadas adecuadamente y se aumenta la puntuación*/
        
        if correctAnswers == 4 {
            btnContinueNVL2.isEnabled = true
            btnRestartNVL2.isEnabled = false
            
            //La puntuación es actualizada
            score = score + lives * 20 * 2
            tvScoreShapesNVL2.text = "Puntaje: " + String(score)
            tvShapesNVL2.text = "¡Muy bien!"
        }
        /*Si la respuesta total fue incorrecta, se hace la modificación correspondiente de las vidas*/
        else{
            //El valor de las vidas se disminuye en una unidad
            lives = lives - 1
            
            //Se checa el valor específico para cambiar el recurso de las las ImageViews
            if lives == 2{
                ivLife3SH2.image = UIImage.init(named: "34")
            }
            if lives == 1{
                ivLife2SH2.image = UIImage.init(named: "34")
            }
            //Se actualiza el text view
            tvShapesNVL2.text = "¡Intenta de nuevo!"
            /*Si el valor de las vidas llega a cero, además de cambiar el recurso, se hace la evaluación para mostrar la respuesta correcta*/
            if lives == 0{
                ivLife1SH2.image = UIImage.init(named: "34")
                tvShapesNVL2.text = "¡Juego terminado!"
                self.ivNVL2Drag1.isHidden = true
                self.ivNVL2Drag2.isHidden = true
                self.ivNVL2Drag3.isHidden = true
                self.ivNVL2Drag4.isHidden = true
                
                /*Se modifican los recursos de las figuras para cambiarlos a las respuestas correctas. Solo se deja habilitado el botón de "Continuar" para permitir la finalización de la partida*/
                ivNVL2Figure1.isUserInteractionEnabled = false
                ivNVL2Figure2.isUserInteractionEnabled = false
                ivNVL2Figure3.isUserInteractionEnabled = false
                ivNVL2Figure4.isUserInteractionEnabled = false
                ivNVL2Drag1.isUserInteractionEnabled = false
                ivNVL2Drag2.isUserInteractionEnabled = false
                ivNVL2Drag3.isUserInteractionEnabled = false
                ivNVL2Drag4.isUserInteractionEnabled = false
                
                ivNVL2Figure1.alpha = 0
                ivNVL2Figure1.image = modelNVL2.figure1resource
                ivNVL2Figure2.alpha = 0
                ivNVL2Figure2.image = modelNVL2.figure2resource
                ivNVL2Figure3.alpha = 0
                ivNVL2Figure3.image = modelNVL2.figure3resource
                ivNVL2Figure4.alpha = 0
                ivNVL2Figure4.image = modelNVL2.figure4resource
                
                UIView.animate(withDuration: 1, delay: 0) {
                    self.ivNVL2Figure1.alpha = 1
                    self.ivNVL2Figure2.alpha = 1
                    self.ivNVL2Figure3.alpha = 1
                    self.ivNVL2Figure4.alpha = 1
                }
                
                btnRestartNVL2.isEnabled = false
                btnContinueNVL2.isEnabled = true
            }
        }
        
        //Se vuelve a desabilitar el botón de "Checar"
        btnCheckNVL2.isEnabled = false
        
    }
    
    /*El botón "Reiniciar" permite regresar las figuras a sus valores originales para hacer un reacomodo
              sin la necesidad de tener que "checar" la respuesta y perder una vida*/
    
    @IBAction func btnContinueNVL2(_ sender: Any) {
        /*En caso de haberse agotado las vidas, se obtienen los parámetros necesarios para poder hacer la evaluación de la Puntuación*/
        if lives == 0 {
            performSegue(withIdentifier: "formitasGameOverNVL2", sender: nil)
        }
        //Si no, si el estado del modelo es verdadero, se llama al método "hideSequence"
        else if modelNVL2.state {
            hideSequence()
        }
        else{
            modelNVL2.startNewRound()
            setLayoutAttributes()
        }
    }
    
    /*El botón "Reiniciar" permite regresar las figuras a sus valores originales para hacer un reacomodo
              sin la necesidad de tener que "checar" la respuesta y perder una vida*/
    @IBAction func btnRestartNVL2(_ sender: Any) {
        ivNVL2Figure1.isUserInteractionEnabled = true
        ivNVL2Figure2.isUserInteractionEnabled = true
        ivNVL2Figure3.isUserInteractionEnabled = true
        ivNVL2Figure4.isUserInteractionEnabled = true
        ivNVL2Drag1.isUserInteractionEnabled = true
        ivNVL2Drag2.isUserInteractionEnabled = true
        ivNVL2Drag3.isUserInteractionEnabled = true
        ivNVL2Drag4.isUserInteractionEnabled = true
        
        UIView.animate(withDuration: 1, delay: 0) {
            self.ivNVL2Figure1.alpha = 0
            self.ivNVL2Figure2.alpha = 0
            self.ivNVL2Figure3.alpha = 0
            self.ivNVL2Figure4.alpha = 0
            self.ivNVL2Drag1.alpha = 1
            self.ivNVL2Drag2.alpha = 1
            self.ivNVL2Drag3.alpha = 1
            self.ivNVL2Drag4.alpha = 1
        }
        
        btnCheckNVL2.isEnabled = false
    }
    
    /*El método "setCheckBtnEnablement" revisa si todas las posiciones han recibido un input de respuesta para habilitar el botón "Checar"*/
    func setCheckBtnEnablement(){
        if ivNVL2Figure1.alpha == 1 && ivNVL2Figure2.alpha == 1 && ivNVL2Figure3.alpha == 1 && ivNVL2Figure4.alpha == 1 {
            btnCheckNVL2.isEnabled = true
        }
    }
    
    
    // La función "replaceImages" remplaza las imagenes cuando son soltadas en las posiciones validas.
    func replaceImages(figure: Int){
        if(figure == 1){
            if(abs(ivNVL2Figure1.center.x - ivNVL2Drag1.center.x) < 25 && abs(ivNVL2Figure1.center.y - ivNVL2Drag1.center.y) < 25){
                ivNVL2Drag1.alpha = 0
                ivNVL2Drag1.isUserInteractionEnabled = false
                
                ivNVL2Figure1.isUserInteractionEnabled = false
                ivNVL2Figure1.image = ivNVL2Drag1.image
                ivNVL2Figure1.alpha = 1
            }
            else if(abs(ivNVL2Figure2.center.x - ivNVL2Drag1.center.x) < 25 && abs(ivNVL2Figure2.center.y - ivNVL2Drag1.center.y) < 25){
                ivNVL2Drag1.alpha = 0
                ivNVL2Drag1.isUserInteractionEnabled = false
                
                ivNVL2Figure2.isUserInteractionEnabled = false
                ivNVL2Figure2.image = ivNVL2Drag1.image
                ivNVL2Figure2.alpha = 1
            }
            else if(abs(ivNVL2Figure3.center.x - ivNVL2Drag1.center.x) < 25 && abs(ivNVL2Figure3.center.y - ivNVL2Drag1.center.y) < 25){
                ivNVL2Drag1.alpha = 0
                ivNVL2Drag1.isUserInteractionEnabled = false
                
                ivNVL2Figure3.isUserInteractionEnabled = false
                ivNVL2Figure3.image = ivNVL2Drag1.image
                ivNVL2Figure3.alpha = 1
            }
            else if(abs(ivNVL2Figure4.center.x - ivNVL2Drag1.center.x) < 25 && abs(ivNVL2Figure4.center.y - ivNVL2Drag1.center.y) < 25){
                ivNVL2Drag1.alpha = 0
                ivNVL2Drag1.isUserInteractionEnabled = false
                
                ivNVL2Figure4.isUserInteractionEnabled = false
                ivNVL2Figure4.image = ivNVL2Drag1.image
                ivNVL2Figure4.alpha = 1
            }
            ivNVL2Drag1.center = originalCenterDrag1
        }
        if figure == 2 {
            if(abs(ivNVL2Figure1.center.x - ivNVL2Drag2.center.x) < 25 && abs(ivNVL2Figure1.center.y - ivNVL2Drag2.center.y) < 25){
                ivNVL2Drag2.alpha = 0
                ivNVL2Drag2.isUserInteractionEnabled = false
                
                ivNVL2Figure1.isUserInteractionEnabled = false
                ivNVL2Figure1.image = ivNVL2Drag2.image
                ivNVL2Figure1.alpha = 1
            }
            else if(abs(ivNVL2Figure2.center.x - ivNVL2Drag2.center.x) < 25 && abs(ivNVL2Figure2.center.y - ivNVL2Drag2.center.y) < 25){
                ivNVL2Drag2.alpha = 0
                ivNVL2Drag2.isUserInteractionEnabled = false
                
                ivNVL2Figure2.isUserInteractionEnabled = false
                ivNVL2Figure2.image = ivNVL2Drag2.image
                ivNVL2Figure2.alpha = 1
            }
            else if(abs(ivNVL2Figure3.center.x - ivNVL2Drag2.center.x) < 25 && abs(ivNVL2Figure3.center.y - ivNVL2Drag2.center.y) < 25){
                ivNVL2Drag2.alpha = 0
                ivNVL2Drag2.isUserInteractionEnabled = false
                
                ivNVL2Figure3.isUserInteractionEnabled = false
                ivNVL2Figure3.image = ivNVL2Drag2.image
                ivNVL2Figure3.alpha = 1
            }
            else if(abs(ivNVL2Figure4.center.x - ivNVL2Drag2.center.x) < 25 && abs(ivNVL2Figure4.center.y - ivNVL2Drag2.center.y) < 25){
                ivNVL2Drag2.alpha = 0
                ivNVL2Drag2.isUserInteractionEnabled = false
                
                ivNVL2Figure4.isUserInteractionEnabled = false
                ivNVL2Figure4.image = ivNVL2Drag2.image
                ivNVL2Figure4.alpha = 1
            }
            ivNVL2Drag2.center = originalCenterDrag2
        }
        if figure == 3 {
            if(abs(ivNVL2Figure1.center.x - ivNVL2Drag3.center.x) < 25 && abs(ivNVL2Figure1.center.y - ivNVL2Drag3.center.y) < 25){
                ivNVL2Drag3.alpha = 0
                ivNVL2Drag3.isUserInteractionEnabled = false
                
                ivNVL2Figure1.isUserInteractionEnabled = false
                ivNVL2Figure1.image = ivNVL2Drag3.image
                ivNVL2Figure1.alpha = 1
            }
            else if(abs(ivNVL2Figure2.center.x - ivNVL2Drag3.center.x) < 25 && abs(ivNVL2Figure2.center.y - ivNVL2Drag3.center.y) < 25){
                ivNVL2Drag3.alpha = 0
                ivNVL2Drag3.isUserInteractionEnabled = false
                
                ivNVL2Figure2.isUserInteractionEnabled = false
                ivNVL2Figure2.image = ivNVL2Drag3.image
                ivNVL2Figure2.alpha = 1
            }
            else if(abs(ivNVL2Figure3.center.x - ivNVL2Drag3.center.x) < 25 && abs(ivNVL2Figure3.center.y - ivNVL2Drag3.center.y) < 25){
                ivNVL2Drag3.alpha = 0
                ivNVL2Drag3.isUserInteractionEnabled = false
                
                ivNVL2Figure3.isUserInteractionEnabled = false
                ivNVL2Figure3.image = ivNVL2Drag3.image
                ivNVL2Figure3.alpha = 1
            }
            else if(abs(ivNVL2Figure4.center.x - ivNVL2Drag3.center.x) < 25 && abs(ivNVL2Figure4.center.y - ivNVL2Drag3.center.y) < 25){
                ivNVL2Drag3.alpha = 0
                ivNVL2Drag3.isUserInteractionEnabled = false
                
                ivNVL2Figure4.isUserInteractionEnabled = false
                ivNVL2Figure4.image = ivNVL2Drag3.image
                ivNVL2Figure4.alpha = 1
            }
            ivNVL2Drag3.center = originalCenterDrag3
        }
        if figure == 4 {
            if(abs(ivNVL2Figure1.center.x - ivNVL2Drag4.center.x) < 25 && abs(ivNVL2Figure1.center.y - ivNVL2Drag4.center.y) < 25){
                ivNVL2Drag4.alpha = 0
                ivNVL2Drag4.isUserInteractionEnabled = false
                
                ivNVL2Figure1.isUserInteractionEnabled = false
                ivNVL2Figure1.image = ivNVL2Drag4.image
                ivNVL2Figure1.alpha = 1
            }
            else if(abs(ivNVL2Figure2.center.x - ivNVL2Drag4.center.x) < 25 && abs(ivNVL2Figure2.center.y - ivNVL2Drag4.center.y) < 25){
                ivNVL2Drag4.alpha = 0
                ivNVL2Drag4.isUserInteractionEnabled = false
                
                ivNVL2Figure2.isUserInteractionEnabled = false
                ivNVL2Figure2.image = ivNVL2Drag4.image
                ivNVL2Figure2.alpha = 1
            }
            else if(abs(ivNVL2Figure3.center.x - ivNVL2Drag4.center.x) < 25 && abs(ivNVL2Figure3.center.y - ivNVL2Drag4.center.y) < 25){
                ivNVL2Drag4.alpha = 0
                ivNVL2Drag4.isUserInteractionEnabled = false
                
                ivNVL2Figure3.isUserInteractionEnabled = false
                ivNVL2Figure3.image = ivNVL2Drag4.image
                ivNVL2Figure3.alpha = 1
            }
            else if(abs(ivNVL2Figure4.center.x - ivNVL2Drag4.center.x) < 25 && abs(ivNVL2Figure4.center.y - ivNVL2Drag4.center.y) < 25){
                ivNVL2Drag4.alpha = 0
                ivNVL2Drag4.isUserInteractionEnabled = false
                
                ivNVL2Figure4.isUserInteractionEnabled = false
                ivNVL2Figure4.image = ivNVL2Drag4.image
                ivNVL2Figure4.alpha = 1
            }
            ivNVL2Drag4.center = originalCenterDrag4
        }
    }
    
    @IBAction func pauseLevel2(_ sender: Any) {
        performSegue(withIdentifier: "pauseFormitas2", sender: nil)
    }
    

}
