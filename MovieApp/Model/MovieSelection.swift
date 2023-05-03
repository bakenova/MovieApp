//
//  MovieSelection.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import Foundation
struct MovieSelection: Identifiable{
    var id = UUID().uuidString
    var title: String
    var imageName: String
}

var movieSelectionLists: [MovieSelection] = [
    MovieSelection(title: "Popular movies of 2022", imageName: "f22")
]
