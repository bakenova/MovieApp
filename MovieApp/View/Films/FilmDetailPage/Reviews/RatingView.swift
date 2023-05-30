//
//  RatingView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 10.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct RatingView: View {
    @ObservedObject private var viewModel = FilmDetailViewModel()
    @State private var userRating: Double = 0.0
    
    var film: Movie
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        GeometryReader{ proxy in
            VStack() {
                Text("Rate: " +
                     "\(film.movieTitle)")
                .font(.largeTitle.bold())
                .frame(width: proxy.size.width - 30, alignment: .leading)
                
                WebImage(url: URL(string: film.imageName))
                    .resizable()
                    .frame(width: 250, height: 350, alignment: .center)
                    .padding(.bottom, 20)
                
                Text("Your rating: ")
                    .frame(alignment: .leading)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                
                Text("\(userRating, specifier: "%.1f")")
                    .frame(alignment: .leading)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                
                Slider(value: $userRating, in: 0.0...10.0, step: 0.5)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                
                Button(action: {
                    viewModel.updateRating(for: film, newRating: userRating, collectionNames: film.collection )
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    ButtonView(title: "Rate", imageName: "star.circle.fill", color: .blue, cornerRadius: 25, width: proxy.size.width/2, height: 48, fontSize: 24)
                })
                .foregroundColor(.white)
                .padding()
                .disabled(userRating == 0.0)
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
                         collection: ["2010-2019"],
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
                                   reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                   reviewRate: "positive"),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                   reviewRate: "positive"),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                   reviewRate: "negative"),
                            Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                   reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                   reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                   reviewRate: "neutral")
                         ],
                         videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f")
        return VStack {
            RatingView( film: film).preferredColorScheme(.dark)
        }
    }
}
