//
//  Selection.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import Foundation

struct Selection: Identifiable{
    var id = UUID().uuidString
    var movieSelection: MovieSelection
    var musicSelection: MusicSelection
}
