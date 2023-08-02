//
//  FilmListView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 11.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct FilmListView: View {
    //Environment values
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    
    @StateObject var viewModel = FilmDetailViewModel()
    
    @State var films: [Movie]
    
    var body: some View {
        ScrollView(){
            VStack(alignment: .leading){
            ForEach(films) { item in
                NavigationLink {
                    FilmDetails(film: item, collectionName: "General")
                } label: {
                    HStack {
                        WebImage(url: URL(string: item.imageName))
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 150)
                        
                        VStack(alignment: .leading){
                            
                            Text(item.movieTitle)
                                .frame(alignment: .leading)
                                .font(.title2)
                                .fontWeight(.medium)
                            
                            Text(item.releaseDate)
                                .frame(alignment: .leading)
                                .font(.system(size: 14))
                                .fontWeight(.medium)
                                .foregroundColor(.gray)
                            
                            Text("Watch now")
                                .frame(alignment: .leading)
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(.blue)
                                .padding(.top, 10)
                        }
                    }
                    .padding(.vertical, 10)
                }
                }
            }
        }
        .scrollIndicators(.hidden)
        .onAppear{
            viewModel.fetchMovies()
            print("Hi there", films)
        }
    }
}

struct FilmListView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView(films: [Movie(movieTitle: "Zhau zhurek myn bala",
                                   imageName: "https://dl.dropboxusercontent.com/s/2eoksv0ce60bv5l/Movie1.jpg",
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
                                            reviewAuthor:
                                             User(uid: "",
                                                  username: "kairatov",
                                                  email: "kairatovk@mail.ru",
                                                  firstName: "Kairat",
                                                  lastName: "Kairatov",
                                                  phoneNumber: "77777777777"),
                                            reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                            reviewRate: "positive"),
                                     Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                            reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                            reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                            reviewRate: "neutral"),
                                     Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                            reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                            reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                            reviewRate: "negative"),
                                     Review(reviewTitle: "The best work of Akyn Satayev I have ever seen!",
                                            reviewAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"),
                                            reviewDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.",
                                            reviewRate: "neutral")
                                   ],
                                   criticisms: [
                                     FilmCriticism(criticismTitle: "The title example", criticismAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"), criticismDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.", actorRate: 4, directingRate: 5, soundRate: 6, scriptRate: 7, approved: true),
                                     FilmCriticism(criticismTitle: "The title example", criticismAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"), criticismDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.", actorRate: 4, directingRate: 5, soundRate: 6, scriptRate: 7, approved: false)
                                   ],
                                   videoURL: "https://www.dropbox.com/s/60ogynxyne5eyig/ZXhATkf7.mp4?raw=1"),
                             Movie(movieTitle: "Kurmanzhan datka", imageName: "https://dl.dropboxusercontent.com/s/2eoksv0ce60bv5l/Movie1.jpg", genre: "", collection: [""], description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "12", runtime: "1", rating: 5.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f"),
                             Movie(movieTitle: "Zemlya otcov", imageName: "https://dl.dropboxusercontent.com/s/2eoksv0ce60bv5l/Movie1.jpg", genre: "", collection: [""], description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "21", runtime: "1", rating: 9.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f"),
                             Movie(movieTitle: "Aldar Kose", imageName: "https://dl.dropboxusercontent.com/s/2eoksv0ce60bv5l/Movie1.jpg", genre: "", collection: [""], description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "12", runtime: "1", rating: 2.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f"),
                             Movie(movieTitle: "Shal", imageName: "https://dl.dropboxusercontent.com/s/2eoksv0ce60bv5l/Movie1.jpg", genre: "", collection: [""], description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "18", runtime: "1", rating: 4.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f"),
                             Movie(movieTitle: "Amre", imageName: "https://dl.dropboxusercontent.com/s/2eoksv0ce60bv5l/Movie1.jpg", genre: "", collection: [""], description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "16", runtime: "1", rating: 7.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f")
])
    }
}



