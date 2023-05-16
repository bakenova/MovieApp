//
//  User.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 14.05.2023.
//

import Foundation

struct User {
    var uid: String
    var username: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    var phoneNumber: String?
    
    init(uid: String, username: String?, email: String?, firstName: String?, lastName: String?, phoneNumber: String?) {
        self.uid = uid
        self.username = username
        self.email = email
        self.firstName = firstName
        self.lastName = lastName
        self.phoneNumber = phoneNumber
    }
    
}
