//
//  PlaylistDetailView.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 01.05.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct PlaylistDetailView: View {
    var playlistDetail: ArtistPlaylist
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        GeometryReader { proxy in
            let size = proxy.size
            ScrollView{
                WebImage(url: URL(string: playlistDetail.imageName))
                    .resizable()
                    .frame(height: size.height/2)
                    //.cornerRadius(15, corners: [.bottomLeft, .bottomRight])
                
                HStack(alignment: .top){
                    Text(playlistDetail.albumName)
                        .font(.largeTitle.bold())
                        .frame(alignment: .leading)
                    Spacer()
                }
                .padding(.leading, 20)
                
                HStack{
                    Text(playlistDetail.artistName)
                        .frame(alignment: .leading)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .padding(.leading, 24)
                        .foregroundColor(.gray)
                    
                    Text("|")
                        .frame(alignment: .leading)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text(playlistDetail.releaseDate)
                        .frame(alignment: .leading)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text("|")
                        .frame(alignment: .leading)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text(playlistDetail.genre)
                        .frame(alignment: .leading)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text("|")
                        .frame(alignment: .leading)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Text(playlistDetail.runtime + " mins")
                        .frame(alignment: .leading)
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    Spacer()
                }
                .padding(.top, -10)
                .padding(.bottom, 30)
                
                ForEach(playlistDetail.songs){ song in
                    NavigationLink(destination: SongDetailView(song: song)) {
                        HStack(alignment: .top, spacing: 8){
                            Image(systemName: "text.justify")
                                .padding(.top, 4)
                            Text(song.name)
                                .font(.system(size: 20, weight: .semibold))
                                .multilineTextAlignment(.leading)
                                .frame(width: size.width - 80, height: 40, alignment: .topLeading)
                                .foregroundColor(self.scheme == .dark ? .white : .black)
                            Image(systemName: "ellipsis")
                                .padding(.top, 4)
                        }
                        .frame(height: 40)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
    }
}

struct PlaylistDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistDetailView(playlistDetail: ArtistPlaylist(
            artistName: "V $ X V PRiNCE",
            albumName: "NERVЫ",
            songs: [
                Song(name: "Veчnый", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                Song(name: "Нервы", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                Song(name: "Kozime Kara", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                Song(name: "Танцуй со мной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                Song(name: "Лирика", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                Song(name: "В этом что-то есть", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                Song(name: "Выходной", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                Song(name: "Татьяна", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: ""),
                Song(name: "Mercedes", artist: "V $ X V PRiNCE", imageName: "NERVЫ", releaseDate: "2021", album: "NERVЫ", duration: 185, audioURL: "")
            ],
            releaseDate: "2021",
            genre: "Hip-Hop/Rap",
            imageName: "NERVЫ",
            runtime: "30"
            
        )).preferredColorScheme(.dark)
    }
}
