//
//  LoginRegisterView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 15.05.2023.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseFirestore
 
struct LoginRegister: View {
     
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var fname = ""
    @State var lname = ""
    @State var phoneNumber = ""
     
    @State private var shouldShowLoginAlert: Bool = false
    @State private var shouldShowSignUpAlert: Bool = false
    @State var StatusMessage = ""
     
    @Binding var isUserCurrentlyLoggedOut : Bool
     
    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                 
                if !isLoginMode {
                    VStack {
                        Image("Logo")
                            .resizable()
                            //.frame(width: 300, height: 60, alignment: .center)
                            .aspectRatio(contentMode: .fill)
                            .padding(.top, 150)
                            .padding(.bottom, 70)
                    }
//                    .overlay(RoundedRectangle(cornerRadius: 64)
//                                .stroke(Color.black, lineWidth: 3)
//                    )
                    Group {
                        TextField("First Name", text: $fname)
                        TextField("Last Name", text: $lname)
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(15)
                     
                    Button {
                        handleAction()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Create Account")
                                .foregroundColor(.white)
                                .padding(.vertical, 15)
                                .font(.system(size: 18, weight: .semibold))
                            Spacer()
                        }.background(Color.black)
   
                    }
                    .cornerRadius(15)
                    .padding(.top)
                    .alert(isPresented: $shouldShowSignUpAlert) {
                        Alert(title: Text("Sign Up Failed"),
                              message: Text("Please, check text fields once more!"),
                              dismissButton: .default(Text("Close")))
                    }
                    
                    Button {
                        isLoginMode = true
                    } label: {
                        Text("Already have account? Sign In")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .underline()
                    }
                    .padding()

                    
                } else{
                    VStack {
                        Image("Logo")
                            .resizable()
                            //.frame(width: 300, height: 60, alignment: .center)
                            .aspectRatio(contentMode: .fill)
                            .padding(.top, 150)
                            .padding(.bottom, 70)
                    }
                     
                    Group {
                        TextField("Email", text: $email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                        SecureField("Password", text: $password)
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                     
                    Button {
                        loginUser()
                    } label: {
                        HStack {
                            Spacer()
                            Text("Sign In")
                                .foregroundColor(.white)
                                .padding(.vertical, 15)
                                .font(.system(size: 18, weight: .semibold))
                            Spacer()
                        }.background(Color.black)
   
                    }
                    .cornerRadius(15)
                    .padding(.top)
                    .alert(isPresented: $shouldShowLoginAlert) {
                        Alert(title: Text("Login Failed"),
                              message: Text("Email or Password are incorrect. Please, try again!"),
                              dismissButton: .default(Text("Close")))
                    }
                    
                    Button {
                        isLoginMode = false
                    } label: {
                        Text("Don't have an account yet? Sign Up")
                            .foregroundColor(.white)
                            .font(.system(size: 16, weight: .semibold))
                            .underline()
                    }
                    .padding()
                }
                 
                Text(self.StatusMessage)
                    .foregroundColor(Color.white)
                
                 
            }.padding()
        } //End ScrollView
        .navigationViewStyle(StackNavigationViewStyle()) 
        .background(Color.orange)
    }
     
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to login user:", err)
                //self.StatusMessage = "Failed to login user: \(err)"
                self.shouldShowLoginAlert = true
                return
            }
   
            print("Successfully logged in as user: \(result?.user.uid ?? "")")
   
            self.StatusMessage = "Successfully logged in as user: \(result?.user.uid ?? "")"
 
            self.isUserCurrentlyLoggedOut = true
        }
    }
     
    private func handleAction() {
        createNewAccount()
    }
      
    private func createNewAccount() {
        Auth.auth().createUser(withEmail: email, password: password) { result, err in
            if let err = err {
                print("Failed to create user:", err)
                //self.StatusMessage = "Failed to create user: \(err)"
                self.shouldShowSignUpAlert = true
                return
            }
             
            print("Successfully created user: \(result?.user.uid ?? "")")
   
            self.StatusMessage = "Successfully created user: \(result?.user.uid ?? "")"
             
            self.storeUserInformation()
            
            self.isUserCurrentlyLoggedOut = true
        }
    }
     
    private func storeUserInformation() {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let userData = ["fname": self.fname, "lname": self.lname, "email": self.email, "username": self.fname, "phoneNumber": self.phoneNumber, "uid": uid]
        Firestore.firestore().collection("users")
            .document(uid).setData(userData) { err in
                if let err = err {
                    print(err)
                    self.StatusMessage = "\(err)"
                    return
                }
  
                print("Success")
            }
    }
}
 
struct LoginRegister_Previews: PreviewProvider {
    @State static var isUserCurrentlyLoggedOut = false
    static var previews: some View {
        LoginRegister(isUserCurrentlyLoggedOut: $isUserCurrentlyLoggedOut)
    }
}
