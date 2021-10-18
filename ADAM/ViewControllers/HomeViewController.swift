/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/
import UIKit

let sharedInstanceH = HomeViewController()

//Clase creada para desplegar el carrusel de juegos a elegir, el perfil con su nombre e icono, y la barra con botones para configuracion y regresar a selección de perfiles.


class HomeViewController: UIViewController {
    
    //Declaración y ligado de todos los componentes necesarios para el funcionamiento del clase con su contraparte en el storyboard
    @IBOutlet weak var lblUser: UILabel!
    @IBOutlet weak var btnUserImage: UIButton!
    let viewController = HomePagesController.instance
    var currentPage: Int!
    class var instance: HomeViewController  {
        return sharedInstanceH;
    }
    
    //se instancia el carrucel de views con los juegos y su explicacion
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationItem.setHidesBackButton(true, animated: true)
        
    }
    
    //funcion que realiza acciones al momento de cargar el ViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        sharedInstanceH.currentPage = 0
        //se crea una instancia de el objeto user para accesar a sus atributos
        let user = ModelManager.instance.findCurrentUSer()
        lblUser.text = user.username
        btnUserImage.setBackgroundImage(UIImage(named: user.userMini), for: .normal)
        
    }
    
    //se actualiza la pagina del carrusel en la que se esta
    func updateTextView(current: Int){
        currentPage = current
        
    }

    @IBAction func nextPage(_ sender: Any) {
        /*let cont = viewController.pageViewController(viewController, viewControllerAfter: viewController.pages[currentPage])! as UIViewController
        viewController.setViewControllers([cont], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)*/
    }
    
    @IBAction func previousPage(_ sender: Any) {
        
    }
    
    
    // se identifica que juego se escogio para mandarlo al correcto
    @IBAction func enterGame(_ sender: Any) {
        if sharedInstanceH.currentPage == 0 {
            performSegue(withIdentifier: "showArcoiris", sender: nil)
        }
        else if sharedInstanceH.currentPage == 1 {
            performSegue(withIdentifier: "showFormitas", sender: nil)
        }
        else if sharedInstanceH.currentPage == 2 {
            performSegue(withIdentifier: "showCuento", sender: nil)
        }
    }
    
}

