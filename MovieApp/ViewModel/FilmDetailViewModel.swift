//
//  FilmDetailViewModel.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 10.05.2023.
//

import Foundation

class FilmDetailViewModel: ObservableObject {
    @Published var film: Movie?
    @Published var reviews: [Review] = []
    @Published var userRating: Double = 0
    
    func fetchFilmDetails(for film: Movie) {
        // Asynchronous fetch
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            let filmDetails = film
            self.film = filmDetails
        }
    }
    
    func fetchReviews(for film: Movie) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.reviews = film.reviews ?? [Review(reviewTitle: "", reviewAuthor: User(uid: "", username: "", email: "", firstName: "", lastName: "", phoneNumber: ""), reviewDescription: "", reviewRate: "")] 
        }
    }
    
    func updateRating() {
        guard var film = film else { return }
        let rate = (Double(film.rating) * Double(film.ratingCount) + Double(userRating)) / (Double(film.ratingCount) + 1)
        print(film.rating)
        print(film.ratingCount)
        print(rate)
        film.rating = rate
        film.ratingCount = film.ratingCount + 1
        print(film.rating)
        print(film.ratingCount)
        self.film = film
        }
}
