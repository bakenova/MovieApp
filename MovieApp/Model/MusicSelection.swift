//
//  MusicSelection.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import Foundation

struct MusicSelection: Identifiable{
    var id = UUID().uuidString
    var title: String
    var imageName: String
}

var musicSelectionLists: [MusicSelection] = [
    MusicSelection(title: "Popular music of 2023", imageName: "m23")
]
