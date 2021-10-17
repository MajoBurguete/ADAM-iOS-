//
//  ModelManager.swift
//  ADAM
//
//  Created by Daniela Hernández on 16/10/21.
//

import Foundation

let sharedInstanceMM = ModelManager()

class ModelManager: NSObject {
    var database: FMDatabase?
    
    class var instance: ModelManager {
        let documentsFolder = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let path = documentsFolder.appending("UserDB.sqlite")
        sharedInstanceMM.database = FMDatabase(path: path)
        return sharedInstanceMM
    }
    
    func createDatabase() -> Bool {
        sharedInstanceMM.database!.open()
        let isCreated = sharedInstanceMM.database!.executeUpdate("CREATE TABLE IF NOT EXISTS user(userNum INTEGER PRIMARY KEY, username TEXT, userImage TEXT, userMini TEXT, scoreR INTEGER, scoreF INTEGER, scoreC INTEGER)", withArgumentsIn: [])
        sharedInstanceMM.database!.close()
        return isCreated
    }
    
    func addUser(userNum:Int, username:String, userImage:String, userMini:String, scoreR:Int, scoreF:Int, scoreC:Int) -> Bool {
        sharedInstanceMM.database?.open()
        let isInserted = sharedInstanceMM.database!.executeUpdate("INSERT INTO user (userNum, username, userImage, userMini, scoreR, scoreF, scoreC) VALUES(?, ?, ?, ?, ?, ?, ?)", withArgumentsIn: [userNum, username, userImage, userMini, scoreR, scoreF, scoreC])
        sharedInstanceMM.database!.close()
        return isInserted
    }
    
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
        }
        sharedInstanceMM.database!.close()
        return profile
    }
    
    func deleteUser(userNum:Int) -> Bool {
        sharedInstanceMM.database!.open()
        let isDeleted = sharedInstanceMM.database!.executeUpdate("DELETE FROM user WHERE userNum=?", withArgumentsIn: [userNum])
        sharedInstanceMM.database!.close()
        return isDeleted
    }
}
