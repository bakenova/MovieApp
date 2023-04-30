//
//  Comics.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.02.2023.
//

import SwiftUI

struct Profile: View {
    @State var currentTab: String = "Comics"
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    
    var profileSettings: [String] = ["My Account","Subscription Info", "Payment Info", "Dark mode", "Delete Account"]
    
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    ZStack{
                        Circle()
                            .fill(.purple)
                            .frame(width: 145, height: 145)
                        Circle()
                            .fill(self.scheme == .dark ? .black : .white)
                            .frame(width: 140, height: 140)
                        Image("user")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 128, height: 128)
                    }
                    .padding()
                    
                    Text("Arailym")
                        .font(.title2)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .padding(.bottom, 5)
                    
                    Text(verbatim: "arailym.bakenovaa@gmail.com")
                        .font(.body)
                        .foregroundColor(.gray)
                    
                }.padding()
                
                ZStack(){
                    RoundedRectangle(cornerRadius: 25)
                        .fill(self.scheme == .dark ? .gray : .yellow.opacity(0.2))
                        .opacity(self.scheme == .dark ? 0.5 : 1)
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading){
                        Text("User Info")
                            .font(.largeTitle)
                            .fontWeight(.black)
                            .padding(.top, 30)
                            .padding(.bottom, 5)
                            .padding(.horizontal, 30)
                        
                        List{
                            NavigationLink(destination: MyAccount(), label: {
                                Text("My Account")
                                    .padding(.vertical, 5)
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.primary)
                                EmptyView()
                            })
                            .listRowBackground(Color.gray.opacity(0))
                            
                            NavigationLink(destination: SubscriptionInfo(), label: {
                                Text("Subscription Info")
                                    .padding(.vertical, 5)
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.primary)
                                
                                EmptyView()
                            })
                            .listRowBackground(Color.gray.opacity(0))
                            
                            NavigationLink(destination: PaymentInfo(), label: {
                                Text("Payment Info")
                                    .padding(.vertical, 5)
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.primary)
                                EmptyView()
                            })
                            .listRowBackground(Color.gray.opacity(0))
                            
                            NavigationLink(destination: DeleteAccount(), label: {
                                Text("Delete Account")
                                    .padding(.vertical, 5)
                                    .font(.system(size: 20, weight: .medium))
                                    .foregroundColor(.primary)
                                EmptyView()
                            })
                            .listRowBackground(Color.gray.opacity(0))
                        }
                        .listStyle(PlainListStyle())
                        .background(.gray.opacity(0))
                        .scrollContentBackground(.hidden)
                        .scrollDisabled(true)
                        .padding(.vertical, 0)
                        .padding(.horizontal, 16)
                        
                        ButtonView(title: "Sign Out", imageName: "door.left.hand.open", color: Color(.systemOrange), cornerRadius: 15, width: 280, height: 60, fontSize: 24)
                            .padding(.leading, 50)
                            .padding(.vertical, 30)
                    }
                }
            }
        }
        .toolbarBackground(.hidden, for: .navigationBar)
    }
}

struct Comics_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
            .preferredColorScheme(.dark)
    }
}

