//
//  PlaylistView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 01.05.2023.
//

import SwiftUI

struct PlaylistView: View {
    
    var playlist: MusicSelection
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ScrollView(.vertical) {
            HStack{
                Text(playlist.title)
                    .font(.title.bold())
                    .frame(alignment: .leading)
                Spacer()
            }
            .padding(.top, 20)
            .padding(.horizontal, 20)
            
            LazyVGrid(columns: columns, alignment: .leading, spacing: 5) {
                ForEach(playlist.playlists){ album in
                    NavigationLink(destination: PlaylistDetailView(playlistDetail: album)) {
                        VStack(alignment: .leading){
                            Image(album.imageName)
                                .resizable()
                                .frame(width: 180, height: 180)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(15)
                            Text(album.albumName)
                                .font(.system(size: 16, weight: .bold))
                                .multilineTextAlignment(.leading)
                                .frame(width: 130, height: 20, alignment: .topLeading)
                                .foregroundColor(Color.white)
                            Text(album.artistName)
                                .font(.system(size: 14, weight: .semibold))
                                .multilineTextAlignment(.leading)
                                .frame(width: 130, height: 20, alignment: .topLeading)
                                .foregroundColor(Color.gray)
                        }
                        .padding(.top, 10)
                        .padding(.trailing, 20)
                    }
                }
            }
            .padding(.leading, 8)
        }.scrollIndicators(.hidden)
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView(playlist: MusicSelection(title: "Replay to your top songs", imageName: "m23", playlists: [
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
                artistName: "Dose",
                albumName: "Солнце золотое",
                songs: [
                    Song(name: "Солнце золотое", artist: "Dose ", imageName: "Пока", releaseDate: "2021", album: "Солнце золотое")
                ],
                releaseDate: "2021",
                genre: "Pop",
                imageName: "Солнце золотое",
                runtime: "3"
            )
        ])).preferredColorScheme(.dark)
    }
}
