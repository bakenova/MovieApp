//
//  ArtistPlaylist.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 01.05.2023.
//

import Foundation

struct ArtistPlaylist: Identifiable {
    var id = UUID().uuidString
    var artistName: String
    var albumName: String
    var songs: [Song]
    var releaseDate: String
    var genre: String
    var imageName: String
    var runtime: String
}

var playlistArtist: [ArtistPlaylist] = [
    ArtistPlaylist(
        artistName: "Selena Gomez",
        albumName: "Rare",
        songs: [
            Song(name: "Lose you to love me", artist: "Selena Gomez", album: "Rare"),
            Song(name: "Rare", artist: "Selena Gomez", album: "Rare"),
            Song(name: "Vulnerable", artist: "Selena Gomez", album: "Rare")
        ],
        releaseDate: "2020",
        genre: "Pop",
        imageName: "SG",
        runtime: "9"
    ),
    ArtistPlaylist(
        artistName: "Selena Gomez",
        albumName: "Rare",
        songs: [
            Song(name: "Lose you to love me", artist: "Selena Gomez", album: "Rare"),
            Song(name: "Rare", artist: "Selena Gomez", album: "Rare"),
            Song(name: "Vulnerable", artist: "Selena Gomez", album: "Rare")
        ],
        releaseDate: "2020",
        genre: "Pop",
        imageName: "SG",
        runtime: "9"
    ),
    ArtistPlaylist(
        artistName: "Selena Gomez",
        albumName: "Rare",
        songs: [
            Song(name: "Lose you to love me", artist: "Selena Gomez", album: "Rare"),
            Song(name: "Rare", artist: "Selena Gomez", album: "Rare"),
            Song(name: "Vulnerable", artist: "Selena Gomez", album: "Rare")
        ],
        releaseDate: "2020",
        genre: "Pop",
        imageName: "SG",
        runtime: "9"
    )
]
