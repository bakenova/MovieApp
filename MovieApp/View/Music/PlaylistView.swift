//
//  PlaylistView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 01.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaylistView: View {
    
    var playlist: MusicSelection
    
    @ObservedObject var viewModel = MusicViewModel()
    
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
                            WebImage(url: URL(string: album.imageName))
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
            .padding(.horizontal, 20)
        }.scrollIndicators(.hidden)
    }
}

struct PlaylistView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistView(playlist:
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
                                            
                                         )])).preferredColorScheme(.dark)
    }
}
