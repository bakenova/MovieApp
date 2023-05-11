//
//  ReviewList.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import SwiftUI

struct ReviewList: View {
    @ObservedObject var viewModel: FilmDetailViewModel
    @Environment(\.colorScheme) var scheme
    
    var film: Movie
    
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            ScrollView{
                VStack(spacing: 20){
                    NavigationLink {
                        NewReviewView()
                    } label: {
                        ButtonView(title: "Add review", imageName: "pencil.line", color: .orange, cornerRadius: 25, width: size.width/2, height: 48, fontSize: 18)
                    }
                    .foregroundColor(.white)
                    .padding()

                    ForEach(film.reviews!){ review in
                        NavigationLink(destination: ReviewView(review: review)) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.thinMaterial)
                                    .frame(width: size.width - 20,
                                           height: 150,
                                           alignment: .leading)
                                
                                VStack(alignment: .leading, spacing: 5){
                                    HStack(spacing: 8){
                                        Image(review.reviewAuthorImage)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 20, height: 20)
                                        Text(review.reviewAuthor)
                                            .bold()
                                            .font(.system(size: 16))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }
                                    .padding(.top, 10)
                                    .padding(.horizontal, 8)
                                    
                                    Text(review.reviewTitle)
                                        .lineLimit(1)
                                        .frame(width: size.width - 80)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundColor(.white)
                                        .padding(.top, 15)
                                        .padding(.horizontal, 8)
                                    Text(review.reviewDescription)
                                        .lineLimit(3)
                                        .frame(width: size.width - 80)
                                        .font(.system(size: 14, weight: .regular))
                                        .foregroundColor(.white)
                                        .multilineTextAlignment(.leading)
                                        .padding(.bottom, 10)
                                        .padding(.horizontal, 8)
                                }
                            }
                        }
                    }
                }
                .padding(.leading, 8)
            }
        }.navigationTitle(film.movieTitle)
            .onAppear {
                viewModel.fetchReviews(for: film)
            }
    }
}

struct ReviewList_Previews: PreviewProvider {
    static var previews: some View {
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
        
        let viewModel = FilmDetailViewModel()
        viewModel.reviews = film.reviews!
        return VStack {
            ReviewList(viewModel: viewModel, film: film).preferredColorScheme(.dark)
        }
    }
}
