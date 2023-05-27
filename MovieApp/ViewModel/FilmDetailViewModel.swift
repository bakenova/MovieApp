//
//  FilmDetailViewModel.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 10.05.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class FilmDetailViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private var db = Firestore.firestore()
    
    @Published var popularFilms: [Movie] = []
    @Published var classicFilms: [Movie] = []
    @Published var films2010: [Movie] = []
    
    @Published var film: Movie?
    @Published var reviews: [Review] = []
    @Published var userRating: Double = 0
    
    
    
    func addMovie(
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
        reviews: [Review],
        criticisms: [FilmCriticism],
        videoURL: String
    ) {
        let movie = Movie(
            movieTitle: movieTitle,
            imageName: imageName,
            genre: genre,
            collection: collection,
            description: description,
            cast: cast,
            director: director,
            releaseDate: releaseDate,
            ageLimit: ageLimit,
            runtime: runtime,
            rating: rating,
            ratingCount: ratingCount,
            reviews: reviews,
            criticisms: criticisms,
            videoURL: videoURL
        )
        
        // Add the movie to each collection
        for collectionName in collection {
            let collectionRef = db.collection("movies").document(collectionName).collection("films")
            
            do {
                _ = try collectionRef.addDocument(from: movie) { error in
                    if let error = error {
                        print("Error adding movie to \(collectionName): \(error.localizedDescription)")
                    } else {
                        print("Movie added successfully to \(collectionName)")
                    }
                }
            } catch {
                print("Error encoding movie: \(error.localizedDescription)")
            }
        }
    }
    
    func fetchMovies() {
            for collectionName in ["Classic", "Popular", "2010-2019"] {
                let collectionRef = db.collection("movies").document(collectionName).collection("films")

                collectionRef.getDocuments { snapshot, error in
                    if let error = error {
                        print("Error fetching movies from \(collectionName): \(error.localizedDescription)")
                        return
                    }

                    guard let documents = snapshot?.documents else {
                        print("No documents found in \(collectionName) collection")
                        return
                    }

                    let fetchedMovies = documents.compactMap { document -> Movie? in
                        try? document.data(as: Movie.self)
                    }

                    DispatchQueue.main.async {
                        switch collectionName {
                        case "Classic":
                            self.classicFilms = fetchedMovies
                        case "Popular":
                            self.popularFilms = fetchedMovies
                        case "2010-2019":
                            self.films2010 = fetchedMovies
                        default:
                            break
                        }
                    }
                }
            }
        }
    
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
    
    func fetchCriticisms(for film: Movie) {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.film?.criticisms = film.criticisms ?? [FilmCriticism(criticismTitle: "", criticismAuthor: User(uid: "", username: "", email: "", firstName: "", lastName: "", phoneNumber: ""), criticismDescription: "", actorRate: 0, directingRate: 0, soundRate: 0, scriptRate: 0)]
        }
    }
    
    func updateRating(for movie: Movie, newRating: Double, collectionNames: [String]) {
        guard let movieID = movie.id else {
            return
        }
        
        for collectionName in collectionNames {
            let movieRef = db.collection("movies").document(collectionName).collection("films").document(movieID)
            
            // Check if user has already rated the movie
            if let userRating = movie.rating {
                if newRating != userRating {
                    // Update rating count (number of people who rated the movie)
                    movieRef.updateData([
                        "rating": FieldValue.increment(newRating - userRating),
                        "ratingCount": FieldValue.increment(Int64(0))
                    ]) { error in
                        if let error = error {
                            print("Error updating rating in \(collectionName): \(error.localizedDescription)")
                        } else {
                            print("Rating updated successfully in \(collectionName)")
                        }
                    }
                }
            } else {
                // Update rating count and set user's rating
                movieRef.updateData([
                    "rating": FieldValue.increment(newRating),
                    "ratingCount": FieldValue.increment(Int64(1))
                ]) { error in
                    if let error = error {
                        print("Error updating rating in \(collectionName): \(error.localizedDescription)")
                    } else {
                        print("Rating updated successfully in \(collectionName)")
                    }
                }
            }
        }
    }
    
}
