//
//  Home.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.02.2023.
//

import SwiftUI

struct Home: View {
    // MARK: Animated View Properties
    @State var currentIndex: Int = 0
    
    //Environment values
    @Environment(\.colorScheme) var scheme
    var body: some View {
        ZStack{
            //Background
            BGView()
            //MARK: Main View COntent
            VStack{
                SnapCarousel(spacing: 20, trailingSpace: 110, index: $currentIndex, items: movies) { movie in
                    
                }
            }
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
            
            // Custom Gradient
            let color: Color = (scheme == .dark ? .black : .white)
            
            LinearGradient(colors: [
                .black,
                .clear,
                color.opacity(0.15),
                color.opacity(0.5),
                color.opacity(0.8),
                color,
                color
            ], startPoint: .top, endPoint: .bottom)
            
            // Blurred Overlay
            Rectangle()
                .fill(.ultraThinMaterial)
        }
        .ignoresSafeArea()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
            .preferredColorScheme(.dark)
    }
}
