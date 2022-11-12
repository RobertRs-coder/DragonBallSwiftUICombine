//
//  RegisterModel.swift
//  DragonBallSwiftUICombine
//
//  Created by Roberto Rojo Sahuquillo on 12/11/22.
//

import Foundation

struct RegisterModel: Codable {
    var name: String
    var apell1: String
    var apell2: String
    var email: String
    var photo: String
    var bootcamp: String
    var password: String
    
    var validpassword: String
    
    init(){
        name = ""
        apell1 = ""
        apell2 = ""
        email = ""
        photo = ""
        bootcamp = ""
        password = ""
        validpassword = ""
    }
    
    func isValidPass() -> Bool {
        if password != validpassword || password.count > 6{
            return false
        }
        return true
    }
    
    func validateMail() -> Bool {
        //Regular expressions
        let emailRegEx =  "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func allDataIsSuccess() -> Bool {
        if (isValidPass() && name.count > 0 && apell1.count > 0 && apell2.count > 0 && validateMail() && photo.count > 0){
            return true
        }
        return false
    }
}
