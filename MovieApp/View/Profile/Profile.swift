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
    var body: some View {
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
            
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .fill(self.scheme == .dark ? .gray : .yellow.opacity(0.2))
                    .opacity(self.scheme == .dark ? 0.5 : 1)
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    Text("User Info")
                        .font(.largeTitle)
                        .fontWeight(.black)
                        .padding(.top, 30)
                        .padding(.horizontal, 30)
                    List{
                        ForEach((1...5), id: \.self) {
                                        Text("Row \($0)")
                                .listRowBackground(Color.gray.opacity(0))
                                    }
                    }
                    .background(.gray.opacity(0))
                    .scrollContentBackground(.hidden)
                    //.padding(.horizontal, 30)
                    .padding(.bottom, 30)
                }
            }
        }
    }
}

struct Comics_Previews: PreviewProvider {
    static var previews: some View {
        Profile()
            .preferredColorScheme(.light)
    }
}
