//
//  MovieDetail.swift
//  MovieDB
//
//  Created by David on 11/14/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieDetail: View {
    var item: Result
    var orientation: String
    
    var body: some View {
        VStack{
            VStack(alignment:.leading ){
                ZStack{
                    Rectangle()
                        .fill(Color.gray.opacity(0.3))
                    WebImage(url: URL(string: orientation == "horizontal" ? Constant.imagesBaseUrl+item.backdrop_path! : Constant.imagesBaseUrl+item.poster_path!  ?? ""))
                        .resizable()
                }
                .aspectRatio( 16/9, contentMode: .fit)
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
            }
        }
         Spacer()
        }
        
        
    
}

struct MovieDetail_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(item: Result(backdrop_path: "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg", id: 0, overview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi auctor ligula dui, sit amet fermentum enim varius sed. Cras ultrices sodales ullamcorper. Nulla accumsan laoreet est in malesuada. Ut elementum condimentum rutrum. Pellentesque in mi in lorem congue placerat id euismod nisi. Donec at lacus sem. Curabitur tristique, mi in tincidunt sagittis, felis nisl tempor arcu, sit amet commodo arcu leo a nulla. Vivamus blandit diam sit amet nulla feugiat, at ultricies turpis mollis. Curabitur eleifend pulvinar ultricies. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus at sapien eros. Nunc vel facilisis neque.", poster_path: "/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", release_date: "21-10-85", title: "The Awesome Movie",popularity: 7.0,vote_average: 3.0,voteCount: 2), orientation: "horizontal")
    }
}
