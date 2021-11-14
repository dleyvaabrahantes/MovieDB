//
//  ListItemMovie.swift
//  MovieDB
//
//  Created by David on 11/13/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListItemMovie: View {
    var item: Result
    var body: some View {
        HStack(alignment: .top){
            WebImage(url: URL(string: Constant.imagesBaseUrl+item.backdrop_path!))
                .resizable()
                .scaledToFill()
                .frame(width: 80, height: 120)
                .cornerRadius(8)
                .shadow(radius: 4)
            VStack(alignment: .leading){
                Text(item.title ?? "")
                    .font(.title)
                HStack {
                    if !item.ratingText.isEmpty {
                        Text(item.ratingText).foregroundColor(.yellow)
                    }
                    Text(item.scoreText)
                }
                
            }
        }
    }
}

struct ListItemMovie_Previews: PreviewProvider {
    static var previews: some View {
        
        ListItemMovie(item: Result(backdrop_path: "/fCayJrkfRaCRCTh8GqN30f8oyQF.jpg", id: 0, overview: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi auctor ligula dui, sit amet fermentum enim varius sed. Cras ultrices sodales ullamcorper. Nulla accumsan laoreet est in malesuada. Ut elementum condimentum rutrum. Pellentesque in mi in lorem congue placerat id euismod nisi. Donec at lacus sem. Curabitur tristique, mi in tincidunt sagittis, felis nisl tempor arcu, sit amet commodo arcu leo a nulla. Vivamus blandit diam sit amet nulla feugiat, at ultricies turpis mollis. Curabitur eleifend pulvinar ultricies. Interdum et malesuada fames ac ante ipsum primis in faucibus. Phasellus at sapien eros. Nunc vel facilisis neque.", poster_path: "/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", release_date: "21-10-85", title: "The Awesome Movie",popularity: 7.0,vote_average: 3.0,voteCount: 2))
    }
}
