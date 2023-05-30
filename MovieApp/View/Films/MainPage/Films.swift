//
//  Home.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.02.2023.
//

import SwiftUI
import SDWebImageSwiftUI

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
                                SnapCarousel(spacing: 20, trailingSpace: 150, index: $currentIndex, items: viewModel.recommendations) { movie in
                                    GeometryReader { proxy in
                                        let size = proxy.size
                                        
                                        WebImage(url: URL(string: movie.imageName))
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .cornerRadius(15)
                                            .frame(width: size.width, height: size.height)
                                            .matchedGeometryEffect(id: movie.id, in: animation)
                                        
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
                                
                                customBlock(collectionName: "Action", movies: viewModel.actionFilms)
                                
                                customBlock(collectionName: "Comedy", movies: viewModel.comedyFilms)
                                
                                customBlock(collectionName: "Thriller", movies: viewModel.thrillerFilms)
                                
                                customBlock(collectionName: "Festival", movies: viewModel.festivalFilms)
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
        viewModel.addMovie(movieTitle: "5:32",
                           imageName: "https://dl.dropboxusercontent.com/s/0d68xvivs7j1ff7/1636639408_5-32-poster.jpg",
                           genre: "Crime, Thriller",
                           collection: ["General", "Thriller", "Popular"],
                           description: "A retired detective goes back to work to catch a maniac while remembering crime cases he investigated in 90s",
                           cast: "Tansholpan Kinzhembetova, Bakhtiyar Baiserik, Abilmansur Serikov, Almagul Sagyndyk, Zhalgas Jangazin, Kobylandy Bolat, Marat Amiraev",
                           director: "Alisher Utev",
                           releaseDate: "2021",
                           ageLimit: "21",
                           runtime: "40",
                           rating: 7.6,
                           ratingCount: 2,
                           reviews: [
                             Review(reviewTitle: "newly forming and post soviet identity fusion.",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Berik",
                                          email: "Berik@mail.ru",
                                          firstName: "Berik",
                                          lastName: "Berik",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "Brutal. Down to earth. Abundance of blood, nicotine and alcohol somewhat reminds dark Korean movies. Very interesting fusion of both post-soviet and asian/nomadic(?) brutality. With death penalties, executions, vendettas and rural Kazakh realities. Since I'm an avid 'criminal Russia' documentary viewer, most of the crime scenes were _really_ realistical and believable. Filming was excellent. Maybe investigators are somewhat onesided and straightforward, as well and action/solving of the cases as well is way too rushed, but, well, thats a matter of taste. Im personally way into slower and more sophisticated pace, but its me. So all in all 9 out of 10. Not for the sophistificated characters or scenario, but for the realism of crimes, daily rural life and straightforward brutality.",
                                    reviewRate: "positive")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "A Promising Concept Hindered by Execution", criticismAuthor: User(uid: "", username: "Jack Johnson", email: "Jack@mail.ru", firstName: "Jack", lastName: "Jack", phoneNumber: "77777777777"),
                              criticismDescription: "5:32, the TV series, introduces a unique concept with its real-time format, unfolding over 12 episodes in 24 consecutive hours. While the idea is intriguing, the execution falls short of its potential. The pacing often feels sluggish, and the storylines lack cohesion, resulting in a disjointed viewing experience. Despite some strong performances and occasional moments of tension, 5:32 struggles to maintain a consistent level of engagement, leaving audiences craving more substance and narrative coherence.", actorRate: 6, directingRate: 7, soundRate: 7, scriptRate: 6, approved: true)
                           ],

                           videoURL: "https://www.dropbox.com/s/hhs5978n74ffw98/%D0%9E%D1%84%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%82%D1%80%D0%B5%D0%B9%D0%BB%D0%B5%D1%80%20%D0%B2%D0%B5%D0%B1-%D1%81%D0%B5%D1%80%D0%B8%D0%B0%D0%BB%D0%B0%20%C2%AB5_32%C2%BB.mp4?raw=1"
                 )
        viewModel.addMovie(movieTitle: "Marika",
                           imageName: "https://dl.dropboxusercontent.com/s/x56nn03bc8o7xo2/photo_2023-05-30_01-59-57.jpg",
                           genre: "Thriller",
                           collection: ["General", "Thriller", "Popular"],
                           description: "Marika Vargosh is a girl with a dark past and a difficult present. An orphan with no education, she is forced to work in a brothel in order to have enough to live on.",
                           cast: "Alena Volokh, Bogdan Pynka, Alexandra Martins, Elisaveta Mikhaylenko, Ludmila Gulueva, Pavel Kondratyev, Ekaterina Sidorenko, Anton Zvonov, Vladimir Khomutov, Denis Cvetkov",
                           director: "Andrey Renkevich",
                           releaseDate: "2022",
                           ageLimit: "18",
                           runtime: "109",
                           rating: 9.9,
                           ratingCount: 2,
                           reviews: [
                             Review(reviewTitle: "A Heartfelt Portrait of Love and Resilience",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Nomad",
                                          email: "Nomad@mail.ru",
                                          firstName: "Nomad",
                                          lastName: "Nomad",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "Andrey Renkevich's Marika delivers a poignant and touching exploration of love and resilience in the face of adversity. The film beautifully captures the journey of its titular character, played with remarkable depth by the lead actress, as she navigates the challenges of life, love, and personal growth. With its compelling storytelling and genuine performances, Marika is a heartfelt cinematic experience that leaves a lasting impression.",
                                    reviewRate: "positive")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "A Promising Concept Hindered by Execution", criticismAuthor: User(uid: "", username: "Anna Strokova", email: "Anna@mail.ru", firstName: "Anna", lastName: "Strokova", phoneNumber: "77777777777"),
                              criticismDescription: "The struggle between good and evil is the eternal theme of literature, drama and cinema. Karaganda director Andrey Renkevich decided to ask the same question in his new film 'Marika'. A private screening of the tape with the participation of the film crew and the media was held at the Karaganda cinema 'Kinoplexx' yesterday, October 19. 'Marika' turned out to be graceful, different and lively: despite the fact that the vampires here are in traditional gothic outfits, and they go to the final battle with perfect looks - it's beautiful. And this is our cinema - created in Karaganda.", actorRate: 8, directingRate: 8, soundRate: 7, scriptRate: 8, approved: true),
                           ],

                           videoURL: "https://www.dropbox.com/s/ashtgfhdgygds4y/%D0%9E%D1%84%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%82%D1%80%D0%B5%D0%B9%D0%BB%D0%B5%D1%80%20%D0%9C%D0%B0%D1%80%D0%B8%D0%BA%D0%B0%202022%20-%20%D0%A0%D0%B5%D0%B6%D0%B8%D1%81%D1%81%D1%91%D1%80%20%D0%90%D0%BD%D0%B4%D1%80%D0%B5%D0%B9%20%D0%A0%D0%B5%D0%BD%D0%BA%D0%B5%D0%B2%D0%B8%D1%87%2C%20%D0%95%D0%BA%D0%B0%D1%82%D0%B5%D1%80%D0%B8%D0%BD%D0%B0%20%D0%A1%D0%B8%D0%B4%D0%BE%D1%80%D0%B5%D0%BD%D0%BA%D0%BE.mp4?raw=1"
                 )
        viewModel.addMovie(movieTitle: "Hacker",
                           imageName: "https://dl.dropboxusercontent.com/s/efm5q8f8prewke3/HD-wallpaper-hacker-2016-movie-poster.jpg",
                           genre: "Thriller, Crime, Drama",
                           collection: ["General", "Thriller", "Popular", "2010-2019"],
                           description: "With the help of his new friends Alex Danyliuk turns to a life of crime and identity theft.",
                           cast: "Callan McAuliffe, Lorraine Nicholson, Daniel Eric Gold, Clifton Collins Jr., Zachary Bennett, Vlada Verevko, Genadijs Dolganovs, Aidan Besu, Rian Michelsen, Kristian Truelsen, Allyson Pratt",
                           director: "Akan Satayev",
                           releaseDate: "2016",
                           ageLimit: "16",
                           runtime: "95",
                           rating: 6.1,
                           ratingCount: 4,
                           reviews: [
                             Review(reviewTitle: "Writer/director - uh oh....",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Alnur",
                                          email: "Kozybaev@mail.ru",
                                          firstName: "Alnur",
                                          lastName: "Alnur",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "I like a good hacker movie. This starts brilliantly - but goes nowhere and flounders around like a, er, flounder in a floundering thing. As others have said, it's not so much about hacking as about scamming. It's full of very poor research and just plain wrong technical stuff. Sigh. That there's 'something off' is so obvious but the characters don't twig. Uh oh... Dummies! Oh, and the film summary itself gives half the game away. Apart from that, the plot just did't hang together.",
                                    reviewRate: "negative"),

                            Review(reviewTitle: "Not a movie about 'hacking' in the traditional sense",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "AibekKK",
                                          email: "Karimovich@mail.ru",
                                          firstName: "Aibek",
                                          lastName: "Aibek",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "While the acting and dialogue was solid, this rather cliché and moralistic tale may leave some people with a sour taste in their mouth. It may leave an even worse after-taste when the (totally private) 'Federal Reserve' banking system, becomes its own bubble and then bursts, which is something that appears to have been building in the wake of the mortgage-bubble lead financial meltdown. If indeed these predictions are correct, and a worldwide economic collapse of far greater magnitude ensues, the US citizens will probably be told that it was all due to 'Russia', 'China', and 'Hackers operating out of Russia and China...who may be on their respective government's payroll'.",
                                    reviewRate: "neutral"),

                            Review(reviewTitle: "Great, but not about hacking",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "LauraV",
                                          email: "Laura@mail.ru",
                                          firstName: "Laura",
                                          lastName: "Laura",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "I saw this movie a few years ago. It was one of my favourites, before I became a software engineer. It's a great story and chain of events that leads to the center piece. A nice journey indeed, but this has nothing to do with hacking. I am giving it a 7 because of nostalgia. The real rating is more like a 5.9",
                                    reviewRate: "neutral")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "ANONYMOUS: Anarchy & Adolescence", criticismAuthor: User(uid: "", username: "SEAN K. CURETON", email: "CURETON@mail.ru", firstName: "SEAN", lastName: "CURETON", phoneNumber: "77777777777"),
                              criticismDescription: "Dedicated to defrauding the national bank that left his mother unemployed and financially destitute, Alex forms a partnership with local urban hustler Sye (Daniel Eric Gold), and together the two fast friends begin capitalizing on their collaborative skills in black market trading. However, the two accidentally bite off more than they can chew, and become attached to an FBI mole named Kira (Lorraine Nicholson), who surreptitiously helps them reach the enigmatic leader of the Dark Web named Zed (Clifton Collins Jr.).", actorRate: 6, directingRate: 6, soundRate: 7, scriptRate: 7, approved: true)
                           ],

                           videoURL: "https://www.dropbox.com/s/edruaccccb3equm/%D0%A5%D0%B0%D0%BA%D0%B5%D1%80%20%282016%29%20%D0%A0%D1%83%D1%81%D1%81%D0%BA%D0%B8%D0%B9%20%D1%82%D1%80%D0%B5%D0%B9%D0%BB%D0%B5%D1%80%20%D1%84%D0%B8%D0%BB%D1%8C%D0%BC%D0%B0%20%28HD%29.mp4?raw=1"
                 )
        viewModel.addMovie(movieTitle: "Alone",
                           imageName: "https://dl.dropboxusercontent.com/s/ktm8u2up63j0gj4/fcec5c4801564f42b19be13d8155.jpg",
                           genre: "Thriller, Drama",
                           collection: ["General", "Thriller", "Popular", "2010-2019", "Recommendation"],
                           description: "SHE is a young woman who lives in a big city. The only strange thing is that she is absolutely alone. There are no people, no sounds of the streets or nature. The only one who shares her solitude is her CHILD. But their world changes drastically when they notice signs of another inhabitant living in this strange city.",
                           cast: "Aisulu Azimbayeva, Yaroslav Stakhovsky, Anastasiya Vostrova",
                           director: "Akan Satayev",
                           releaseDate: "2017",
                           ageLimit: "16",
                           runtime: "70",
                           rating: 5.3,
                           ratingCount: 4,
                           reviews: [
                             Review(reviewTitle: "Pretty engaging",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Marina",
                                          email: "Marina@mail.ru",
                                          firstName: "Marina",
                                          lastName: "Rovcova",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "I stumbled upon the trailer for the movie 'Her' by chance on the eve of the December weekend. And the reason for viewing on the wide screen was prompted not only by the fact that it was filmed in Kazakhstan, but also by the fact that the character had some kind of psychological trauma. The director of the film is Akan Sataev, known for the film 'Racketeer' (2007). I drew on the number of actors, there are only three of them. The main role was given to Aisul Azimbayeva, known for the film 'Teacher' (2013). Yaroslav Stakhovsky, unknown to me, as he was filmed in Russia, for example, in Love-Carrot 3, Interns, etc. But for Anastasia Vostrova, the film turned out to be a debut.",
                                    reviewRate: "neutral"),

                            Review(reviewTitle: "It depends on what you compare it to...",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Irina",
                                          email: "Irina@mail.ru",
                                          firstName: "Irina",
                                          lastName: "Vracheva",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "For Kazakh cinema this film is a leap forward. Pretty perceptible. But with an objective assessment, this work is still rather weak and has a number of shortcomings. The plot is worthy of a good thriller, for this the authors - bravo! This is the case when you sit and wonder if there is a global disappointment or a brilliant ending at the end. The denouement is worthy, the hopes are justified. But... the acting game leaves much to be desired: the eyes lie, the state is not acquired internally, the viewer simply does not believe in the authenticity of emotions. Because they are not there - there is only a reading of the text, not felt by the gut.",
                                    reviewRate: "positive"),

                            Review(reviewTitle: "Loneliness from within",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Assel",
                                          email: "Assel@mail.ru",
                                          firstName: "Assel",
                                          lastName: "AsselAssel",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "The viewer is offered to plunge into the world of the main character and see through her eyes what emptiness and loneliness are. No wonder the film is called 'Alone' in English. This state is shown very precisely, in detail and, in my opinion, quite calmly, without unnecessary nerves (although elements of a thriller are also present, but this is not the main thing here). This is exactly how it feels when absolutely all people suddenly disappear from the house, from the city, from life, except for one, the most important, in this case, your only Child.",
                                    reviewRate: "positive")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "All troubles from our thoughts.", criticismAuthor: User(uid: "", username: "1Mashka", email: "Marina@mail.ru", firstName: "Marina", lastName: "Marina", phoneNumber: "77777777777"),
                              criticismDescription: "Throughout most of the film, we see only two people. Mother and daughter. We don't even know their names, who they are, who the father of the child is, whose apartment this is. You involuntarily ask yourself questions: where are other people, animals, and indeed a normal life in general? It becomes clear that this is all part of the human imagination. The film is mostly calm, overcast, makes you think. It lacked just a piece of thriller and drama. It was boring in places, I had to rewind.", actorRate: 4, directingRate: 4, soundRate: 4, scriptRate: 4, approved: true)
                           ],
                           videoURL: "https://www.dropbox.com/s/4q0bod1n6a3rg92/%D0%9E%D0%BD%D0%B0%20%282017%29%20%D0%A2%D1%80%D0%B5%D0%B9%D0%BB%D0%B5%D1%80%20HD.mp4?raw=1"
                 )
        
        viewModel.addMovie(movieTitle: "Bad bad winter",
                           imageName: "https://dl.dropboxusercontent.com/s/antdssns88d9if8/1599899221_tak-sebe-zima.jpg",
                           genre: "Thriller, Drama",
                           collection: ["General", "Festival", "Thriller", "Popular", "2010-2019"],
                           description: "A businessman's daughter has some unexpected guests - her former classmates. A happy reunion becoming more complicated when guests tells her that they need some money to cover the murder they've committed.",
                           cast: "Marat Abishev, Nurgul Alpysbayeva, Zhalgas Jangazin, Tair Magzumov, Raim Muhitdinov, Tolganay Talgat",
                           director: "Olga Korotko",
                           releaseDate: "2018",
                           ageLimit: "0",
                           runtime: "84",
                           rating: 7.5,
                           ratingCount: 2,
                           reviews: [
                             Review(reviewTitle: "Olga Korotko's debut looks extremely unsophisticated",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Karim",
                                          email: "Karim@mail.ru",
                                          firstName: "Karim",
                                          lastName: "Karim",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "In general, Olga Korotko's debut looks extremely unsophisticated. The problem again is that the director, apparently, conceived a drama about social stratification in modern Kazakhstani society and achieved this with techniques typical of beginner pseudo-arthouse domestic directors. If Briefly did not set the goal of making a “serious, author's film” and reduced her picture by thirty minutes, then “So-so Winter” could have turned out to be a completely tolerable hermetic thriller. However, the debutante relied on the psychologism of the story, but it is not in the film due to the sluggish acting (there is no chemistry between the characters for a second) and empty texts.",
                                    reviewRate: "neutral")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "QWFF ’19: Bad Bad Winter", criticismAuthor: User(uid: "", username: "J.B", email: "J.B@mail.ru", firstName: "J.B", lastName: "J.B", phoneNumber: "77777777777"),
                              criticismDescription: "What’s a little wealth redistribution between friends? You could also call it home invasion, armed robbery, and hostage-taking, but that would be too honest. Regardless, a group of old Kazakhstani friends will not be friends much longer in Olga Korotko’s Bad Bad Winter, which screens as part of the 2019 Queens World Film Festival. Dinara has returned to the provincial town of her school days to close out her recently deceased grandmother’s cozy cottage. Since leaving to study medicine in Astana, here fortunes have improved greatly and so have those of her businessman father. In contrast, the prospects of her old classmates have stayed as lousy as ever—or even gotten worse. Nevertheless, she is still sufficiently interested in her old flame Marat to spend the night with him. Regrettably, Marat happens to spy her granny’s rather sizable untapped stash of cash, so he returns the next day with his suspicious girlfriend Arai, and fellow schoolmates Aibek and Sanzhar, who are facing a potential murder charge along with Marat, if they cannot adequately grease the necessary official palms. Obviously, they intend to steal that cash Dinara subsequently tucked away, but finding it again will be trickier than Marat expected. For a while, everyone pretends this a just a soiree for old friends, but they eventually acknowledge what it really is: a home invasion. Of course, Dinara knew it all along. After all, she always was the smartest one in class. The strange is-this-a-thriller-or-isn’t tone of film’s first thirty minutes or so makes it hard to pigeonhole, but it is weirdly effective. Of course, it inevitably becomes clear this is indeed a rather dark crime drama, at which point Dinara strips away the pretenses and levels a withering moral judgment on her captors. It is too bad New York’s congressional delegation probably will not see Winter, because it depicts redistributionist class-warfare as the thuggery it is. Frankly, Aibek’s threats and justifications are uncomfortably similar to their own rhetoric. It is also telling how Dinara’s “guests” berate her one minute for wearing frumpy old clothes and then accuse her of lording her wealth over them. This is also a great example of a film helmed by a woman and powered by a formidable female lead, but it is not likely to turn up in surveys women-driven filmmaking. Regardless, Tolganay Talgat is absolutely riveting as Dinara. It is fiercely intelligent performance that covers an awful lot of physical and psychological ground. As the psychotic Aibek, Zhalgas Zhangazin exudes creepy malevolence. There is something deeply unsettling about his violent sense of entitlement, probably because it hits so close to home. Tair Magzumov manages to project an extremely weird pathos as the remorseful junkie, Sanzhar, while Nurgul Alpysbayeva further ratchets up the hothouse tension as the jealous Arai. With its confined setting and five principal characters, Winter has all the elements of the classic stage thriller. Korotko marshals them all quite effectively, but there is also some subtle social commentary (especially regarding the Kazakhstani justice system) woven in. Very highly recommended, Bad Bad Winter screens this Wednesday (3/27) during QWFF ’19.", actorRate: 4, directingRate: 4, soundRate: 4, scriptRate: 4, approved: true),
                           ],
                           videoURL: "https://www.dropbox.com/s/n4649vdbe493oyy/EXTRAIT%20%20-%20BAD%20BAD%20WINTER%20de%20Olga%20Korotko%20%28ACID%20Cannes%202018%29.mp4?raw=1"
                 )
        viewModel.addMovie(movieTitle: "The Crying Steppe",
                           imageName: "https://dl.dropboxusercontent.com/s/djuqg2cg1f5z2b5/1667419151_plach-velikoy-stepi-2021.jpg",
                           genre: "Drama",
                           collection: ["General", "Popular", "Festival", "Recommendation"],
                           description: "70% of indigenous population of Kazakhstan died during the Great Famine, artificially imposed on people in the 1920s by the Bolsheviks. Overcoming blind fear of death and despair, an eagle hunter Turar tries to save his family.",
                           cast: "Sayazhan Kulymbetova, Akylkhan Almasov, Dulyga Akmolda, Sergey Ufimtsev, Safuan Shaimerdenov, Adilet Zhangali, Aybar Tangyt, Rayana Daulet, Sagat Zhylgheldiyev,Aygerim Zhunisova",
                           director: "Marina Kunarova",
                           releaseDate: "2021",
                           ageLimit: "0",
                           runtime: "108",
                           rating: 7.5,
                           ratingCount: 4,
                           reviews: [
                             Review(reviewTitle: "It's important to remember the past",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Alua",
                                          email: "Alua@mail.ru",
                                          firstName: "Alua",
                                          lastName: "Alua",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "Watched this film recently, I was filled with so many different emotions. It is a very heavy film but it is important for us to remember our past and accept it so the same mistakes won't be made in a future. It is a miracle what a film company can do on a power of will and raw determination without the financial support from the government, just so the people could know and remember what their ancestors went through for them.",
                                    reviewRate: "positive"),

                                Review(reviewTitle: "Very important and courageous work",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "BekzhanNygmetov",
                                          email: "Nygmetov@mail.ru",
                                          firstName: "Bekzhan",
                                          lastName: "Nygmetov",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "The film touches on historically important topics of the Kazakh steppes. Shows all the harsh truth. Each story, each frame is filled with a touching drama. Although the film looks cheap from the technical point of view, its meaning and importance is much higher.",
                                    reviewRate: "positive"),

                                Review(reviewTitle: "we remember and will remember! a great movie!",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Omar",
                                          email: "Omar@mail.ru",
                                          firstName: "Omar",
                                          lastName: "Omar",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "The film shows the real history of our ancestors, the history of our people, our ancestors does not leave us indifferent! what they experienced is simply beyond words ,,,, 😞 We must know and remember our history!",
                                    reviewRate: "positive")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "Kazakhstan’s Oscar© 2020 Entry for Best Feature: ‘The Crying Steppe’ by Marina Kunarova", criticismAuthor: User(uid: "", username: "Sydney Levine", email: "Sydney_Levine@mail.ru", firstName: "Sydney", lastName: "Levine", phoneNumber: "77777777777"),
                              criticismDescription: "Kazakhstan has recently been making a big splash in the news and usually it is because of the antics of Borat or a recurring ad on CNN. ‘The Crying Steppe’, Kazakhstan’s official Oscar submission for Best International Feature Film and official Golden Globe submission for Best Motion Picture — Foreign Language, directed by Marina Kunarova, is exactly the opposite. Marina Kunarova is the first female director from the former Soviet Union countries to ever have a film officially submitted for the Best International Film Academy Award. The film is based upon true events that befell Kazakhstan during the 1920s and 1930s ordered by Stalin.", actorRate: 8, directingRate: 7, soundRate: 7, scriptRate: 9, approved: true)
                           ],
                           videoURL: "https://www.dropbox.com/s/eihya5mtd6brdzp/Trailer%20_%20The%20Crying%20Steppe%20_.mp4?raw=1"
                 )
        viewModel.addMovie(movieTitle: "Mariam",
                           imageName: "https://dl.dropboxusercontent.com/s/6gm9y5xkygzx7h8/610x900_47353.jpg",
                           genre: "Drama",
                           collection: ["General", "Popular", "2010-2019", "Festival"],
                           description: "In Zhanash, a far-away village nestled on the Kazakh Steppe, 400 kilometers away from Almaty - and another three kilometers by foot on a dirt path off the main road - Mariam (Meruert Sabbusinova) lives with her husband and four young children in a home without light and water. One winter day, her husband disappears without a trace. Because there is no body, he cannot be officially declared dead. As a result, Mariam cannot receive state financial support. A very reserved person who buries her emotions deep inside, Mariam, alone, must take survival into her own hands. The experience changes her. Then, just as everything has begun to fall into place, her husband suddenly returns as if nothing has happened and expects life to continue as before.",
                           cast: "Meruert Sabbusinova, Hamza Koksebek, Almas Bektibayev, Edihe Ahmet",
                           director: "Sharipa Urazbayeva",
                           releaseDate: "2019",
                           ageLimit: "0",
                           runtime: "75",
                           rating: 5.6,
                           ratingCount: 2,
                           reviews: [
                             Review(reviewTitle: "Kazakhsplotation",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Kuralay",
                                          email: "Kuralay@mail.ru",
                                          firstName: "Kuralay",
                                          lastName: "Kuralay",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "This is speculation, this film was created with an expectation exclusively for the festival audience. The film does not convey the reality of Kazakhstan.",
                                    reviewRate: "negative")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "Mariam", criticismAuthor: User(uid: "", username: "Sheila Seacroft", email: "Sheila_Seacroft@mail.ru", firstName: "Sheila", lastName: "Seacroft", phoneNumber: "77777777777"),
                              criticismDescription: "Mariam lives on a tiny farm on the Kazakh steppe, many miles away from a town, some distance down a path from a dirt road. There are few rooms, little heating, and the only electricity, sufficient for a couple of hours a day, comes from a rudimentary solar generator. When her husband rides off and doesn’t return, she’s left with only her young son to help with the farm business, looking after cattle for the landowner. When a smaller girl and a baby emerge from the bedroom and we learn there is also an older brother in boarding school in the town, we realise the enormity of her situation, especially when the landowners take away their cattle, her only source of income. This stunning debut feature from young Kazakh director Urazbayeva is all the more impressive when you know the background. Meruert Sabbusinova, who plays Mariam, inspired the whole thing after Urazbayeva came across her during the making of a TV documentary, and the basis of the plot is her own predicament when her husband disappeared and she was left without help to rear her children alone. Urazbayeva made the film with her own money, using non-professional actors. For Mariam a trip to the police station in town brings the shattering news that she is not entitled to any help unless her husband is proved to be dead. Officialdom is not unfriendly but the already evident patriarchal nature of Kazakh society makes an ugly appearance in the policeman’s jokey supposition that her husband’s left her for another woman. Sabbusinova’s situation, shockingly displayed like the documentary it actually is, is then developed into a plot which throws up moral dilemmas when an old school friend attempts to help, and Mariam, cheating the rotten system, gains something of a life for herself. For the first time we see her smile, and confidence and signs of a rather more liberated lifestyle follow. But the husband returns… Shot in realist documentary fashion, we feel every physical effort of mother and son – even the sheep-killing scene is real (the meat subsequently providing a meal for the film cast and crew). The wind blows comfortlessly over the grassland, the cold is palpable, and there are many moments of sheer poetry, bleak though it is, by superb cinematographer Samat Sharipov. Opening shots smack you in the face with wind-lashed yellow grass across a monochrome landscape and the disturbing sound of Mariam’s despairing cries for her husband. And in the final shot the whiteness of snowflakes has joined the palette. It’s winter, even more bleak than before. Mariam was among a week-long series of films streamed free in late October by The Calvert 22 Foundation, which via the online Calvert Journal showcases contemporary culture in the ‘New East’, the area of Eastern Europe, Balkans and Central Asia.", actorRate: 7, directingRate: 6, soundRate: 5, scriptRate: 4, approved: false),
                           
                           ],
                           videoURL: "https://www.dropbox.com/s/qvirws5qxdop4id/MARIAM%20Trailer%20_%20TIFF%202019.mp4?raw=1"
                 )
        viewModel.addMovie(movieTitle: "Sunflower",
                           imageName: "https://dl.dropboxusercontent.com/s/f4lelwqf9ksar94/138959.jpg",
                           genre: "Drama",
                           collection: ["General", "Popular", "Festival"],
                           description: "Teenager Amir hides from reality in his virtual world. Unlike problems at home and at school, everything in the game is simple and clear. However, conflicts are piling up, also due to attachment to such a digital escape.",
                           cast: "Yerkebulan Daiyrov, Kirill Käro, Sloboda Micalovic, Rashid Musin, Adiya Mussina",
                           director: "Elya Gilman",
                           releaseDate: "2021",
                           ageLimit: "0",
                           runtime: "98",
                           rating: 7.2,
                           ratingCount: 2,
                           reviews: [
                             Review(reviewTitle: "Kazakhsplotation",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Viktoriya",
                                          email: "Viktoriya@mail.ru",
                                          firstName: "Viktoriya",
                                          lastName: "Pestova",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "I want to know at least something about the fate of this film ... but there is nothing on the network other than the fact that it began to be filmed. Now it has become known that the film was supposed to participate in the Asian Film Festival in Barcelona (Spain), but due to quarantine, the festival was canceled. There is no trailer, nothing. Kazakhfilm does not respond to inquiries.",
                                    reviewRate: "negative")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "Remarkable", criticismAuthor: User(uid: "", username: "Lara", email: "Lara@mail.ru", firstName: "Lara", lastName: "Croft", phoneNumber: "77777777777"),
                              criticismDescription: "'SUNFLOWER' is a remarkable illustration of how the message of Art can be universal. Although the story you tell takes place in a country the culture and landscapes of which can seem very remote to some, audiences and Festival Juries worldwide have been very receptive to it.", actorRate: 7, directingRate: 6, soundRate: 5, scriptRate: 4, approved: false),
                           
                           ],
                           videoURL: "https://www.dropbox.com/s/xdjrsos6oxdzbji/%D0%9F%D0%BE%D0%B4%D1%81%D0%BE%D0%BB%D0%BD%D1%83%D1%85%20-%20%D0%A2%D1%80%D0%B5%D0%B9%D0%BB%D0%B5%D1%80.mp4?raw=1"
                 )
        viewModel.addMovie(movieTitle: "A Dark, Dark Man",
                           imageName: "https://dl.dropboxusercontent.com/s/u1qte170pqtejvd/lowposter.png",
                           genre: "Drama, Crime",
                           collection: ["General", "Popular", "Festival", "Recommendation"],
                           description: "A boy is killed in an aul (Kazakh village). Detective Bekzat wants to end an investigation quickly: a crime perpetrator is already found by local police officers after all.",
                           cast: "Daniyar Alshinov, Dinara Baktybaeva, Teoman Khos",
                           director: "Adilkhan Yerzhanov",
                           releaseDate: "2019",
                           ageLimit: "0",
                           runtime: "130",
                           rating: 6.8,
                           ratingCount: 4,
                           reviews: [
                             Review(reviewTitle: "Original and expansive film",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Talgat",
                                          email: "Talgat@mail.ru",
                                          firstName: "Talgat",
                                          lastName: "Talgatovich",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "Several sites (but not IMDB) state that this is a crime drama of three episodes. It might be usefully considered that way as the length of the film makes viewing all in one go difficult on the small screen. Indeed, this is how I watched it - I took short breaks at more or less one third intervals. The overall impression of the film was vastness, the huge landscapes with their mountainous background and the interminable roads that seemed to go on forever with no sign of life beside them. The way the film was shot accentuates this. Long shots, panning at times but otherwise remaining still to take in the action amidst the wilderness. There is barely a close up until the shocking events at the end. Even then, the camera seems distanced somehow. As a study of utter corruption in both the police force and in daily life where a local mafia rules the roost, the film is a shocking indictment of its society and country. That life is so cheap in Kazakhstan enabling totally innocent 'suspects' to be bumped off to allow local gang leaders to practice their perversions is astonishing. Those who want to change this are given short shrift. Arianna is bundled away in disgrace, accused of crimes she never committed. Bekzat realises after his Damascene conversion that the only way to fight back is their way - Ariana returns too late to save him from a cycle of retribution and violence. A special mention for the actor playing the simpleton Pukuar. Clearly a good-looking guy, his transformation in the film into a slack jawed disabled figure was a revelation. As I said, I watched on the small screen and needed a couple of breaks. However, on the silver screen the cinematography would be so fascinating that I'm sure my eyes couldn't leave the action for a moment.",
                                    reviewRate: "positive"),

                                Review(reviewTitle: "Grandiose",
                                    reviewAuthor:
                                     User(uid: "",
                                          username: "Marat_Kudaibergen",
                                          email: "Kudaibergen@mail.ru",
                                          firstName: "Marat",
                                          lastName: "Kudaibergen",
                                          phoneNumber: "77777777777"),
                                    reviewDescription: "But not for all audiences though. I found here some elements from the Takeshi Kitano's atmosphere, offbeat, downbeat, with a huge amount of finesse and sensitivity. Hard to follow for action fans and impossible to watch for blockbusters addicts. Superb ending. So shame that not more users have seen it.",
                                    reviewRate: "positive")
                           ],
                           criticisms: [
                              FilmCriticism(criticismTitle: "FILM REVIEW: A DARK, DARK MAN", criticismAuthor: User(uid: "", username: "RobAldam", email: "RobAldam@mail.ru", firstName: "RobAldam", lastName: "RobAldam", phoneNumber: "77777777777"),
                              criticismDescription: "During the dissolution of the Soviet Union at the end of the twentieth century, most of the satellite states took the opportunity to declare their independence. As Russia gradually dipped its toes into capitalism, other nations took their own paths. Today, mostly thanks to oil and gas production, Kazakhstan dominates Central Asia. However, political reforms still lag behind and an authoritarian government has created a kind of new Wild West in the countryside. A Dark, Dark Man exists within this ecosystem. Detective Bekzat (Daniar Alshinov) is sent to investigate the murder of a child in a rural Kazak village. A local policeman has found a man who has confessed to committing the crime, so there’s no need for an investigation. It’s an open and shut case which can be closed quickly. If the suspect commits suicide in custody, what can he do? This all changes when a journalist (Dinara Baktybaeva) arrives from the city, asking awkward questions. Bekzat has to do his job properly for the first time in his life. A Dark, Dark man is a slow-burning crime drama which draws on the likes of Once Upon a Time in Anatolia and Memories of Murder but with a uniquely Kazak spin. Director Adilkhan Yerzhanov is becoming a regular on the European film festival circuit and his pessimistic spin on the corruption and oppression in his country is once again explored with dark humour and brutal frankness. A Dark, Dark Man is another wonderful and assured descent into the darkness.", actorRate: 7, directingRate: 6, soundRate: 5, scriptRate: 4, approved: true),
                      
                                FilmCriticism(criticismTitle: "FILM REVIEW: A DARK, DARK MAN", criticismAuthor: User(uid: "", username: "ANASTASIA ELEFTHERIOU", email: "ANASTASIA@mail.ru", firstName: "ANASTASIA", lastName: "ELEFTHERIOU", phoneNumber: "77777777777"),
                              criticismDescription: "Director Adilkhan Yerzhanov started off his career with a refreshingly absurdist cinematographic style. In his early films, such as Constructors (2013) and The Owners (2014), Yerzhanov’s modernist approach to narrative, defined by self-consciousness and irony, broke with the naturalistic norms of European art-house cinema. The films presented its viewers with the kind of tongue-in-cheek experimentation reminiscent of the New Wave directors of Czechoslovakia (and perhaps also of the Greek Weird Wave). Constructors, a story of three siblings who get kicked out of their flat because they can no longer pay their rent, shunned psychological realism to concentrate on the powerlessness of law and the absurdity of property rights. These satirical elements, while not entirely absent, nevertheless make sway for more verisimilitude in Yerzhanov’s A Dark-Dark Man, which premiered at the San Sebastian film festival in 2019.", actorRate: 7, directingRate: 7, soundRate: 6, scriptRate: 8, approved: true),
                      
                           ],
                           videoURL: "https://www.dropbox.com/s/4g9ifm029zxvyvp/%D0%A7%D0%B5%D1%80%D0%BD%D1%8B%D0%B9%2C%20%D1%87%D0%B5%D1%80%D0%BD%D1%8B%D0%B9%20%D1%87%D0%B5%D0%BB%D0%BE%D0%B2%D0%B5%D0%BA%20-%20%D0%BE%D1%84%D0%B8%D1%86%D0%B8%D0%B0%D0%BB%D1%8C%D0%BD%D1%8B%D0%B9%20%D1%82%D1%80%D0%B5%D0%B9%D0%BB%D0%B5%D1%80%20%28%D0%B2%D0%B5%D1%80%D1%81%D0%B8%D1%8F%20%D0%B1%D0%B5%D0%B7%20%D1%81%D1%83%D0%B1%D1%82%D0%B8%D1%82%D1%80%D0%BE%D0%B2%29.mp4?raw=1"
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

