//
//  MusicSelection.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 30.04.2023.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct MusicSelection: Identifiable, Codable {
    var id: String
    var title: String
    var imageName: String
    var playlists: [ArtistPlaylist]
}

//var musicSelectionLists: [MusicSelection] = [
//    MusicSelection(title: "Popular music of 2023", imageName: "m23")
//]


var musicCollectionTopPick: [MusicSelection] = [
    MusicSelection(id: "Rewind Top Songs 2022",
                   title: "Rewind Top Songs 2022",
                   imageName: "https://www.dropbox.com/s/qu3qqbxbfs24h51/rts.jpeg?dl=1",
                   playlists:
                    [ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "Hiro",
                        albumName: "Миллион событий",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Миллион событий", artist: "Hiro", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2023",
                        genre: "Hip-Hop/Rap",
                        imageName: "Миллион событий",
                        runtime: "3"
                    ),
                     ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "Miras Zhugunusov",
                        albumName: "Зымыран",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "Зымыран",
                        runtime: "3"
                     ),
                     ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "RaiM",
                        albumName: "4 dongelek",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "4 dongelek",
                        runtime: "21"
                     ),
                     ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "V $ X V PRiNCE",
                        albumName: "NERVЫ",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2021",
                        genre: "Hip-Hop/Rap",
                        imageName: "NERVЫ",
                        runtime: "30"
                        
                     )]),
    MusicSelection(id: "Made For You",
                   title: "Made For You",
                   imageName: "https://www.dropbox.com/s/e405moz4gy6ggkh/mfu.jpeg?raw=1",
                   playlists: [
                    ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "Hiro",
                        albumName: "Миллион событий",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2023",
                        genre: "Hip-Hop/Rap",
                        imageName: "Миллион событий",
                        runtime: "3"
                    ),
                    ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "Miras Zhugunusov",
                        albumName: "Зымыран",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "Зымыран",
                        runtime: "3"
                    ),
                    ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "RaiM",
                        albumName: "4 dongelek",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "4 dongelek",
                        runtime: "21"
                    ),
                    ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "V $ X V PRiNCE",
                        albumName: "NERVЫ",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2021",
                        genre: "Hip-Hop/Rap",
                        imageName: "NERVЫ",
                        runtime: "30"
                        
                    )
                   ]),
    MusicSelection(id: "Good Day with Korkem",
                   title: "Good Day by Korkem",
                   imageName: "https://www.dropbox.com/s/zbdahp53sdhhlm5/gdk.jpeg?raw=1",
                   playlists: [
                    ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "Hiro",
                        albumName: "Миллион событий",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2023",
                        genre: "Hip-Hop/Rap",
                        imageName: "Миллион событий",
                        runtime: "3"
                    ),
                    ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "Miras Zhugunusov",
                        albumName: "Зымыран",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "Зымыран",
                        runtime: "3"
                    ),
                    ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "RaiM",
                        albumName: "4 dongelek",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2021",
                        genre: "Pop",
                        imageName: "4 dongelek",
                        runtime: "21"
                    ),
                    ArtistPlaylist(
                        id: UUID().uuidString,
                        artistName: "V $ X V PRiNCE",
                        albumName: "NERVЫ",
                        songs: [
                            Song(id: UUID().uuidString,
                                 name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                            Song(id: UUID().uuidString,
                                 name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: "")
                        ],
                        releaseDate: "2021",
                        genre: "Hip-Hop/Rap",
                        imageName: "NERVЫ",
                        runtime: "30"
                        
                    )
                   ]
                  )
]
