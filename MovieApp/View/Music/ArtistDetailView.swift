//
//  ArtistDetailView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 16.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct ArtistDetailView: View {
    var artist: Artist
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading){
                ZStack{
                    WebImage(url: URL(string: artist.imageName))
                        .resizable()
                        .frame(width: proxy.size.width, height: 400, alignment: .center)
                        .ignoresSafeArea()
                    VStack(alignment: .leading){
                        HStack(alignment: .center){
                            Text(artist.artistName)
                                .font(.system(size: 50, weight: .black))
                                .foregroundColor(.white)
                                .padding(.leading, 24)
                            Spacer()
                        }
                    }
                    .padding(.top, 300)
                }
                
                Button {
                    print("")
                } label: {
                    HStack {
                        Spacer()
                        Text("Add to Favorites")
                            .foregroundColor(.white)
                            .padding(.vertical, 15)
                            .font(.system(size: 18, weight: .semibold))
                        Spacer()
                    }
                    .background(Color.blue)
                }
                .cornerRadius(15)
                .padding(.horizontal, 15)
                
                Text("Popular songs")
            }
            .ignoresSafeArea()
        }
        .background(.black)
    }
}

struct ArtistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ArtistDetailView(artist: Artist(
            artistName: "Dose",
            albums: [
                ArtistPlaylist(
                    artistName: "Dose",
                    albumName: "Пока",
                    songs: [
                        Song(name: "Губы", artist: "Dose ", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока", duration: 185, audioURL: ""),
                        Song(name: "В плену", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока", duration: 185, audioURL: ""),
                        Song(name: "Пепел", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185, audioURL: ""),
                        Song(name: "Доверяй", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185, audioURL: ""),
                        Song(name: "Сдаюсь", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока", duration: 185, audioURL: ""),
                        Song(name: "Ветер", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185, audioURL: ""),
                        Song(name: "Компас", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185, audioURL: ""),
                        Song(name: "Дома", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185, audioURL: ""),
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
                        Song(name: "Солнце золотое", artist: "Dose ", imageName: "Солнце золотое", releaseDate: "2021", album: "Солнце золотое", duration: 185, audioURL: "")
                    ],
                    releaseDate: "2021",
                    genre: "Pop",
                    imageName: "Солнце золотое",
                    runtime: "3"
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
            imageName: "Пока",
            runtime: "24"))
    }
}
