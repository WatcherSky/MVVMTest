//
//  SignInViewModel.swift
//  TestAppMVVM
//
//  Created by Владимир on 16.03.2023.
//

import CoreData
import Foundation
import UIKit

class SignInViewModel {
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var models = [User]()
    
    var nameArray = [String]()
    var passwordArray = [String]()
    
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
    
    
    
    func createItem(name: String, password: String) -> Bool{
        fetchRequest.returnsObjectsAsFaults = false
        
        
        do{
            let results = try context.fetch(fetchRequest)
            
            for result in results as! [NSManagedObject]{
                if let mail = result.value(forKey: "name") as? String{
                    self.nameArray.append(mail)
                }
            }
        }
        catch{
            print("error")
        }
        
        if nameArray.contains(name) {
            return false
        }
        
        let newItem = User(context: context)
        newItem.name = name
        newItem.password = password
        
        do {
            try context.save()
        } catch  {
            
        }
        return true
    }
    
    func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
