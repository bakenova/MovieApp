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
    
    let musicPlaylist: [MusicSelection] = musicCollectionTopPick
    
    let artistAlbum: [ArtistPlaylist] = playlistArtist
    let artist = artistSample

    
    var body: some View {
        NavigationView{
            ScrollView{
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
                                    NavigationLink(destination: PlaylistView(playlist: music)) {
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
                        HStack(alignment: .top, spacing: 8){
                            Image(artist.imageName)
                                .resizable()
                                .frame(width: 60, height: 60, alignment: .leading)
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .padding(.top, 10)
                            VStack(alignment: .leading, spacing: 3){
                                Text("More from")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .bold))
                                HStack{
                                    Text(artist.artistName)
                                        .font(.title.bold())
                                    Image(systemName: "chevron.forward")
                                        .foregroundColor(.orange)
                                        .padding(.top, 5)
                                }
                            }
                            
                            .padding(.top, 8)
                            Spacer()
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        
                        ScrollView(.horizontal) {
                            HStack{
                                ForEach(artist.albums.prefix(4)){ album in
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
                    
                    //2023: the best
                    VStack{
                        HStack(alignment: .top){
                            Text("2023: the best")
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
                    
                    //Categories
                    let categories = categoriesSample
                    
                    let columns = [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                    ]
                    VStack(alignment:.leading){
                        HStack(alignment: .top){
                            Text("Categories")
                                .font(.title.bold())
                            Spacer()
                        }
                        .padding(.top, 20)
                        .padding(.horizontal, 20)
                        
                        LazyVGrid(columns: columns, alignment: .leading, spacing: 10) {
                            ForEach(categories) { item in
                                ZStack(alignment: .leading){
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(.ultraThinMaterial)
                                        .frame(width: 160, height: 40, alignment: .leading)
                                    HStack{
                                        Image(item.imageName)
                                            .resizable()
                                            .frame(width: 40, height: 40, alignment: .leading)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                        Text(item.text)
                                            .frame(alignment: .leading)
                                            .padding(.horizontal, 10)
                                            .padding(.vertical, 5)
                                            .foregroundColor(.white)
                                            .font(.system(size: 14, weight: .semibold))
                                    }
                                }
                            }
                        }
                        .padding()
                    }
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
