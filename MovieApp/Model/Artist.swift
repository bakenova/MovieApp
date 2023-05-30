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

var artistSample =
Artist(
    artistName: "Dose",
    
    albums: [
        ArtistPlaylist(
            artistName: "Dose",
            albumName: "Пока",
            songs: [
                Song(name: "В плену", artist: "Dose", imageName: "https://dl.dropboxusercontent.com/s/2h22qqbtt8vngf3/dose-poka.jpg", releaseDate: "2021", album: "Зымыран", duration: 164, audioURL: "https://dl.dropboxusercontent.com/s/gfesfjvn98c0xbn/Dose%20-%20%D0%92%20%D0%9F%D0%BB%D0%B5%D0%BD%D1%83.mp3"),
                Song(name: "Пепел", artist: "Dose, Сюзанна", imageName: "https://dl.dropboxusercontent.com/s/2h22qqbtt8vngf3/dose-poka.jpg", releaseDate: "2021", album: "Зымыран", duration: 186, audioURL: "https://dl.dropboxusercontent.com/s/3z7yd0gtyaw4smu/Dose%20%26%20%D0%A1%D1%8E%D0%B7%D0%B0%D0%BD%D0%BD%D0%B0%20-%20%D0%9F%D0%B5%D0%BF%D0%B5%D0%BB.mp3"),
                Song(name: "Компас", artist: "Dose", imageName: "https://dl.dropboxusercontent.com/s/2h22qqbtt8vngf3/dose-poka.jpg", releaseDate: "2021", album: "Зымыран", duration: 150, audioURL: "https://dl.dropboxusercontent.com/s/0mjsn8nqeqew7uu/Dose%20-%20%D0%9A%D0%BE%D0%BC%D0%BF%D0%B0%D1%81.mp3"),
                Song(name: "Ветер", artist: "Dose, Dequine", imageName: "https://dl.dropboxusercontent.com/s/2h22qqbtt8vngf3/dose-poka.jpg", releaseDate: "2021", album: "Зымыран", duration: 170, audioURL: "https://dl.dropboxusercontent.com/s/vfrxc8hneepwrm1/Dose%20%26%20Dequine%20-%20%D0%92%D0%B5%D1%82%D0%B5%D1%80.mp3")
            ],
            releaseDate: "2021",
            genre: "Pop",
            imageName: "https://dl.dropboxusercontent.com/s/2h22qqbtt8vngf3/dose-poka.jpg",
            runtime: "670"
        ),
        ArtistPlaylist(
            artistName: "Dose",
            albumName: "Солнце золотое",
            songs: [
                Song(name: "Солнце золотое", artist: "Dose feat. ЛСП ", imageName: "https://dl.dropboxusercontent.com/s/97vz71zna4q1012/741b75f554f688b477288474360af689.1000x1000x1.png", releaseDate: "2021", album: "Солнце золотое", duration: 171, audioURL: "https://dl.dropboxusercontent.com/s/djgqmrugm931zi7/Dose%20feat.%20%D0%9B%D0%A1%D0%9F%20-%20%D0%A1%D0%BE%D0%BB%D0%BD%D1%86%D0%B5%20%D0%97%D0%BE%D0%BB%D0%BE%D1%82%D0%BE%D0%B5.mp3")
            ],
            releaseDate: "2021",
            genre: "Pop",
            imageName: "https://dl.dropboxusercontent.com/s/97vz71zna4q1012/741b75f554f688b477288474360af689.1000x1000x1.png",
            runtime: "171"
        )
    ],
    popularSongs: [
        Song(name: "Губы", artist: "Dose ", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока", duration: 185, audioURL: ""),
        Song(name: "Пепел", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185, audioURL: "")
    ],
    songs: [
        Song(name: "Губы", artist: "Dose ", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока", duration: 185, audioURL: ""),
        Song(name: "Пепел", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185, audioURL: "")
    ],
    imageName: "https://dl.dropboxusercontent.com/s/2h22qqbtt8vngf3/dose-poka.jpg",
    runtime: "24")

var artists = [
    Artist(
        artistName: "The Limba",
        albums: [
            ArtistPlaylist(
                artistName: "The Limba",
                albumName: "Celine",
                songs: [
                    Song(name: "Уляля", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
                    Song(name: "Я опоздал", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
                    Song(name: "Идеал", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
                    Song(name: "Celine", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
                    Song(name: "Таксист", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
                    Song(name: "Букет гвоздик", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
                    Song(name: "Зайка моя", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
                    Song(name: "Падали звезды", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: "")
                ],
                releaseDate: "2023",
                genre: "Pop",
                imageName: "Celine",
                runtime: "24"
            )
        ],
        popularSongs: [
            Song(name: "Падали звезды", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
            Song(name: "Идеал", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: "")
        ],
        songs: [
            Song(name: "Уляля", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
            Song(name: "Я опоздал", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
            Song(name: "Идеал", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
            Song(name: "Celine", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
            Song(name: "Таксист", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
            Song(name: "Букет гвоздик", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
            Song(name: "Зайка моя", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: ""),
            Song(name: "Падали звезды", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine", duration: 185, audioURL: "")
        ],
        imageName: "Celine",
        runtime: "24"),
    
    Artist(
        artistName: "Jah Khalib",
        albums: [
            ArtistPlaylist(
                artistName: "Jah Khalib",
                albumName: "Desert Eagle",
                songs: [
                    Song(name: "Следуй за мной", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
                    Song(name: "МамаМия", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
                    Song(name: "Лиловая", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
                    Song(name: "Феличита", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
                    Song(name: "Desert Eagle", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
                    Song(name: "ОхЕслиБыТыЗнала", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: "")
                ],
                releaseDate: "2021",
                genre: "Hip-Hop/Rap",
                imageName: "JahKhalib",
                runtime: "18"
            )],
        popularSongs: [
            Song(name: "Следуй за мной", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
            Song(name: "МамаМия", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
            Song(name: "Феличита", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: "")
        ],
        songs: [
            Song(name: "Следуй за мной", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
            Song(name: "МамаМия", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
            Song(name: "Лиловая", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
            Song(name: "Феличита", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
            Song(name: "Desert Eagle", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: ""),
            Song(name: "ОхЕслиБыТыЗнала", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle", duration: 185, audioURL: "")
        ],
        imageName: "JahKhalib",
        runtime: "18"),
    
    Artist(
        artistName: "Hiro",
        albums: [
            ArtistPlaylist(
                artistName: "Hiro",
                albumName: "Миллион событий",
                songs: [
                    Song(name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий", duration: 185, audioURL: "")
                ],
                releaseDate: "2023",
                genre: "Hip-Hop/Rap",
                imageName: "Миллион событий",
                runtime: "3"
            )],
        popularSongs: [
            Song(name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий", duration: 185, audioURL: "")
        ],
        songs: [
            Song(name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий", duration: 185, audioURL: "")
        ],
        imageName: "Миллион событий",
        runtime: "3"),
    
    Artist(
        artistName: "Miras Zhugunusov",
        albums: [
            ArtistPlaylist(
                artistName: "Miras Zhugunusov",
                albumName: "Зымыран",
                songs: [
                    Song(name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185, audioURL: "")
                ],
                releaseDate: "2021",
                genre: "Pop",
                imageName: "Зымыран",
                runtime: "3"
            )],
        popularSongs: [
            Song(name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185, audioURL: "")
        ],
        songs: [
            Song(name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран", duration: 185, audioURL: "")
        ],
        imageName: "Зымыран",
        runtime: "3"),
    
    Artist(
        artistName: "RaiM",
        albums: [
            ArtistPlaylist(
                artistName: "RaiM",
                albumName: "4 dongelek",
                songs: [
                    Song(name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                    Song(name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                    Song(name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                    Song(name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                    Song(name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
                    Song(name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
                    Song(name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: "")
                ],
                releaseDate: "2021",
                genre: "Pop",
                imageName: "4 dongelek",
                runtime: "21"
            )
        ],
        popularSongs: [
            Song(name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
            Song(name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: "")
        ],
        songs: [
            Song(name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
            Song(name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
            Song(name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
            Song(name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
            Song(name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek", duration: 185, audioURL: ""),
            Song(name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: ""),
            Song(name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek", duration: 185, audioURL: "")
        ],
        imageName: "4 dongelek",
        runtime: "21"),
    
    Artist(
        artistName: "V $ X V PRiNCE",
        albums: [
            ArtistPlaylist(
                artistName: "V $ X V PRiNCE",
                albumName: "NERVЫ",
                songs: [
                    Song(name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                    Song(name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                    Song(name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                    Song(name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ",releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                    Song(name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                    Song(name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                    Song(name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                    Song(name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                    Song(name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                    Song(name: "Какая ты красивая", artist: "Akha", imageName: "NERVЫ", releaseDate: "2021", album: "Какая ты красивая", duration: 185, audioURL: ""),
                    Song(name: "Моя любов", artist: "Akha", imageName: "NERVЫ", releaseDate: "2022", album: "Моя любовь", duration: 185, audioURL: "")
                ],
                releaseDate: "2021",
                genre: "Hip-Hop/Rap",
                imageName: "NERVЫ",
                runtime: "30"
            )
        ],
        popularSongs: [
            Song(name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: "")
        ],
        songs: [
            Song( name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
            Song(name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: "")
        ],
        imageName: "NERVЫ",
        runtime: "30"),
    
    Artist(
        artistName: "Akha",
        albums: [
            ArtistPlaylist(
                artistName: "Akha",
                albumName: "Какая ты красивая",
                songs: [
                    Song(name: "Какая ты красивая", artist: "Akha", imageName: "Какая ты красивая", releaseDate: "2021", album: "Какая ты красивая", duration: 185, audioURL: "")
                ],
                releaseDate: "2021",
                genre: "R&B/Soul",
                imageName: "Какая ты красивая",
                runtime: "3"
            ),
            ArtistPlaylist(
                artistName: "Akha",
                albumName: "Моя любовь",
                songs: [
                    Song(name: "Моя любов", artist: "Akha", imageName: "Какая ты красивая", releaseDate: "2022", album: "Моя любовь", duration: 185, audioURL: "")
                ],
                releaseDate: "2022",
                genre: "Pop",
                imageName: "Моя любовь",
                runtime: "3"
            )
        ],
        popularSongs: [
            Song(name: "Какая ты красивая", artist: "Akha", imageName: "Какая ты красивая", releaseDate: "2021", album: "Какая ты красивая", duration: 185, audioURL: "")
        ],
        songs: [
            Song(name: "Какая ты красивая", artist: "Akha", imageName: "Какая ты красивая", releaseDate: "2021", album: "Какая ты красивая", duration: 185, audioURL: ""),
            Song(name: "Моя любов", artist: "Akha", imageName: "Какая ты красивая", releaseDate: "2023", album: "Моя любовь", duration: 185, audioURL: "")
        ],
        imageName: "Какая ты красивая",
        runtime: "6")
]
