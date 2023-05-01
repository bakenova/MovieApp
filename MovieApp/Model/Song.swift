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
    let imageName: String
    let releaseDate: String
    let album: String
}

var songCollection = [
    Song(name: "Следуй за мной", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
    Song(name: "МамаМия", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
    Song(name: "Лиловая", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
    Song(name: "Феличита", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
    Song(name: "Desert Eagle", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
    Song(name: "ОхЕслиБыТыЗнала", artist: "Jah Khalib", imageName: "JahKhalib", releaseDate: "2021", album: "Desert Eagle"),
    
    Song(name: "Уляля", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
    Song(name: "Я опоздал", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
    Song(name: "Идеал", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
    Song(name: "Celine", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
    Song(name: "Таксист", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
    Song(name: "Букет гвоздик", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
    Song(name: "Зайка моя", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
    Song(name: "Падали звезды", artist: "The Limba", imageName: "Celine", releaseDate: "2023", album: "Celine"),
    
    Song(name: "Губы", artist: "Dose ", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока"),
    Song(name: "В плену", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока"),
    Song(name: "Пепел", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока"),
    Song(name: "Доверяй", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока"),
    Song(name: "Сдаюсь", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока"),
    Song(name: "Ветер", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока"),
    Song(name: "Компас", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока"),
    Song(name: "Дома", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока"),
    
    Song(name: "Солнце золотое", artist: "Dose ", imageName: "Солнце золотое", releaseDate: "2021", album: "Солнце золотое"),
    
    Song(name: "Миллион событий", artist: "Hiro ", imageName: "Миллион событий", releaseDate: "2023", album: "Миллион событий"),
    
    Song(name: "Зымыран", artist: "Miras Zhugunusov ", imageName: "Зымыран", releaseDate: "2021", album: "Зымыран"),
    
    Song(name: "Watcha Wanna", artist: "RaiM ", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek"),
    Song(name: "Kaif (feat. Miko)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek"),
    Song(name: "Baila (feat. Alina Gerc)", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek"),
    Song(name: "Kolikpen", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek"),
    Song(name: "Where are you", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album: "4 dongelek"),
    Song(name: "Oh My Love", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek"),
    Song(name: "Jol", artist: "RaiM", imageName: "4 dongelek", releaseDate: "2021", album:  "4 dongelek"),
    
    Song(name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
    Song(name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
    Song(name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
    Song(name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ",releaseDate: "2021", album: "NERVЫ"),
    Song(name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
    Song(name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
    Song(name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
    Song(name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
    Song(name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ"),
    
    Song(name: "Моя любов", artist: "Akha", imageName: "Какая ты красивая", releaseDate: "2021", album: "Моя любовь"),
    Song(name: "Какая ты красивая", artist: "Akha", imageName: "Какая ты красивая", releaseDate: "2022", album: "Какая ты красивая"),
   
    
]
