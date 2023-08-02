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
            let fName = data["fname"] as? String ?? ""
            let lName = data["lname"] as? String ?? ""
            let username = data["username"] as? String ?? ""
            let phoneNumber = data["phoneNumber"] as? String ?? ""
            
            self.user = User(uid: uid, username: username, email: email, firstName: fName, lastName: lName, phoneNumber: phoneNumber)
            
            //self.errorMessage = chatUser.profileImageUrl
            
        }
    }
    
    func updateUserInformation() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let userData = [
            "fname": self.user?.firstName ?? "",
            "lname": self.user?.lastName ?? "",
            "email": self.user?.email ?? "",
            "username": self.user?.username ?? "",
            "phoneNumber": self.user?.phoneNumber ?? ""
        ]
        
        Firestore.firestore().collection("users").document(uid).updateData(userData) { error in
            if let error = error {
                print("Failed to update user information:", error)
                self.errorMessage = "Failed to update user information: \(error.localizedDescription)"
            } else {
                print("User information updated successfully")
                self.errorMessage = "User information updated successfully"
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            // Clear user data
            self.user = nil
            self.errorMessage = ""
        } catch {
            self.errorMessage = "Failed to sign out: \(error.localizedDescription)"
            print("Failed to sign out:", error)
        }
    }
    
    
}

