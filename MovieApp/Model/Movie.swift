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
    var artwork: String
}

// MARK: - Movie Sample Data
var movies: [Movie] = [
    Movie(movieTitle: "Zhau zhurek myn bala", artwork: "Movie1"),
    Movie(movieTitle: "Kurmanzhan datka", artwork: "Movie2"),
    Movie(movieTitle: "Zemlya otcov", artwork: "Movie3"),
    Movie(movieTitle: "Aldar Kose", artwork: "Movie4"),
    Movie(movieTitle: "Shal", artwork: "Movie5"),
    Movie(movieTitle: "Amre", artwork: "Movie6")
]
