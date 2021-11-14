//
//  MovieItem.swift
//  MovieDB
//
//  Created by David on 11/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieItem: View {
    @StateObject var viewModel = ViewModel()
    
    let texto = "https://image.tmdb.org/t/p/w500/c24sv2weTHPsmDa7jEMN0m2P3RT.jpg"
    var item: Result
    var orientation : String
    
    var body: some View {
        VStack(alignment:.leading ){
            ZStack{
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                WebImage(url: URL(string: orientation == "horizontal" ? Constant.imagesBaseUrl+item.backdrop_path! : Constant.imagesBaseUrl+item.poster_path!  ?? ""))
                    .resizable()
            }
            .aspectRatio(orientation == "horizontal" ? 16/9 : 9/12, contentMode: .fit)
            .cornerRadius(8)
            .shadow(radius: 4)
            
            Text(item.title!)
                            .font(.system(size: 18, weight: .bold, design: .rounded))
                            .lineLimit(1)
            HStack {
                if !item.ratingText.isEmpty {
                    Text(item.ratingText).foregroundColor(.yellow)
                }
                Text(item.scoreText)
                    .foregroundColor(.black)
            }
//           WebImage(url: URL(string: imagesBaseUrl+item.poster_path! ?? ""))
//
//                .resizable()
//                .scaledToFit()
//                .frame(width: 320, height: 280)
//            Text(item.title!)
//                .font(.system(size: 18, weight: .bold, design: .rounded))
//                .lineLimit(2)
        }
    }
}

//struct MovieItem_Previews: PreviewProvider {
//    static var previews: some View {
//        MovieItem()
//    }
//}
