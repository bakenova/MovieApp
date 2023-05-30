//
//  FilmDetailViewModel.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 10.05.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import SwiftUI

class FilmDetailViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    private var db = Firestore.firestore()
    
    @Published var popularFilms: [Movie] = []
    @Published var classicFilms: [Movie] = []
    @Published var films2010: [Movie] = []
    @Published var generalList: [Movie] = []
    @Published var actionFilms: [Movie] = []
    @Published var thrillerFilms: [Movie] = []
    @Published var comedyFilms: [Movie] = []
    @Published var recommendations: [Movie] = []
    @Published var festivalFilms: [Movie] = []
    
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
        for collectionName in ["Classic", "Popular", "2010-2019", "General", "Action", "Thriller", "Comedy", "Recommendation", "Festival"] {
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
                    case "General":
                        self.generalList = fetchedMovies
                    case "Action":
                        self.actionFilms = fetchedMovies
                    case "Thriller":
                        self.thrillerFilms = fetchedMovies
                    case "Comedy":
                        self.comedyFilms = fetchedMovies
                    case "Recommendation":
                        self.recommendations = fetchedMovies
                    case "Festival":
                        self.festivalFilms = fetchedMovies
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
            self.film?.criticisms = film.criticisms ?? [FilmCriticism(criticismTitle: "", criticismAuthor: User(uid: "", username: "", email: "", firstName: "", lastName: "", phoneNumber: ""), criticismDescription: "", actorRate: 0, directingRate: 0, soundRate: 0, scriptRate: 0, approved: false)]
        }
    }
    
    func updateRating(for movie: Movie, newRating: Double, collectionNames: [String]) {
        guard let movieID = movie.id else {
            return
        }
        
        for collectionName in collectionNames {
            let movieRef = db.collection("movies").document(collectionName).collection("films").document(movieID)
            
            // Check if the movie document exists
            movieRef.getDocument { (snapshot, error) in
                if let error = error {
                    print("Error retrieving movie document: \(error.localizedDescription)")
                    return
                }
                
                guard let movieData = snapshot?.data() else {
                    print("Movie document does not exist")
                    return
                }
                
                // Retrieve the current rating and rating count from the movie document
                var currentRating = movieData["rating"] as? Double ?? 0.0
                var ratingCount = movieData["ratingCount"] as? Int ?? 0
                
                if newRating > 10 {
                    print("Invalid rating. Rating cannot be higher than 10.")
                    return
                }
                
                if newRating != currentRating {
                    // Update rating count (number of people who rated the movie)
                    currentRating = (currentRating * Double(ratingCount) + newRating) / Double(ratingCount + 1)
                    ratingCount += 1
                    
                    // Update the rating and rating count in the movie document
                    movieRef.updateData([
                        "rating": currentRating,
                        "ratingCount": ratingCount
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
    
    func addReview(_ review: Review, to film: Movie) {
        let db = Firestore.firestore()

        guard let movieID = film.id else {
            print("Movie ID is missing.")
            return
        }

        for collectionName in film.collection {
            let collectionRef = db.collection("movies").document(collectionName).collection("films")

            collectionRef.document(movieID).getDocument { (documentSnapshot, error) in
                if let error = error {
                    print("Error fetching movie document: \(error)")
                    return
                }

                guard let document = documentSnapshot, document.exists else {
                    print("Movie document does not exist.")
                    return
                }

                do {
                    if var movie = try documentSnapshot?.data(as: Movie.self) {
                        if var reviews = movie.reviews {
                            reviews.append(review)
                            movie.reviews = reviews
                        } else {
                            movie.reviews = [review]
                        }

                        // Update the movie document with the updated reviews array
                        do {
                            try collectionRef.document(movieID).setData(from: movie) { error in
                                if let error = error {
                                    print("Error updating movie document: \(error)")
                                } else {
                                    print("Movie document updated successfully.")
                                }
                            }
                        } catch {
                            print("Error updating movie document: \(error)")
                        }
                    }
                } catch {
                    print("Error decoding movie document: \(error)")
                }
            }
        }
    }
    
    func addCriticism(_ criticism: FilmCriticism, to film: Movie) {
        let db = Firestore.firestore()

        guard let movieID = film.id else {
            print("Movie ID is missing.")
            return
        }

        for collectionName in film.collection {
            let collectionRef = db.collection("movies").document(collectionName).collection("films")

            collectionRef.document(movieID).getDocument { (documentSnapshot, error) in
                if let error = error {
                    print("Error fetching movie document: \(error)")
                    return
                }

                guard let document = documentSnapshot, document.exists else {
                    print("Movie document does not exist.")
                    return
                }

                do {
                    if var movie = try documentSnapshot?.data(as: Movie.self) {
                        if var criticisms = movie.criticisms {
                            criticisms.append(criticism)
                            movie.criticisms = criticisms
                        } else {
                            movie.criticisms = [criticism]
                        }

                        // Update the movie document with the updated criticisms array
                        do {
                            try collectionRef.document(movieID).setData(from: movie) { error in
                                if let error = error {
                                    print("Error updating movie document: \(error)")
                                } else {
                                    print("Movie document updated successfully.")
                                }
                            }
                        } catch {
                            print("Error updating movie document: \(error)")
                        }
                    }
                } catch {
                    print("Error decoding movie document: \(error)")
                }
            }
        }
    }

    
    
}
