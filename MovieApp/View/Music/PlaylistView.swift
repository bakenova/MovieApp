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
                    Song(name: "Губы", artist: "Dose ", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока", duration: 185),
                    Song(name: "В плену", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока", duration: 185),
                    Song(name: "Пепел", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185),
                    Song(name: "Доверяй", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185),
                    Song(name: "Сдаюсь", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album: "Пока", duration: 185),
                    Song(name: "Ветер", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185),
                    Song(name: "Компас", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185),
                    Song(name: "Дома", artist: "Dose", imageName: "Солнце золотое", releaseDate: "2021", album:  "Пока", duration: 185)
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
                    Song(name: "Солнце золотое", artist: "Dose ", imageName: "Пока", releaseDate: "2021", album: "Солнце золотое", duration: 185)
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
                    Song(name: "Солнце золотое", artist: "Dose ", imageName: "Пока", releaseDate: "2021", album: "Солнце золотое", duration: 185)
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
                    Song(name: "Солнце золотое", artist: "Dose ", imageName: "Пока", releaseDate: "2021", album: "Солнце золотое", duration: 185)
                ],
                releaseDate: "2021",
                genre: "Pop",
                imageName: "Солнце золотое",
                runtime: "3"
            )
        ])).preferredColorScheme(.dark)
    }
}
