//
//  Category.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 01.05.2023.
//

import Foundation

struct Category: Identifiable {
    let id = UUID()
    let text: String
    var imageName: String
}

var categoriesSample = [
    Category(text: "Pop", imageName: "Pop"),
    Category(text: "Hip-hop", imageName: "Hip"),
    Category(text: "Q-Pop", imageName: "QPop"),
    Category(text: "Rap", imageName: "Rap"),
    Category(text: "R&B", imageName: "RB")
]
