//
//  RatingView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 10.05.2023.
//

import SwiftUI

struct RatingView: View {
    @ObservedObject var viewModel: FilmDetailViewModel
    var film: Movie
    @State private var newRating: Double = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader{ proxy in
            VStack() {
                Text("Rate: " +
                     "\(film.movieTitle)")
                .font(.largeTitle.bold())
                .frame(width: proxy.size.width - 30, alignment: .leading)
                
                Image(film.imageName)
                    .resizable()
                    .frame(width: 250, height: 350, alignment: .center)
                    .padding(.bottom, 20)
                
                Text("Your rating: ")
                    .frame(alignment: .leading)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                
                Text("\(viewModel.userRating == 0 ? newRating : viewModel.userRating,specifier: "%.1f")")
                    .frame(alignment: .leading)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                
                Slider(value: viewModel.userRating == 0 ? $newRating : $viewModel.userRating, in: 0...10, step: 1/2)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                
                Button(action: {
                    viewModel.userRating = newRating
                    viewModel.updateRating()
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    ButtonView(title: "Rate", imageName: "star.circle.fill", color: .orange, cornerRadius: 25, width: proxy.size.width/2, height: 48, fontSize: 24)
                })
                .foregroundColor(.white)
                .padding()
            }
            .padding()
            .padding(.vertical, 24)
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = FilmDetailViewModel()
        let film = Movie(movieTitle: "Zhau zhurek myn bala",
                         imageName: "Movie1",
                         genre: "Drama, Adventure, War, Historical",
                         description: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                         cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov",
                         director: "Akan Satayev",
                         releaseDate: "2012",
                         ageLimit: "16",
                         runtime: "133",
                         rating: 8.0,
                         ratingCount: 7,
                         reviews: [
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: "Arailym Bakenova",
                                   reviewAuthorImage: "user",
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom."),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: "Arailym Bakenova",
                                   reviewAuthorImage: "user",
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom."),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: "Arailym Bakenova",
                                   reviewAuthorImage: "user",
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom."),
                            Review(reviewTitle: "The first Kazakh movie I have ever watched...",
                                   reviewAuthor: "Ivan Ivanov",
                                   reviewAuthorImage: "user",
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.")
                         ],
                         videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f")
        return VStack {
            RatingView(viewModel: viewModel, film: film).preferredColorScheme(.dark)
        }
    }
}
