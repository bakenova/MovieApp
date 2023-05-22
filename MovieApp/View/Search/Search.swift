//
//  Search.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 02.03.2023.
//

import SwiftUI

struct Search: View {
    
    @StateObject var viewModel = FilmDetailViewModel()
    @State var currentTab: String = "Search"
    @State private var searchText = ""
    @State private var selectedTab = 0
    @State private var isEditing = false
    @State var categoryList: [[CategoryData]] = [
        [
            CategoryData(categoryName: "Genres"),
            CategoryData(categoryName: "Release years"),
            CategoryData(categoryName: "Awards"),
            CategoryData(categoryName: "Directions")
        ]
    ]
    
    @Environment(\.colorScheme) var scheme
    
    let items: [Movie] = movies
    let itemsM: [Song] = songCollection
    
    let movieList: [MovieSelection] = movieSelectionLists
    let musicList: [MusicSelection] = musicCollectionTopPick
    
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
                            List(items.filter({ searchText.isEmpty ? true : $0.movieTitle.localizedCaseInsensitiveContains(searchText) })) { item in
                                NavigationLink(destination: FilmDetails(viewModel: viewModel, film: item)) {
                                    MovieListView(item: item)
                                }
                            }
                        } else {
                            List(itemsM.filter({ searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText) })) { item in
                                NavigationLink(destination: SongDetailView(song: item)) {
                                    MusicHListView(item: item)
                                }
                            }
                        }
                        
                    }
                    else {
                        ScrollView {
                            VStack{
                                HStack(){
                                    Text("Recommended to Watch")
                                        .font(.title3.bold())
                                    Spacer()
                                    Button("See More"){}
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.blue)
                                }
                                .padding(.top, 20)
                                .padding(.horizontal, 20)

                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack(alignment: .top, spacing: 12){
                                        ForEach(movieList.prefix(3)){ selection in
                                            NavigationLink(destination: FilmListView()) {
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .fill(.ultraThinMaterial)
                                                        .frame(width: proxy.size.width - 220,
                                                               height: 180,
                                                               alignment: .leading)

                                                    VStack(alignment: .center, spacing: 5){
                                                        Image(selection.imageName)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .cornerRadius(15)
                                                            .frame(width: proxy.size.width - 200, height: 100)

                                                        Text(selection.title)
                                                            .font(.system(size: 16))
                                                            .fontWeight(.bold)
                                                            .foregroundColor(self.scheme == .dark ? .white : .black)
                                                            .frame(width: proxy.size.width - 250, height: 40)
                                                            .padding(.top, 8)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    .padding(.top, 0)
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 20)
                                }
                            }

//                            VStack(alignment: .leading, spacing: 10){
//                                HStack(){
//                                    Text("Categories")
//                                        .font(.title3.bold())
//                                    Spacer()
//                                    Button("See More"){}
//                                        .font(.system(size: 16, weight: .semibold))
//                                        .foregroundColor(.orange)
//                                }
//                                .padding(.top, 20)
//                                //.padding(.horizontal, 20)
//
//                                ForEach(categoryList.indices, id: \.self) { index in
//                                    HStack {
//                                        ForEach(categoryList[index].indices, id: \.self) { categoryIndex in
//                                            Text(categoryList[index][categoryIndex].categoryName)
//                                                .lineLimit(1)
//                                                .fontWeight(.semibold)
//                                                .padding(.vertical, 10)
//                                                .padding(.horizontal)
//                                                .background(Capsule().stroke(Color.orange))
//                                                .overlay(
//                                                    GeometryReader { reader -> Color in
//                                                        let maxX = reader.frame(in: .global).maxX
//
//                                                        if maxX > UIScreen.main.bounds.width - 50 && !categoryList[index][categoryIndex].isExceeded {
//                                                            DispatchQueue.main.async {
//                                                                categoryList[index][categoryIndex].isExceeded = true
//                                                                let lastItem = categoryList[index][categoryIndex]
//                                                                categoryList[index].remove(at: categoryIndex)
//                                                                categoryList.append([lastItem])
//                                                            }
//                                                        }
//                                                        return Color.clear
//                                                    }, alignment: .trailing
//                                                )
//                                                .clipShape(Capsule())
//                                        }
//                                    }
//                                }
//                            }.padding()

                            VStack{
                                HStack(){
                                    Text("Recommended to Listen")
                                        .font(.title3.bold())
                                    Spacer()
                                    Button("See More"){}
                                        .font(.system(size: 16, weight: .semibold))
                                        .foregroundColor(.orange)
                                }
                                .padding(.top, 20)
                                .padding(.horizontal, 20)

                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack(alignment: .top, spacing: 12){
                                        ForEach(musicList.prefix(3)){ selection in
                                            NavigationLink(destination: PlaylistView(playlist: selection)) {
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 15)
                                                        .fill(.ultraThinMaterial)
                                                        .frame(width: proxy.size.width - 220,
                                                               height: 180,
                                                               alignment: .leading)

                                                    VStack(alignment: .center, spacing: 5){
                                                        Image(selection.imageName)
                                                            .resizable()
                                                            .aspectRatio(contentMode: .fit)
                                                            .cornerRadius(15)
                                                            .frame(width: proxy.size.width - 200, height: 100)

                                                        Text(selection.title)
                                                            .font(.system(size: 16))
                                                            .fontWeight(.bold)
                                                            .foregroundColor(self.scheme == .dark ? .white : .black)
                                                            .frame(width: proxy.size.width - 250, height: 40)
                                                            .padding(.top, 8)
                                                    }
                                                }
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 20)
                                }
                            }
                        }
                    }
                }
            }
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
