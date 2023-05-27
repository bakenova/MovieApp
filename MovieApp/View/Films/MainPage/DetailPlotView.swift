//
//  DetailMovieView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.02.2023.
//

import SwiftUI

struct DetailPlotView: View {
    
    var movie: Movie
    @Binding var detailMovie: Movie?
    @Binding var showDetailView: Bool
    @Binding var currentCardSize: CGSize
    
    var animation: Namespace.ID
    
    @StateObject var viewModel = FilmDetailViewModel()
    @State var showDetailViewContent: Bool = false
    @State var offset: CGFloat = 0
    
    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    Image(movie.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: currentCardSize.width, height: currentCardSize.height, alignment: .center)
                        .cornerRadius(15)
                        .matchedGeometryEffect(id: movie.id, in: animation)
                    
                    VStack(spacing: 15){
                        Text("Story Plot")
                            .font(.largeTitle)
                            .fontWeight(.semibold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top, 24)
                        Text(movie.description)
                            .multilineTextAlignment(.leading)
                        
                        NavigationLink(destination: FilmDetails(viewModel: viewModel, film: movie)) {
                            Text("Learn More")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity)
                                .padding(.vertical)
                                .background{
                                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                                        .fill(.blue)
                                }
                        }
                        .padding(.top, 20)
                    }
                    .opacity(showDetailViewContent ? 1 : 0)
                    .offset(y: showDetailViewContent ? 1 : 0)
                }
                .padding()
                .modifier(OffsetModifier(offset: $offset))
            }
            .coordinateSpace(name: "SCROLL")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background{
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .ignoresSafeArea()
            }
            .onAppear{
                withAnimation(.easeIn){
                    showDetailViewContent = true
                }
            }
            .onChange(of: offset) { newValue in
                if newValue > 120 {
                    withAnimation(.easeInOut){
                        showDetailViewContent = false
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                        withAnimation(.easeInOut){
                            showDetailView = false
                        }
                    }
                }
            }
        }
    }
}

struct DetailPlotView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
