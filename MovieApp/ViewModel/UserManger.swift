//
//  UserManger.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 14.05.2023.
//

import Foundation
import SwiftUI
import SDWebImageSwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore

class UserManager: ObservableObject {
     
    @Published var errorMessage = ""
    @Published var user: User?
     
    init() {
        fetchCurrentUser()
    }
     
    private func fetchCurrentUser() {
 
        guard let uid = Auth.auth().currentUser?.uid else {
            self.errorMessage = "Could not find firebase uid"
            return
        }
         
         
        Firestore.firestore().collection("users").document(uid).getDocument { snapshot, error in
            if let error = error {
                self.errorMessage = "Failed to fetch current user: \(error)"
                print("Failed to fetch current user:", error)
                return
            }
             
            self.errorMessage = "123"
             
            guard let data = snapshot?.data() else {
                self.errorMessage = "No data found"
                return
                 
            }
            
            self.errorMessage = "Data: \(data.description)"
            let uid = data["uid"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let fName = data["fName"] as? String ?? ""
            let lName = data["lName"] as? String ?? ""
            let username = data["username"] as? String ?? ""
            let phoneNumber = data["phoneNumber"] as? String ?? ""
             
            self.user = User(uid: uid, username: username, email: email, firstName: fName, lastName: lName, phoneNumber: phoneNumber)
             
            //self.errorMessage = chatUser.profileImageUrl
             
        }
    }
}

