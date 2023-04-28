//
//  FilmDetails.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 29.04.2023.
//

import SwiftUI

struct FilmDetails: View {
    
    var film: Movie
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            ZStack{
                Image(film.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(15)
                    .frame(width: size.width, height: size.height)
                    .ignoresSafeArea()
                
                VisualEffectView(effect: UIBlurEffect(style: .dark))
                    .ignoresSafeArea()
                
                VStack(alignment: .center, spacing: 20) {
                    Image(film.imageName)
                        .resizable()
                        .cornerRadius(15)
                        .aspectRatio(contentMode: .fit)
                        .frame(width: size.width/2, height: size.height/2)
                        .ignoresSafeArea()
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text(film.movieTitle)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        
                        Text(film.genre)
                            .font(.headline)
                            .foregroundColor(.gray)
                        
                        Text(film.description)
                            .font(.body)
                        
                        HStack {
                            Text("Release Date:")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text(film.releaseDate)
                                .font(.caption)
                        }
                        
                        HStack {
                            Text("Runtime:")
                                .font(.caption)
                                .foregroundColor(.gray)
                            
                            Text("\(film.runtime) mins")
                                .font(.caption)
                        }
                        
                        Spacer()
                    }
                    .padding()
                }
                .toolbarBackground(.hidden, for: .navigationBar)
            }
        }
    }
}

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct FilmDetails_Previews: PreviewProvider {
    static var previews: some View {
        let film = Movie(movieTitle: "Zhau zhurek myn bala", imageName: "Movie1", genre: "", description: "", releaseDate: "", runtime: 1)
        FilmDetails(film: film).preferredColorScheme(.dark)
    }
}
