//
//  MyAccount.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 27.04.2023.
//

import SwiftUI

struct MyAccount: View {
    @Environment(\.colorScheme) var scheme
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    
    @State private var selectedMode: AppearanceMode?
    @ObservedObject private var vm = UserManager()
    
    enum AppearanceMode {
        case system, dark, light
    }
    
    var body: some View {
        GeometryReader { proxy in
            Form {
                Section(header: Text("Personal Information").foregroundColor(self.scheme == .dark ? .white : .black)) {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                    TextField("Email", text: $email)
                    TextField("Phone Number", text: $phoneNumber)
                }
                
                Section(header: Text("Confidential information").foregroundColor(self.scheme == .dark ? .white : .black)) {
                    NavigationLink(destination: PasswordView()) {
                        Text("Password")
                            .font(.headline)
                            .padding(2)
                    }
                }
                
                Section(header: Text("Appearance").foregroundColor(self.scheme == .dark ? .white : .black)) {
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(selectedMode == .system ? Color.blue : (self.scheme == .dark ? .clear : .white))
                                .frame(width: proxy.size.width/3, height: 100, alignment: .leading)
                            Text("System")
                                .foregroundColor(selectedMode == .system ? .white : (self.scheme == .dark ? .white : .black))
                                .onTapGesture {
                                    self.selectedMode = .system
                                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .unspecified
                                }
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(selectedMode == .dark ? Color.blue : (self.scheme == .dark ? .blue : .white))
                                .frame(width: proxy.size.width/3 - 50, height: 100, alignment: .leading)
                            Text("Dark")
                                .foregroundColor(self.scheme == .dark ? .white : .black)
                                .onTapGesture {
                                    self.selectedMode = .dark
                                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
                                }
                        }
                        
                        ZStack{
                            RoundedRectangle(cornerRadius: 10)
                                .fill(selectedMode == .light ? Color.blue : (self.scheme == .dark ? .clear : .white))
                                .frame(width: proxy.size.width/3 - 50, height: 100, alignment: .leading)
                            Text("Light")
                                .foregroundColor(selectedMode == .light ? .white : (self.scheme == .dark ? .white : .black))
                                .onTapGesture {
                                    self.selectedMode = .light
                                    UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
                                }
                        }
                    }
                }
            }
            .onReceive(vm.$user) { user in
                if let user = user {
                    firstName = user.firstName ?? ""
                    lastName = user.lastName ?? ""
                    email = user.email ?? ""
                    phoneNumber = user.phoneNumber ?? ""
                }
            }
        }
    }
}

struct MyAccount_Previews: PreviewProvider {
    static var previews: some View {
        MyAccount()
    }
}

