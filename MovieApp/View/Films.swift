//
//  Home.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.02.2023.
//

import SwiftUI

struct Films: View {
    // MARK: Animated View Properties
    @State var currentIndex: Int = 0
    @State var currentTab: String = "Films"
    
    //MARK: Detail View Properties
    @State var detailMovie: Movie?
    @State var showDetailView: Bool = false
    @State var currentCardSize: CGSize = .zero
    
    //Environment values
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    var body: some View {
        ZStack{
            //Background
            BGView()
            //MARK: Main View COntent
            VStack{
                //NavBar
                NavBar()
                ScrollView(.vertical, showsIndicators: false){
                    //Custum carousel
                    SnapCarousel(spacing: 20, trailingSpace: 110, index: $currentIndex, items: movies) { movie in
                        GeometryReader { proxy in
                            let size = proxy.size
                            Image(movie.artwork)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                            //.frame(width: size.width, height: size.height)
                                .cornerRadius(15)
                                .matchedGeometryEffect(id: movie.id, in: animation)
                                .onTapGesture {
                                    currentCardSize = size
                                    detailMovie = movie
                                    withAnimation(.easeInOut){
                                        showDetailView = true
                                    }
                                }
                        }
                    }
                    .padding(.top, 70)
                    .frame(width: UIScreen.main.bounds.size.width, height: 450)
                    
                    
                    //Custom indicator
                    customIndicator()
                    
                    customBlock(name: "Popular")
                    customBlock(name: "Recently published")
                }
            }
            .overlay{
                if let movie = detailMovie, showDetailView {
                     DetailMovieView(movie: movie, detailMovie: $detailMovie, showDetailView: $showDetailView, currentCardSize: $currentCardSize, animation: animation)
                }
            }
        }
    }
    
    //MARK: - Custom Blocks
    @ViewBuilder
    func customBlock(name: String) -> some View{
        HStack(){
            Text(name)
                .font(.title3.bold())
            Spacer()
            Button("See More"){}
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.yellow)
        }
        .padding(.top, 30)
        .padding(.horizontal, 20)
        
        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 15){
                ForEach(movies){ movie in
                    Image(movie.artwork)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(15)
                        .frame(width: 100, height: 150)
                }
            }
            .padding(.top, 0)
            .padding(.horizontal, 20)
        }
    }
    
    //MARK: - Custom indicator
    @ViewBuilder
    func customIndicator() -> some View{
        HStack(spacing: 5){
            ForEach(movies.indices, id: \.self){ index in
                Rectangle()
                    .fill(currentIndex == index ? .yellow : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
                    .cornerRadius(25)
            }
        }
        .animation(.easeInOut, value: currentIndex)
    }
    
    //MARK: - Custom Navigation Bar
    @ViewBuilder
    func NavBar()-> some View{
        HStack(spacing: 0){
            ForEach(["Films", "Music", "Comics"], id: \.self) { tab in
                Button{
                    withAnimation{
                        currentTab = tab
                    }
                } label: {
                    Text(tab)
                        .foregroundColor(.white)
                        .padding(.vertical, 6)
                        .padding(.horizontal, 20)
                        .background{
                            if currentTab == tab{
                                Capsule()
                                    .fill(.ultraThinMaterial)
                                    .environment(\.colorScheme, .dark)
                                    .matchedGeometryEffect(id: "tab", in: animation)
                            }
                        }
                }
            }
        }
        .padding()
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
            .tabViewStyle(.page(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentIndex)
            
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
        Films()
            .preferredColorScheme(.dark)
    }
}
