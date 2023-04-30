//
//  Music.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 28.02.2023.
//

import SwiftUI

struct Music: View {
    @State var currentTab: String = "Music"
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    
    let musicPlaylist: [MusicSelection] = [
        MusicSelection(title: "Replay to your top songs", imageName: "m23"), MusicSelection(title: "Replay to your top songs", imageName: "m23"), MusicSelection(title: "Replay to your top songs", imageName: "m23"),
        MusicSelection(title: "Replay to your top songs", imageName: "m23")]
    
    let artistAlbum: [ArtistPlaylist] = playlistArtist
    
    var body: some View {
        NavigationView{
            VStack{
                //Top Picks
                VStack{
                    HStack(alignment: .top){
                        Text("Top Picks")
                            .font(.title.bold())
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(musicPlaylist){ music in
                                NavigationLink(destination: SongDetailView()) {
                                    VStack(alignment: .leading){
                                        Text(music.title)
                                            .font(.system(size: 14, weight: .semibold))
                                            .multilineTextAlignment(.leading)
                                            .frame(width: 180, height: 25, alignment: .topLeading)
                                            .foregroundColor(Color.gray)
                                        Image(music.imageName)
                                            .resizable()
                                            .frame(width: 200, height: 250)
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(15)
                                        
                                    }
                                    .padding(.horizontal, 2)
                                }
                            }
                        }
                        .padding(.leading, 16)
                    }.scrollIndicators(.hidden)
                }
                
                //Recently Played
                VStack{
                    HStack(alignment: .top){
                        Text("Recently played")
                            .font(.title.bold())
                        Image(systemName: "chevron.forward")
                            .foregroundColor(.orange)
                            .padding(.top, 10)
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(artistAlbum.prefix(4)){ album in
                                NavigationLink(destination: SongDetailView()) {
                                    VStack(alignment: .leading){
                                        Image(album.imageName)
                                            .resizable()
                                            .frame(width: 150, height: 150)
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
                                    .padding(.horizontal, 2)
                                }
                            }
                        }
                        .padding(.leading, 16)
                    }.scrollIndicators(.hidden)
                }
                
                //More from Artist
                VStack{
                    HStack(alignment: .top){
                        Text("Recently played")
                            .font(.title.bold())
                        Image(systemName: "chevron.forward")
                            .foregroundColor(.orange)
                            .padding(.top, 10)
                        Spacer()
                    }
                    .padding(.top, 20)
                    .padding(.horizontal, 20)
                    
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(artistAlbum.prefix(4)){ album in
                                NavigationLink(destination: SongDetailView()) {
                                    VStack(alignment: .leading){
                                        Image(album.imageName)
                                            .resizable()
                                            .frame(width: 150, height: 150)
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
                                    .padding(.horizontal, 2)
                                }
                            }
                        }
                        .padding(.leading, 16)
                    }.scrollIndicators(.hidden)
                }
            }
        }
    }
}

struct Music_Previews: PreviewProvider {
    static var previews: some View {
        Music()
            .preferredColorScheme(.dark)
    }
}
