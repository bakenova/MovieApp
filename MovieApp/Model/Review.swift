//
//  Review.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import Foundation

struct Review: Identifiable, Codable {
    var id = UUID().uuidString
    var reviewTitle: String
    var reviewAuthor: User
    var reviewDescription: String
    var reviewRate: String
}
