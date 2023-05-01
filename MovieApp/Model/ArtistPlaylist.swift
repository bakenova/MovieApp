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
        artistName: "Kairat Nurtas",
        albumName: "My Universe",
        songs: [
            Song(name: "My Universe", artist: "Kairat Nurtas", imageName: "MyUniverse", releaseDate: "2021", album: "My Universe")
        ],
        releaseDate: "2019",
        genre: "Pop",
        imageName: "MyUniverse",
        runtime: "3"
    ),
    ArtistPlaylist(
        artistName: "Jah Khalib",
        albumName: "Desert Eagle",
        songs: [
            Song(name: "Следуй за мной", artist: "Jah Khalib", imageName: "JahKhalib",releaseDate: "2021", album: "Desert Eagle"),
            Song(name: "МамаМия", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
            Song(name: "Лиловая", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
            Song(name: "Феличита", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
            Song(name: "Desert Eagle", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
            Song(name: "ОхЕслиБыТыЗнала", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle")
        ],
        releaseDate: "2021",
        genre: "Hip-Hop/Rap",
        imageName: "JahKhalib",
        runtime: "18"
    ),
    ArtistPlaylist(
        artistName: "The Limba",
        albumName: "Celine",
        songs: [
            Song(name: "Уляля", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
            Song(name: "Я опоздал", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
            Song(name: "Идеал", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
            Song(name: "Celine", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
            Song(name: "Таксист", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
            Song(name: "Букет гвоздик", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
            Song(name: "Зайка моя", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
            Song(name: "Падали звезды", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine")
        ],
        releaseDate: "2023",
        genre: "Pop",
        imageName: "Celine",
        runtime: "24"
    ),
    
    ArtistPlaylist(
        artistName: "Dose",
        albumName: "Пока",
        songs: [
            Song(name: "Губы", artist: "Dose ", imageName: "Пока", releaseDate: "2021", album: "Пока"),
            Song(name: "В плену", artist: "Dose", imageName: "Пока", releaseDate: "2021", album: "Пока"),
            Song(name: "Пепел", artist: "Dose", imageName: "Пока", releaseDate: "2021", album:  "Пока"),
            Song(name: "Доверяй", artist: "Dose", imageName: "Пока", releaseDate: "2021", album:  "Пока"),
            Song(name: "Сдаюсь", artist: "Dose", imageName: "Пока", releaseDate: "2021", album: "Пока"),
            Song(name: "Ветер", artist: "Dose", imageName: "Пока", releaseDate: "2021", album:  "Пока"),
            Song(name: "Компас", artist: "Dose", imageName: "Пока", releaseDate: "2021", album:  "Пока"),
            Song(name: "Дома", artist: "Dose", imageName: "Пока", releaseDate: "2021", album:  "Пока")
        ],
        releaseDate: "2021",
        genre: "Pop",
        imageName: "Пока",
        runtime: "24"
    ),
    ArtistPlaylist(
        artistName: "Dose",
        albumName: "Солнце золотое",
        songs: [
            Song(name: "Солнце золотое", artist: "Dose ", imageName: "Пока", releaseDate: "2021", album: "Солнце золотое")
        ],
        releaseDate: "2021",
        genre: "Pop",
        imageName: "Солнце золотое",
        runtime: "3"
    ),
    
    ArtistPlaylist(
        artistName: "Hiro",
        albumName: "Миллион событий",
        songs: [
            Song(name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий")
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
            Song(name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран")
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
            Song(name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek"),
            Song(name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek"),
            Song(name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek"),
            Song(name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek"),
            Song(name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek"),
            Song(name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek"),
            Song(name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek")
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
            Song(name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
            Song(name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
            Song(name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
            Song(name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
            Song(name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
            Song(name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
            Song(name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
            Song(name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
            Song(name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ")
        ],
        releaseDate: "2021",
        genre: "Hip-Hop/Rap",
        imageName: "NERVЫ",
        runtime: "30"
        
    ),
    ArtistPlaylist(
        artistName: "Akha",
        albumName: "Какая ты красивая",
        songs: [
            Song(name: "Какая ты красивая", artist: "Akha", imageName: "Какая ты красивая", releaseDate: "2022", album: "Какая ты красивая")
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
            Song(name: "Моя любов", artist: "Akha", imageName: "Моя любовь", releaseDate: "2021", album: "Моя любовь")
        ],
        releaseDate: "2022",
        genre: "Pop",
        imageName: "Моя любовь",
        runtime: "3"
    )
]
