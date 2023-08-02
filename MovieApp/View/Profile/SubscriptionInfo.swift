//
//  SubscriptionInfo.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.04.2023.
//

import SwiftUI
import FirebaseAuth
struct SubscriptionInfo: View {
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    @ObservedObject private var vm = UserManager()
    
    @State private var password: String = "*******"
    let benefits: [String] = [
        "Availability of uploading and promoting your own product",
        "Unlimited ad-free movies, songs, and TV shows",
        "Affordable price for the unique platforms and their content",
        "Extensive range of national content that gets you acquainted with exclusively Kazakh media artworks"
    ]
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView{
                VStack(spacing: 20){
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray.opacity(0.15))
                        
                        VStack(alignment: .leading){
                            HStack(spacing: 16){
                                ZStack{
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.gray.opacity(0.3))
                                        .frame(width: 56, height: 56)
                                    Image("logoKorkem")
                                        .resizable()
                                        .frame(width: 32, height: 32, alignment: .leading)
                                }
                                
                                Text("Korkem Premium")
                                    .font(.title2)
                                    .fontWeight(.black)
                                    .foregroundColor(.primary)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 20)
                            
                            RoundedRectangle(cornerRadius: 1)
                                .fill(.gray.opacity(0.3))
                                .frame(height: 1)
                                .padding(.top, 10)
                            
                            Text("You are currently on your free trial!")
                                .font(.headline)
                                .foregroundColor(.gray)
                                .padding(.vertical, 16)
                                .padding(.horizontal, 20)
                            
                            VStack(alignment: .leading){
                                Text("Membership")
                                    .font(.title2.bold())
                                
                                HStack(spacing: 8){
                                    Image("user")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 20, height: 20)
                                    
                                    Text(vm.user?.email ?? "arailym@gmail.com")
                                        .bold()
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                    
                                    Spacer()
                                }
                                .padding(.vertical, 10)
                                
                                HStack(spacing: 8){
                                    Text("Phone number:")
                                    Text(vm.user?.phoneNumber ?? "77015518647")
                                        .bold()
                                        .font(.system(size: 16))
                                        .fontWeight(.bold)
                                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                                }
                                
                                HStack(spacing: 8){
                                    Text("Password:")
                                    Text(password)
                                }
                                .padding(.vertical, 10)
                            }
                            .padding(.horizontal, 20)
                            
                            RoundedRectangle(cornerRadius: 1)
                                .fill(.gray.opacity(0.3))
                                .frame(height: 1)
                                .padding(.top, 10)
                            
                            VStack(alignment: .leading){
                                Text("Billing Details")
                                    .font(.title2.bold())
                                
                                Text("You have not chosen your payment method yet. The next billing fee is equal to 550 tenge.")
                                    .font(.headline)
                                    .foregroundColor(.gray)
                                    .padding(.top, 10)
                            }
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            
                            Spacer()
                        }
                        .padding(.vertical, 30)
                    }
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.gray.opacity(0.15))
                        
                        VStack(alignment: .leading){
                            Text("Subscription Benefits")
                                .font(.title2.bold())
                            
                            RoundedRectangle(cornerRadius: 1)
                                .fill(.gray.opacity(0.3))
                                .frame(height: 1)
                                .padding(.top, 10)
                            
                            ForEach(benefits, id: \.self) { benefit in
                                HStack(alignment: .center) {
                                    Image(systemName: "checkmark")
                                        .foregroundColor(.blue)
                                        .font(.system(size: 16))
                                    
                                    Text(benefit)
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                }
                                .padding(.vertical, 10)
                            }
                        }
                        .padding(.vertical, 30)
                        .padding(.horizontal, 20)
                    }
                }
                .padding(.horizontal, 24)
            }
            .scrollIndicators(.hidden)
            .onAppear{
                fetchPassword()
            }
        }
    }
    
    private func fetchPassword() {
        guard let currentUser = Auth.auth().currentUser else {
            print("No logged-in user")
            return
        }
        
        currentUser.getIDTokenResult { result, error in
            if let error = error {
                print("Failed to fetch ID token: \(error.localizedDescription)")
                return
            }
            
            if let claims = result?.claims,
               let passwordClaim = claims["password"] as? String {
                self.password = passwordClaim
            } else {
                print("Password claim not found")
            }
        }
    }
}

struct SubscriptionInfo_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionInfo().preferredColorScheme(.dark)
    }
}
