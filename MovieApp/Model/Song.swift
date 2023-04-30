//
//  Song.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 01.05.2023.
//

import Foundation

struct Song: Identifiable {
    let id = UUID()
    let name: String
    let artist: String
    let album: String
}
