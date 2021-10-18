/* Integración de seguridad informática en redes y sistemas de software (TC2007B.1)
   ADAM: Aplicación para el Desarrollo de Atención y Memoria
   Fecha: 17/10/2021
   Creado por: María José Burguete Euán
               Aarón Cortés García
               Marco Flamenco Andrade
               Daniela Hernández y Hernández
*/
import Foundation

let sharedInstanceMM = ModelManager()

//Clase creada para Crear y modificar la base de datos que se utiliza para alamcenar toda la informacion pertinente de los usuarios
class ModelManager: NSObject {
    var database: FMDatabase?
    
    
    class var instance: ModelManager {
        //se crea el camino donde se guardaraa la instancia de la base de datos
        let fileManager = FileManager.default
        let docURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask).first!
        let databaseURL = docURL.appendingPathComponent("UserDB.db")
        sharedInstanceMM.database = FMDatabase(path: databaseURL.absoluteString)
        return sharedInstanceMM
    }
    
    //se declaran los valores a guardar en la base para crearla en donde se requiera una instancia
    func createDatabase() -> Bool {
        sharedInstanceMM.database!.open()
        let isCreated = sharedInstanceMM.database!.executeUpdate("CREATE TABLE IF NOT EXISTS user(userNum INTEGER PRIMARY KEY, username TEXT, userImage TEXT, userMini TEXT, scoreR INTEGER, scoreF INTEGER, scoreC INTEGER, current INTEGER)", withArgumentsIn: [])
        sharedInstanceMM.database!.close()
        return isCreated
    }
    
    //se obtienen los datos que se quieren guardar en un nuevo usuario
    func addUser(userNum:Int, username:String, userImage:String, userMini:String, scoreR:Int, scoreF:Int, scoreC:Int, current:Int) -> Bool {
        sharedInstanceMM.database?.open()
        let isInserted = sharedInstanceMM.database!.executeUpdate("INSERT INTO user (userNum, username, userImage, userMini, scoreR, scoreF, scoreC, current) VALUES(?, ?, ?, ?, ?, ?, ?, ?)", withArgumentsIn: [userNum, username, userImage, userMini, scoreR, scoreF, scoreC, current])
        sharedInstanceMM.database!.close()
        return isInserted
    }
    
    //por medio de su llave primaria se encuentra el usuario buscado y se regresa el bojeto despues de establecer sus atributos
    func findUser(userNum:Int) -> User {
        let profile = User()
        sharedInstanceMM.database!.open()
        let resultSet = sharedInstanceMM.database!.executeQuery("SELECT * FROM user WHERE userNum=?", withArgumentsIn: [userNum])
        if resultSet != nil && (resultSet?.next())! {
            profile.userNum = userNum
            profile.username = String((resultSet?.string(forColumn: "username"))!)
            profile.userImage = String((resultSet?.string(forColumn: "userImage"))!)
            profile.userMini = String((resultSet?.string(forColumn: "userMini"))!)
            profile.scoreR = Int((resultSet?.int(forColumn: "scoreR"))!)
            profile.scoreF = Int((resultSet?.int(forColumn: "scoreF"))!)
            profile.scoreC = Int((resultSet?.int(forColumn: "scoreC"))!)
            profile.current = Int((resultSet?.int(forColumn: "current"))!)
        }
        sharedInstanceMM.database!.close()
        return profile
    }
    
    //se modifica el usuario de la llave primaria dada con la nueva informacion proporcionada
    func modifyUser(userNum:Int, username:String, userImage:String, userMini:String) -> Bool {
        sharedInstanceMM.database!.open()
        let isModified = sharedInstanceMM.database!.executeUpdate("UPDATE user SET username=?, userImage=?, userMini=? WHERE userNum=?", withArgumentsIn: [username,userImage,userMini,userNum])
        sharedInstanceMM.database!.close()
        return isModified
    }
    
    //se borra el usuario de la llave primaria proporcionada y se recorre la llave primaria de los otros usuarios
    func deleteUser(userNum:Int) {
        sharedInstanceMM.database!.open()
        let _ = sharedInstanceMM.database!.executeUpdate("DELETE FROM user WHERE userNum=?", withArgumentsIn: [userNum])
        if userNum == 1 {
            let _ = sharedInstanceMM.database!.executeUpdate("UPDATE user SET userNum=? WHERE userNum=?", withArgumentsIn: [1,2])
            let _ = sharedInstanceMM.database!.executeUpdate("UPDATE user SET userNum=? WHERE userNum=?", withArgumentsIn: [2,3])
        }
        else if userNum == 2 {
            let _ = sharedInstanceMM.database!.executeUpdate("UPDATE user SET userNum=? WHERE userNum=?", withArgumentsIn: [2,3])
        }
        sharedInstanceMM.database!.close()
    }
    
    //se calcula la cantidad de usuarios actuales en la base de datos y se regresa un entero
    func countUsers() -> Int {
        sharedInstanceMM.database!.open()
        var count = 0
        let counter = sharedInstanceMM.database!.executeQuery("SELECT COUNT(*) FROM user", withArgumentsIn: [])
        if counter != nil && (counter?.next())! {
            count = Int((counter?.int(forColumn: "COUNT(*)"))!)
        }
        sharedInstanceMM.database!.close()
        return count
    }
    
    //se busca el usuario que esta actualmente en sesion por medio de la columna "current" y se regresa el objeto con los atributos establecidos
    func findCurrentUSer() -> User {
        sharedInstanceMM.database!.open()
        let currentUser = User()
        let resultSet = sharedInstanceMM.database!.executeQuery("SELECT * FROM user WHERE current=?", withArgumentsIn: [1])
        if resultSet != nil && (resultSet?.next())! {
            currentUser.userNum = Int((resultSet?.int(forColumn: "userNum"))!)
            currentUser.username = String((resultSet?.string(forColumn: "username"))!)
            currentUser.userImage = String((resultSet?.string(forColumn: "userImage"))!)
            currentUser.userMini = String((resultSet?.string(forColumn: "userMini"))!)
            currentUser.scoreR = Int((resultSet?.int(forColumn: "scoreR"))!)
            currentUser.scoreF = Int((resultSet?.int(forColumn: "scoreF"))!)
            currentUser.scoreC = Int((resultSet?.int(forColumn: "scoreC"))!)
            currentUser.current = Int((resultSet?.int(forColumn: "current"))!)
        }
        sharedInstanceMM.database!.close()
        return currentUser
    }
    
    //se estalbece el usuario actual al cambiar la variable de la columna "current2 del usuario proporcionado
    func setCurrentUSer(userNum:Int) {
        sharedInstanceMM.database!.open()
        let _ = sharedInstanceMM.database!.executeUpdate("UPDATE user SET current=?", withArgumentsIn: [0])
        let _ = sharedInstanceMM.database!.executeUpdate("UPDATE user SET current=? WHERE userNum=?", withArgumentsIn: [1,userNum])
        sharedInstanceMM.database!.close()
    }
    
    // se modifica el puntaje almacenado del juego especificado en el usuario proporcionado
    func setCurrentScore(userNum:Int, newScore:Int, game:Int) {
        sharedInstanceMM.database!.open()
        if game == 0 {
            let _ = sharedInstanceMM.database!.executeUpdate("UPDATE user SET scoreR=? WHERE userNum=?", withArgumentsIn: [newScore, userNum])
        }
        else if game == 1 {
            let _ = sharedInstanceMM.database!.executeUpdate("UPDATE user SET scoreF=?WHERE userNum=?", withArgumentsIn: [newScore, userNum])
        }
        else if game == 2 {
            let _ = sharedInstanceMM.database!.executeUpdate("UPDATE user SET scoreC=?WHERE userNum=?", withArgumentsIn: [newScore, userNum])
        }
        sharedInstanceMM.database!.close()
        
    }
    
}
