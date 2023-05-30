//
//  FilmCriticism.swift
//  MovieApp
//
//  Created by Арайлым Бакенова on 25.05.2023.
//

import SwiftUI

struct FilmCriticismView: View {
    @Environment(\.colorScheme) var scheme
    
    let criticism: FilmCriticism
    
    var body: some View {
        GeometryReader{ proxy in
            let size = proxy.size
            VStack(alignment: .leading, spacing: 5){
                HStack(spacing: 10){
                    Image("user")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                    Text(criticism.criticismAuthor.username ?? "")
                        .bold()
                        .font(.system(size: 24))
                        .fontWeight(.bold)
                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                }
                .padding(.top, 10)
                .padding(.horizontal, 16)
                
                HStack{
                    VStack(alignment: .leading){
                        HStack{
                            Text("Actor play:")
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                            Text("\(criticism.actorRate)/10")
                                .font(.system(size: 16))
                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        }
                        HStack{
                            Text("Directing:")
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                            Text("\(criticism.directingRate)/10")
                                .font(.system(size: 16))
                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        }
                    }
                    Spacer()
                    VStack(alignment: .leading){
                        HStack{
                            Text("Sound Engineering:")
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                            Text("\(criticism.soundRate)/10")
                                .font(.system(size: 16))
                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        }
                        
                        HStack{
                            Text("Literecy of the script:")
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                            Text("\(criticism.scriptRate)/10")
                                .font(.system(size: 16))
                                .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        }
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 20)
                
                VStack(alignment: .leading){
                    Text(criticism.criticismTitle)
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 16)
                        .padding(.top, 24)
                    
                    Text(criticism.criticismDescription)
                        .font(.system(size: 16, weight: .regular))
                        .foregroundColor(self.scheme == .dark ? .white.opacity(1) : .black)
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 16)
                        .padding(.top, 10)
                }.frame(width: size.width - 24)
            }
            .navigationBarTitle("", displayMode: .inline)
        }
    }
}

struct FilmCriticismView_Previews: PreviewProvider {
    static var previews: some View {
        FilmCriticismView(criticism: FilmCriticism(criticismTitle: "The title example", criticismAuthor: User(uid: "", username: "kairatov", email: "kairatovk@mail.ru", firstName: "Kairat", lastName: "Kairatov", phoneNumber: "77777777777"), criticismDescription: "This film tells how kazakh ancestors fought against the Dzungars in the first half of the 18th century, and how the heroism of kazakhs became a decisive force for us to gain freedom.", actorRate: 4, directingRate: 5, soundRate: 6, scriptRate: 7, approved: true)).preferredColorScheme(.dark)
    }
}
