//
//  Search.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 02.03.2023.
//

import SwiftUI
import SDWebImageSwiftUI

struct Search: View {
    @StateObject var viewModel = FilmDetailViewModel()
    @StateObject var musicViewModel = MusicViewModel()
    @State var currentTab: String = "Search"
    @State private var searchText = ""
    @State private var selectedTab = 0
    @State private var isEditing = false
    @State private var songs: [Song] = []
    @State var categoryList: [[CategoryData]] = [
        [
            CategoryData(categoryName: "Genres"),
            CategoryData(categoryName: "Release years"),
            CategoryData(categoryName: "Awards"),
            CategoryData(categoryName: "Directions")
        ]
    ]
    
    @Environment(\.colorScheme) var scheme
    
    
    let itemsM: [Song] = songCollection
    
    let movieList: [MovieSelection] = movieSelectionLists
    let musicList: [MusicSelection] = []
    
    var body: some View {
        NavigationView {
            GeometryReader{ proxy in
                VStack {
                    HStack{
                        Image(systemName: "magnifyingglass")
                            .padding(.leading, 16)
                        TextField("Search", text: $searchText, onEditingChanged: { isEditing in
                            self.isEditing = true
                        }
                        )
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .frame(width: proxy.size.width - 90, height: 56, alignment: .leading)
                        .padding(.leading, 3)
                        .dismissKeyboardOnDisappear()
                        
                        
                        Button(action: {
                            isEditing = false
                            self.searchText = ""
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to:nil, from:nil, for:nil)
                        }) {
                            Image(systemName: "xmark.circle.fill")
                                .opacity(!isEditing ? 0 : 1)
                        }
                        .padding(.trailing, 10)
                    }
                    
                    if isEditing {
                        Picker(selection: $selectedTab, label: Text("Select a list")) {
                            Text("Films").tag(0)
                            Text("Music").tag(1)
                        }.pickerStyle(.segmented)
                            .padding(.horizontal, 10)
                        
                        if selectedTab == 0 {
                            List(viewModel.generalList.filter({ searchText.isEmpty ? true : $0.movieTitle.localizedCaseInsensitiveContains(searchText) })) { item in
                                NavigationLink(destination: FilmDetails(viewModel: viewModel, film: item, collectionName: "General")) {
                                    MovieListView(item: item)
                                }
                            }
                        } else {
                            List(songs.filter({ searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) })) { item in
                                NavigationLink(destination: SongDetailView(song: item)) {
                                    MusicHListView(item: item)
                                }
                            }
                        }
                        
                    }
                    else {
                        ScrollView {
                                customBlock(collectionName: "Popular", movies: viewModel.popularFilms)
                            
                            VStack {
                                HStack(alignment: .top) {
                                    Text("Popular Music")
                                        .font(.title.bold())
                                    Spacer()
                                    Button("See More"){}
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.blue)
                                }
                                .padding(.top, 10)
                                .padding(.horizontal, 20)
                                
                                ScrollView(.horizontal) {
                                    HStack {
                                        ForEach(musicViewModel.artistPlaylists.prefix(4)) { album in
                                            NavigationLink(destination: PlaylistDetailView(playlistDetail: album)) {
                                                VStack(alignment: .leading) {
                                                    WebImage(url: URL(string: album.imageName))
                                                        .resizable()
                                                        .frame(width: 150, height: 150)
                                                        .aspectRatio(contentMode: .fit)
                                                        .cornerRadius(15)
                                                    Text(album.albumName)
                                                        .font(.system(size: 16, weight: .bold))
                                                        .multilineTextAlignment(.leading)
                                                        .frame(width: 130, height: 20, alignment: .topLeading)
                                                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
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
                                }
                                .scrollIndicators(.hidden)
                            }
                        }
                    }
                }
            }
        }
        .onAppear{
            musicViewModel.fetchData()
            musicViewModel.fetchArtistPlaylists()
            viewModel.fetchMovies()
            musicViewModel.fetchSongs { fetchedSongs in
                if let fetchedSongs = fetchedSongs {
                    songs = fetchedSongs
                }
            }
        }
        .onDisappear {
                    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                }
    }
    
    //MARK: - Custom Blocks
    @ViewBuilder
    func customBlock(collectionName: String, movies: [Movie]) -> some View{
        ZStack{
            Rectangle()
                .fill(.white)
                .opacity(self.scheme == .dark ? 0.1 : 1)
                //.frame(height: 280)
                .cornerRadius(15)
                .padding(.bottom, 10)
            
            VStack{
                HStack(alignment: .top) {
                    Text("Popular Films")
                        .font(.title.bold())
                    Spacer()
                    Button("See More"){}
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundColor(.blue)
                }
                .padding(.top, 10)
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 15){
                        ForEach(movies){ movie in
                            NavigationLink(destination: FilmDetails(viewModel: viewModel, film: movie, collectionName: collectionName, reviewed: !(movie.reviews?.isEmpty ?? true) ? false : true)) {
                                VStack(alignment: .leading){
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 15)
                                            .fill(.black)
                                            .frame(width: 100, height: 150)
                                        WebImage(url: URL(string: movie.imageName))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(15)
                                            .frame(width: 100, height: 150)
                                    }
                                    Text(movie.movieTitle)
                                        .font(.system(size: 14, weight: .semibold))
                                        .multilineTextAlignment(.leading)
                                        .frame(width: 100, height: 40, alignment: .topLeading)
                                        .foregroundColor(self.scheme == .dark ? .white : .black)
                                }
                            }
                        }
                    }
                    .padding(.top, 0)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 20)
                }
            }
            .padding(.vertical, 20)
        }
    }
}

struct SearchBar: UIViewRepresentable {
    
    @Binding var text: String
    
    class Coordinator: NSObject, UISearchBarDelegate {
        @Binding var text: String
        
        init(text: Binding<String>) {
            _text = text
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            text = searchText
        }
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        searchBar.autocapitalizationType = .none
        searchBar.searchBarStyle = .minimal
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
        uiView.text = text
    }
}

struct CategoryData: Identifiable {
    var id = UUID().uuidString
    var categoryName: String
    var isExceeded = false
}

struct Search_Previews: PreviewProvider {
    static var previews: some View {
        Search().preferredColorScheme(.dark)
    }
}
