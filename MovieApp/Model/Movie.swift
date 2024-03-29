//
//  Movie.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.02.2023.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

// MARK: - Movie Data Model
struct Movie: Identifiable, Codable {
    @DocumentID var id: String?
    var movieTitle: String
    var imageName: String
    var genre: String
    var collection: [String]
    var description: String
    var cast: String
    var director: String
    var releaseDate: String
    var ageLimit: String
    var runtime: String
    var rating: Double?
    var ratingCount: Int
    var reviews: [Review]?
    var criticisms: [FilmCriticism]?
    var videoURL: String
    
    
    init(
        id: String = UUID().uuidString,
        movieTitle: String,
        imageName: String,
        genre: String,
        collection: [String],
        description: String,
        cast: String,
        director: String,
        releaseDate: String,
        ageLimit: String,
        runtime: String,
        rating: Double,
        ratingCount: Int,
        reviews: [Review]? = nil,
        criticisms: [FilmCriticism]? = nil,
        videoURL: String
    ) {
        self.id = id
        self.movieTitle = movieTitle
        self.imageName = imageName
        self.genre = genre
        self.collection = collection
        self.description = description
        self.cast = cast
        self.director = director
        self.releaseDate = releaseDate
        self.ageLimit = ageLimit
        self.runtime = runtime
        self.rating = rating
        self.ratingCount = ratingCount
        self.reviews = reviews
        self.criticisms = criticisms
        self.videoURL = videoURL
    }
}

// MARK: - Movie Sample Data
var movies: [Movie] = [
    Movie(movieTitle: "Zhau zhurek myn bala",
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
]

