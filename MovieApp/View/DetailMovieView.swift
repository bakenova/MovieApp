//
//  DetailMovieView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.02.2023.
//

import SwiftUI

struct DetailMovieView: View {
    
    var movie: Movie
    @Binding var detailMovie: Movie?
    @Binding var showDetailView: Bool
    @Binding var currentCardSize: CGSize
    
    var animation: Namespace.ID
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                Image(movie.artwork)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: currentCardSize.width / 1.2, height: currentCardSize.height / 1.2, alignment: .center)
                    .cornerRadius(15)
                    .matchedGeometryEffect(id: movie.id, in: animation)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background{
            Rectangle()
                .fill(.ultraThinMaterial)
                .ignoresSafeArea()
        }
    }
}

struct DetailMovieView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
    }
}
