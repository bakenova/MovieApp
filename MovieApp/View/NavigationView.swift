//
//  NavigationView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.02.2023.
//

import SwiftUI

struct NavBar: View{
    @Namespace var animation
    @Binding var currentTab: String
    @Environment(\.colorScheme) var scheme
    
    var body: some View{
        HStack(spacing: 10){
            Button{
                withAnimation(.easeIn){
                    
                }
            } label: {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //.cornerRadius(15)
                    .frame(width: 15, height: 15)
                    .background{
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .frame(width: 40, height: 40)
                            .environment(\.colorScheme, .dark)
                    }
            }
            .tint(.yellow)
            .padding(.horizontal)
            
            Spacer()
            
            ForEach(["Films", "Music"], id: \.self) { tab in
                Button{
                    withAnimation(.easeIn){
                        currentTab = tab
                    }
                } label: {
                    Text(tab)
                        .foregroundColor(self.scheme == .light ? .black : .white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 25)
                        .background{
                            if currentTab == tab {
                                Capsule()
                                    .fill(.ultraThinMaterial)
                                    .frame(width: 100)
                                    .environment(\.colorScheme, .dark)
                                    .matchedGeometryEffect(id: "tab", in: animation)
                            }
                        }
                }
            }
            
            Spacer()
            
            Button{
                withAnimation(.easeIn){
                    
                }
            } label: {
                Image(systemName: "person")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                //.cornerRadius(15)
                    .frame(width: 15, height: 15)
                    .background{
                        Capsule()
                            .fill(.ultraThinMaterial)
                            .frame(width: 40, height: 40)
                            .environment(\.colorScheme, .dark)
                    }
            }
            .tint(.yellow)
            .padding(.horizontal)
            
        }
        .padding(.top, 10)
        .padding(.bottom, 10)
        .padding(.horizontal)
    }
}

