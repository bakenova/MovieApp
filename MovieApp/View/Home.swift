////
////  Home.swift
////  MovieApp
////
////  Created by Арайлым Бакенова on 01.03.2023.
////
//
//import SwiftUI
//
//struct Home: View {
//    @State var currentTab: String = "Films"
//    @Environment(\.colorScheme) var scheme
//    
//    var body: some View {
//        ZStack(alignment: .center){
//            ZStack{
//                Films().opacity(self.currentTab == "Films" ? 1 : 0)
//                Music().opacity(self.currentTab == "Music" ? 1 : 0)
//                Profile().opacity(self.currentTab == "Profile" ? 1 : 0)
//                Search().opacity(self.currentTab == "Search" ? 1 : 0)
//            }
//            .cornerRadius(self.currentTab == "Comics" ? 15 : 0, corners: [.topLeft, .topRight])
//            .ignoresSafeArea()
//            //.padding(.top, 60)
//             
////            VStack{
////                NavBar(currentTab: $currentTab)
////                    .padding(0)
////                Spacer()
////            }
//        }
//    }
//}
//
//
//struct Home_Previews: PreviewProvider {
//    static var previews: some View {
//        Home()
//            .preferredColorScheme(.dark)
//    }
//}
//
//struct RoundedCorner: Shape {
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}
//
//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//}
