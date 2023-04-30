//
//  Movie.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.02.2023.
//

import SwiftUI

// MARK: - Movie Data Model
struct Movie: Identifiable {
    var id = UUID().uuidString
    var movieTitle: String
    var imageName: String
    var genre: String
    var description: String
    var cast: String
    var director: String
    var releaseDate: String
    var ageLimit: String
    var runtime: String
    var rating: Double
    var ratingCount: Int
    var videoURL: String
}

// MARK: - Movie Sample Data
var movies: [Movie] = [
    Movie(movieTitle: "Zhau zhurek myn bala", imageName: "Movie1", genre: "Drama, Adventure, War, Historical", description: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "2012", ageLimit: "16", runtime: "133", rating: 8.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f"),
    Movie(movieTitle: "Kurmanzhan datka", imageName: "Movie2", genre: "", description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "12", runtime: "1", rating: 8.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f"),
    Movie(movieTitle: "Zemlya otcov", imageName: "Movie3", genre: "", description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "21", runtime: "1", rating: 8.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f"),
    Movie(movieTitle: "Aldar Kose", imageName: "Movie4", genre: "", description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "12", runtime: "1", rating: 8.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f"),
    Movie(movieTitle: "Shal", imageName: "Movie5", genre: "", description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "18", runtime: "1", rating: 8.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f"),
    Movie(movieTitle: "Amre", imageName: "Movie6", genre: "", description: "", cast: "Asylkhan Tolepov, Ayan Utepbergen, Kuralai Anarbekova, Tlektes Meiramov, Aliya Anuarbek, Toleubek Aralbay, Eduard Ondar, Nurlan Alimzhanov, Dauren Sergazin, Artur Tolepov", director: "Akan Satayev", releaseDate: "", ageLimit: "16", runtime: "1", rating: 8.0, ratingCount: 7, videoURL: "https://www.kapwing.com/videos/644d19ef7288c4001879b98f")
]

var sampleDescription = "Here should be decription. Unfortunately, I could not care less"
