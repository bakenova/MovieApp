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
            ZStack{
                //Background
                BGView()
                //MARK: Main View Content
                VStack{
                    ScrollView(.vertical, showsIndicators: false){
                        //NavBar
                        //NavBar(currentTab: self.$currentTab)
                        //Custum carousel
                        SnapCarousel(spacing: 20, trailingSpace: 150, index: $currentIndex, items: movies) { movie in
                            GeometryReader { proxy in
                                let size = proxy.size
                                Image(movie.artwork)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(15)
                                    .frame(width: size.width, height: size.height)
                                    .matchedGeometryEffect(id: movie.id, in: animation)
                                    .onLongPressGesture(perform: {
                                        currentCardSize = size
                                        detailMovie = movie
                                        withAnimation(.easeInOut){
                                            showDetailView = true
                                        }
                                    })
                            }
                        }
                        .padding(.top, 100)
                        .frame(width: UIScreen.main.bounds.size.width, height: 450)
                        
                        
                        //Custom indicator
                        customIndicator()
                        
                        customBlock(name: "Popular")
                        customBlock(name: "Recently published")
                    }
                }
                .overlay{
                    if let movie = detailMovie, showDetailView {
                        DetailPlotView(movie: movie, detailMovie: $detailMovie, showDetailView: $showDetailView, currentCardSize: $currentCardSize, animation: animation)
                    }
                }
            }.opacity(self.currentTab == "Films" ? 1 : 0)
            Music().opacity(self.currentTab == "Music" ? 1 : 0)
            Profile().opacity(self.currentTab == "Comics" ? 1 : 0)
        }
    }
    
    //MARK: - Custom Blocks
    @ViewBuilder
    func customBlock(name: String) -> some View{
        ZStack{
            Rectangle()
                .fill(.white)
                .opacity(self.scheme == .dark ? 0 : 1)
                .cornerRadius(15)
                .padding(.bottom, 30)
            
            VStack{
                HStack(){
                    Text(name)
                        .font(.title2.bold())
                    Spacer()
                    Button("See More"){}
                        .font(.system(size: 16, weight: .semibold))
                        //.foregroundColor(self.scheme == .dark ? .yellow : .purple)
                        .foregroundColor(.orange)
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 15){
                        ForEach(movies){ movie in
                            VStack(alignment: .leading){
                                Image(movie.artwork)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .cornerRadius(15)
                                    .frame(width: 100, height: 150)
                                Text(movie.movieTitle)
                                    .font(.system(size: 14, weight: .semibold))
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 100, height: 40, alignment: .topLeading)
                            }
                        }
                    }
                    .padding(.top, 0)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 40)
                }
            }
        }
    }
    
    //MARK: - Custom indicator
    @ViewBuilder
    func customIndicator() -> some View{
        HStack(spacing: 5){
            ForEach(movies.indices, id: \.self){ index in
                Rectangle()
                //.fill(currentIndex == index ? (self.scheme == .dark ? .yellow : .purple) : .gray.opacity(0.5))
                    .fill(currentIndex == index ? .orange : .gray.opacity(0.5))
                    .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
                    .cornerRadius(25)
                
            }
        }
        .animation(.easeInOut, value: currentIndex)
        .padding(.bottom, 20)
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

struct Films_Previews: PreviewProvider {
    static var previews: some View {
        Films()
            .preferredColorScheme(.light)
    }
}

