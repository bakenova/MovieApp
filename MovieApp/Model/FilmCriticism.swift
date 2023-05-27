//
//  FilmCriticism.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 24.05.2023.
//

import Foundation

struct FilmCriticism: Identifiable, Codable {
    var id = UUID().uuidString
    var criticismTitle: String
    var criticismAuthor: User
    var criticismDescription: String
    var actorRate: Int
    var directingRate: Int
    var soundRate: Int
    var scriptRate: Int
}

var crits: [FilmCriticism] = []
