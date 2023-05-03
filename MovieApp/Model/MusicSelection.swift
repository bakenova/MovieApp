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
    var playlists: [ArtistPlaylist]
}

//var musicSelectionLists: [MusicSelection] = [
//    MusicSelection(title: "Popular music of 2023", imageName: "m23")
//]


var musicCollectionTopPick: [MusicSelection] = [
    MusicSelection(title: "Rewind Top Songs 2022",
                   imageName: "rts",
                   playlists: [ArtistPlaylist(
                    artistName: "Hiro",
                    albumName: "Миллион событий",
                    songs: [
                        Song(name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий", duration: 185)
                    ],
                    releaseDate: "2023",
                    genre: "Hip-Hop/Rap",
                    imageName: "Миллион событий",
                    runtime: "3"
                ),
                ArtistPlaylist(
                    artistName: "Miras Zhugunusov",
                    albumName: "Зымыран",
                    songs: [
                        Song(name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185)
                    ],
                    releaseDate: "2021",
                    genre: "Pop",
                    imageName: "Зымыран",
                    runtime: "3"
                ),
                ArtistPlaylist(
                    artistName: "RaiM",
                    albumName: "4 dongelek",
                    songs: [
                        Song(name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185),
                        Song(name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185),
                        Song(name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185),
                        Song(name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185),
                        Song(name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185),
                        Song(name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185),
                        Song(name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185)
                    ],
                    releaseDate: "2021",
                    genre: "Pop",
                    imageName: "4 dongelek",
                    runtime: "21"
                ),
                ArtistPlaylist(
                    artistName: "V $ X V PRiNCE",
                    albumName: "NERVЫ",
                    songs: [
                        Song(name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                        Song(name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                        Song(name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                        Song(name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                        Song(name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                        Song(name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                        Song(name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                        Song(name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                        Song(name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185)
                    ],
                    releaseDate: "2021",
                    genre: "Hip-Hop/Rap",
                    imageName: "NERVЫ",
                    runtime: "30"
                    
                )]),
    MusicSelection(title: "Made For You",
                   imageName: "mfu",
                   playlists: [
                    ArtistPlaylist(
                        artistName: "Hiro",
                        albumName: "Миллион событий",
                        songs: [
                            Song(name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий", duration: 185)
                        ],
                        releaseDate: "2023",
                        genre: "Hip-Hop/Rap",
                        imageName: "Миллион событий",
                        runtime: "3"
                    ),
                    ArtistPlaylist(
                        artistName: "Miras Zhugunusov",
                        albumName: "Зымыран",
                        songs: [
                            Song(name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185)
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "Зымыран",
                        runtime: "3"
                    ),
                    ArtistPlaylist(
                        artistName: "RaiM",
                        albumName: "4 dongelek",
                        songs: [
                            Song(name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185),
                            Song(name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185),
                            Song(name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185),
                            Song(name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185),
                            Song(name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185),
                            Song(name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185),
                            Song(name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185)
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "4 dongelek",
                        runtime: "21"
                    ),
                    ArtistPlaylist(
                        artistName: "V $ X V PRiNCE",
                        albumName: "NERVЫ",
                        songs: [
                            Song(name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185)
                        ],
                        releaseDate: "2021",
                        genre: "Hip-Hop/Rap",
                        imageName: "NERVЫ",
                        runtime: "30"
                        
                    )
                   ]),
    MusicSelection(title: "Good Day by Korkem",
                   imageName: "gdk",
                   playlists: [
                    ArtistPlaylist(
                    artistName: "Hiro",
                    albumName: "Миллион событий",
                    songs: [
                        Song(name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий", duration: 185)
                    ],
                    releaseDate: "2023",
                    genre: "Hip-Hop/Rap",
                    imageName: "Миллион событий",
                    runtime: "3"
                ),
                    ArtistPlaylist(
                        artistName: "Miras Zhugunusov",
                        albumName: "Зымыран",
                        songs: [
                            Song(name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185)
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "Зымыран",
                        runtime: "3"
                    ),
                    ArtistPlaylist(
                        artistName: "RaiM",
                        albumName: "4 dongelek",
                        songs: [
                            Song(name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185),
                            Song(name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185),
                            Song(name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185),
                            Song(name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185),
                            Song(name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185),
                            Song(name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185),
                            Song(name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185)
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "4 dongelek",
                        runtime: "21"
                    ),
                    ArtistPlaylist(
                        artistName: "V $ X V PRiNCE",
                        albumName: "NERVЫ",
                        songs: [
                            Song(name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185),
                            Song(name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185)
                        ],
                        releaseDate: "2021",
                        genre: "Hip-Hop/Rap",
                        imageName: "NERVЫ",
                        runtime: "30"
                        
                    )
                   ]
                  )
]
