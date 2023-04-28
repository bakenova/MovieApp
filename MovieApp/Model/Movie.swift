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
    var releaseDate: String
    var runtime: Int
}

// MARK: - Movie Sample Data
var movies: [Movie] = [
    Movie(movieTitle: "Zhau zhurek myn bala", imageName: "Movie1", genre: "", description: "", releaseDate: "", runtime: 1),
    Movie(movieTitle: "Kurmanzhan datka", imageName: "Movie2", genre: "", description: "", releaseDate: "", runtime: 1),
    Movie(movieTitle: "Zemlya otcov", imageName: "Movie3", genre: "", description: "", releaseDate: "", runtime: 1),
    Movie(movieTitle: "Aldar Kose", imageName: "Movie4", genre: "", description: "", releaseDate: "", runtime: 1),
    Movie(movieTitle: "Shal", imageName: "Movie5", genre: "", description: "", releaseDate: "", runtime: 1),
    Movie(movieTitle: "Amre", imageName: "Movie6", genre: "", description: "", releaseDate: "", runtime: 1)
]

var sampleDescription = "Here should be decription. Unfortunately, I could not care less"
