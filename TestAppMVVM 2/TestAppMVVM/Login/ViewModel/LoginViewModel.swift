//
//  LoginViewModel.swift
//  TestAppMVVM
//
//  Created by Владимир on 21.03.2023.
//

import CoreData
import Foundation
import UIKit


class LoginViewModel {
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var models = [User]()
    
    private var nameArray = [String]()
    private var passwordArray = [String]()
    
    private let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    
    
    
    func validateUser(name: String, password: String) -> Bool{
        fetchRequest.returnsObjectsAsFaults = false
        
        
        do{
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                if let name = result.value(forKey: "name") as? String{
                    self.nameArray.append(name)
                }
                if let password = result.value(forKey: "password") as? String{
                    self.passwordArray.append(password)
                }
            }
        }
        catch{
            print("error")
        }
        
        if (nameArray.contains(name)){
            let name = nameArray.firstIndex(where: {$0 == name})
            
            if passwordArray[name!] == password {
                return true
            } else {
                return false
            }
        }
        
        return false
    }
    
}
