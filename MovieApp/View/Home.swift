//
//  Home.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.02.2023.
//

import SwiftUI

struct Home: View {
// MARK: - Animated View Properties
    @State var currentIndex: Int = 0
    var body: some View {
        ZStack{
            //Background
            BGView()
        }
    }
    
    // MARK: - Blurred Background
    @ViewBuilder
    func BGView() -> some View{
        GeometryReader{ proxy in
            let size = proxy.size
            
            TabView(selection: $currentIndex) {
                ForEach(movies.indices, id: \.self) { index in
                    Image(movies[index].artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: size.width, height: size.height)
                        .clipped()
                        .tag(index)
                }
            }
            
            // MARK: - Custom Gradient
            
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
