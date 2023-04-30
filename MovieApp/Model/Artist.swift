//
//  Artist.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 01.05.2023.
//

import Foundation
struct Artist: Identifiable {
    var id = UUID().uuidString
    var artistName: String
    var albums: [ArtistPlaylist]
    var popularSongs: [Song]
    var songs: [Song]
    var imageName: String
    var runtime: String
}
