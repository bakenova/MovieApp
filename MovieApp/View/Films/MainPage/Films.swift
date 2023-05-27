//
//  Home.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.02.2023.
//

import SwiftUI

struct Films: View {
    
    @State private var tapCount = 0
    @State private var shouldDismiss = false
    
    // MARK: Animated View Properties
    @State var currentIndex: Int = 0
    @State var currentTab: String = "Films"
    
    //MARK: Detail View Properties
    @State var detailMovie: Movie?
    @State var showDetailView: Bool = false
    @State var currentCardSize: CGSize = .zero
    
    //@State var detailPageMovie: Movie?
    //@State var isActiveDetailPage: Bool = false
    
    //Environment values
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    @EnvironmentObject var userManager: UserManager
    //@StateObject var viewModel = FilmDetailViewModel()
    @Binding var isUserCurrentlyLoggedOut : Bool
    
    @ObservedObject private var vm = UserManager()
    @ObservedObject var viewModel = FilmDetailViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                NavBar(currentTab: $currentTab)
                    .padding(0)
                ZStack{
                    ZStack{
                        //Background
                        BGView()
                        //MARK: Main View Content
                        VStack{
                            ScrollView(.vertical, showsIndicators: false){
                                //NavBar
                                //NavBar(currentTab: self.$currentTab)
                                //Custum carousel
                                SnapCarousel(spacing: 20, trailingSpace: 150, index: $currentIndex, items: movies) { movie in
                                    GeometryReader { proxy in
                                        let size = proxy.size
                                        
                                        Image(movie.imageName)
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(15)
                                            .frame(width: size.width, height: size.height)
                                            .matchedGeometryEffect(id: movie.id, in: animation)
                                        //                                        .onTapGesture {
                                        //                                            isActiveDetailPage.toggle()
                                        //                                        }
                                            .onLongPressGesture(perform: {
                                                currentCardSize = size
                                                detailMovie = movie
                                                withAnimation(.easeInOut){
                                                    showDetailView = true
                                                }
                                            })
                                    }
                                }
                                .padding(.top, 100)
                                .frame(width: UIScreen.main.bounds.size.width, height: 450)
                                
                                //Custom indicator
                                customIndicator()
                                
                                customBlock(collectionName: "Popular", movies: viewModel.popularFilms)
                                
                                customBlock(collectionName: "Classic", movies: viewModel.classicFilms)
                                
                                customBlock(collectionName: "2010-2019", movies: viewModel.films2010)
                            }
                        }
                        .overlay{
                            if let movie = detailMovie, showDetailView {
                                DetailPlotView(movie: movie, detailMovie: $detailMovie, showDetailView: $showDetailView, currentCardSize: $currentCardSize, animation: animation)
                            }
                        }
                        .onAppear {
                            //addMovie()
                            viewModel.fetchMovies()
                        }
                    }.opacity(self.currentTab == "Films" ? 1 : 0)
                    Music().opacity(self.currentTab == "Music" ? 1 : 0)
                    Search().opacity(self.currentTab == "Search" ? 1 : 0)
                    Profile().opacity(self.currentTab == "Profile" ? 1 : 0)
                }
            }
        }
    }
    
    func addMovie() {
        viewModel.addMovie(movieTitle: "Diamond Sword",
                           imageName: "Movie5",
                           genre: "Drama, Action, History",
                           collection: ["Popular", "2010-2019"],
                           description: "Diamond Sword is a large-scale historical drama of first Kazakh Khans, which BBC called 'Kazakh Game Of Thrones'. The action takes place in the XV century, and the plot demonstrates the key events in formation of Kazakh statehood under the leadership of Khans Zhanibek and Kerey.",
                           cast: "Ghassan Massoud, Aizhan Lighg, Eduardo Minett, Yerden Telemissov, Almira Tursyn, Zarina Yeva",
                           director: "Emir Baigazin",
                           releaseDate: "2016",
                           ageLimit: "0+",
                           runtime: "133",
                           rating: 6.0,
                           ratingCount: 1,
                           reviews: [
                             Review(reviewTitle: "Great movie about Kazakh Horde!",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Valeria",
                                          email: "Valeria@mail.ru",
                                          firstName: "Valeria",
                                          lastName: "Askarova",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "For the Kazakh film industry, which still has little experience, this was a very excellent film.",
                                    reviewRate: "positive"),
                             Review(reviewTitle: "Kazakhskoye Khanstvo. Almaznyy Mech: A Dazzling Gem of Cinematic Brilliance",
                                    reviewAuthor: User(uid: "", username: "Ulan", email: "Ulan@mail.ru", firstName: "Ulan", lastName: "Ulanovich", phoneNumber: "77777777777"),
                                    reviewDescription: "Kazakhskoye Khanstvo. Almaznyy Mech (The Kazakh Empire: The Diamond Sword) is a true cinematic gem that captivates from start to finish. The film beautifully weaves together a gripping tale of heroism, cultural heritage, and epic battles. The stunning visuals and masterful storytelling transport the audience to the world of ancient Kazakhstan, immersing them in its rich history. With powerful performances and breathtaking action sequences, this film shines brightly, leaving a lasting impression on viewers.", reviewRate: "positive")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "Bury the Sins & Wash Them Clean: Baigazin Presents the Dysfunction of Isolation in Simmering Drama", criticismAuthor: User(uid: "", username: "Nicholas Bell", email: "Nicholas@mail.ru", firstName: "Nicholas", lastName: "Bell", phoneNumber: "77777777777"), criticismDescription: "Over the last decade, several prominent voices out of Kazakhstan have populated the international festival circuit, by this point enough for what could be classified as a New Kazakhstan Wave. Sergey Dvosrtsevoy and Adilkhan Yerzhanov both unleashed their latest features earlier this year and now find themselves joined by Emir Baigazin with his third title, The River. Building on a significant body of work documenting the experiences of children in dwindling rural expanses, as evidenced in celebrated earlier titles such as 2013’s Harmony Lessons and 2016’s The Wounded Angel, Baigazin presents a somber, meditative tale of five brothers growing up to resent their domineering father and emotionally distant mother in The River. Playing like the art-house intersection of Yorgos Lanthimos’ Dogtooth (2009) and David Gordon Green’s George Washington (2000), Baigazin presents a sedate portrait of dysfunction and eventual tragedy when archaic traditions are exposed unexpectedly to the modern world.", actorRate: 7, directingRate: 8, soundRate: 9, scriptRate: 8),
                              FilmCriticism(criticismTitle: "I hate him.", criticismAuthor: User(uid: "", username: " Roberto Matteucci", email: "Roberto@mail.ru", firstName: "Roberto", lastName: "Matteucci", phoneNumber: "77777777777"), criticismDescription: "Kazakhstan is the tenth largest country in the world - 2.7 million square kilometres - but it is scarcely inhabited - less than 19 million people - sixty-third in the world rankings. A vast steppe extends in the country. In the capital Almaty lives about 10% of the population. In the countryside and in the small villages huge spaces are predominant. The existence of the Kazakhs is surrounded by empty, arid, inhospitable land. The setting of Kazakhstan is important to understand the beautiful film Ozen - River by Kazakh director Emir Baigazin. It was presented at the 75th Venice International Film Festival, winning the prize for best direction for the Orizzonti competition.", actorRate: 6, directingRate: 6, soundRate: 7, scriptRate: 7)
                           ],
                           videoURL: "https://www.dropbox.com/s/qkwc2kw1pangewz/THE%20RIVER%20Trailer%20_%20TIFF%202018.mp4?raw=1"
                 )
        viewModel.addMovie(movieTitle: "Kazbat",
                           imageName: "Movie3",
                           genre: "Drama, War",
                           collection: ["Popular", "2010-2019"],
                           description: "This story is about human relationship and drama that takes place on the border of Tajikistan with Afghanistan. It tells about heroin traffic and ongoing military conflicts, hidden interests of governments, friendship, love and loss.",
                           cast: "Halyk Rakhat, Dauren Sergazin, Rinat Doshibekov, Sharifbek Zakirov",
                           director: "Askar Uzabayev",
                           releaseDate: "2019",
                           ageLimit: "0+",
                           runtime: "120",
                           rating: 7,
                           ratingCount: 1,
                           reviews: [
                             Review(reviewTitle: "It worth watching!",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Serikbol",
                                          email: "Serikbol@mail.ru",
                                          firstName: "Serik",
                                          lastName: "Bol",
                                          phoneNumber: "77777777777"
                                      ),
                                      reviewDescription: "Kazbat Soldiers delivers an adrenaline-fueled military experience that keeps viewers engaged throughout. With its gripping plot, intense action sequences, and solid performances, the film successfully captures the thrill and challenges of a dangerous mission. It's a compelling and immersive cinematic journey for fans of the genre.",
                                    reviewRate: "positive")
                                ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "Kazbat Soldiers: Misses the Mark on Action and Originality", criticismAuthor: User(uid: "", username: "Yertaev A", email: "Yertaev@mail.ru", firstName: "Yertaev", lastName: "Yertaev", phoneNumber: "77777777777"), criticismDescription: "Kazbat Soldiers falls flat in delivering an engaging military film experience. The predictable plot and one-dimensional characters leave little room for excitement or emotional investment. The action sequences lack intensity and fail to impress, while the overall lack of originality leaves the film feeling forgettable. It's a disappointing endeavor that fails to live up to its potential.", actorRate: 5, directingRate: 4, soundRate: 6, scriptRate: 4),
                              FilmCriticism(criticismTitle: "Great movie with great historical accuracy", criticismAuthor: User(uid: "", username: "AigulK", email: "AigulK@mail.ru", firstName: "Aigul", lastName: "Kairatovna", phoneNumber: "77777777777"), criticismDescription: "I believe this is one of the best Asian movies of this decade . Disney should see this one and learn how to create a strong woman lead character. Out of curiosity I watched it and my curiosity grew , I started reading lots of history books and this is a real story. Tomrys is a Scythian (now we know them as Turks) queen with lots of great backstory, unlike fake mulan . I love the horse riding war scenes very beautifully shot by director and acting was nothing close to what I was expecting it was very good( I expected bad acting like in chinese moVies) . Also one more reason why I loved this movie that it was shot like a real life situation , history is shown as it is written in credible history books ( mostly British historians seems to be more accurate on story due to indifference) . I suggest this to all history enthusiasts and war movie lovers.", actorRate: 10, directingRate: 9, soundRate: 8, scriptRate: 10)
                           ],
                           videoURL: "https://www.dropbox.com/s/l8lji2dr8ae8ke0/%D0%9A%D0%B0%D0%B7%D0%B1%D0%B0%D1%82%20-%20%D0%A2%D1%80%D0%B5%D0%B9%D0%BB%D0%B5%D1%80%201080p.mp4?raw=1"
                 )
    }
    
    //MARK: - Custom Blocks
    @ViewBuilder
    func customBlock(collectionName: String, movies: [Movie]) -> some View{
        ZStack{
            Rectangle()
                .fill(.white)
                .opacity(self.scheme == .dark ? 0 : 1)
                .cornerRadius(15)
                .padding(.bottom, 30)
            
            VStack{
                HStack(){
                    Text(collectionName)
                        .font(.title2.bold())
                    Spacer()
                    Button("See More"){}
                        .font(.system(size: 16, weight: .semibold))
                    //.foregroundColor(self.scheme == .dark ? .yellow : .purple)
                        .foregroundColor(.blue)
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(alignment: .top, spacing: 15){
                        ForEach(movies){ movie in
                            NavigationLink(destination: FilmDetails(viewModel: viewModel, film: movie, reviewed: !(movie.reviews?.isEmpty ?? true) ? false : true)) {
                                VStack(alignment: .leading){
                                    Image(movie.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .cornerRadius(15)
                                        .frame(width: 100, height: 150)
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
                    .padding(.bottom, 40)
                }
            }
        }
    }

//MARK: - Custom indicator
@ViewBuilder
func customIndicator() -> some View{
    HStack(spacing: 5){
        ForEach(movies.indices, id: \.self){ index in
            Rectangle()
            //.fill(currentIndex == index ? (self.scheme == .dark ? .yellow : .purple) : .gray.opacity(0.5))
                .fill(currentIndex == index ? .blue : .gray.opacity(0.5))
                .frame(width: currentIndex == index ? 10 : 6, height: currentIndex == index ? 10 : 6)
                .cornerRadius(25)
            
        }
    }
    .animation(.easeInOut, value: currentIndex)
    .padding(.bottom, 20)
}

// MARK: - Blurred Background
@ViewBuilder
func BGView() -> some View{
    GeometryReader{ proxy in
        let size = proxy.size
        
        TabView(selection: $currentIndex) {
            ForEach(movies.indices, id: \.self) { index in
                Image(movies[index].imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: size.width, height: size.height)
                    .clipped()
                    .tag(index)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .animation(.easeInOut, value: currentIndex)
        
        // Custom Gradient
        let color: Color = (scheme == .dark ? .black : .white)
        
        LinearGradient(colors: [
            .black,
            .clear,
            color.opacity(0.15),
            color.opacity(0.5),
            color.opacity(0.8),
            color,
            color
        ], startPoint: .top, endPoint: .bottom)
        
        // Blurred Overlay
        Rectangle()
            .fill(.ultraThinMaterial)
    }
    .ignoresSafeArea()
}
}

struct Films_Previews: PreviewProvider {
    static var previews: some View {
        Films(isUserCurrentlyLoggedOut: .constant(true))
            .preferredColorScheme(.dark)
    }
}

