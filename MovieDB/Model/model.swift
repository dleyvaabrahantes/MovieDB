//
//  model.swift
//  MovieDB
//
//  Created by David on 11/12/21.
//

import Foundation

struct Result: Decodable, Hashable {
    
    var backdrop_path: String?
    var id: Int?
    //var genres: [Genre]?
    var overview: String?
    var poster_path: String?
    var release_date: String?
    var runtime: Int?
    var title: String?
    
    let popularity: Double?
    
    let vote_average: Double?
    let voteCount: Int?
    
    
    var ratingText: String {
        let rating = Int(vote_average ?? 0.0)
        let ratingText = (0..<rating).reduce("") { (acc, _) -> String in
            return acc + "★"
        }
        return ratingText
    }
    
    var scoreText: String {
        guard ratingText.count > 0 else {
            return "n/a"
        }
        return "\(ratingText.count)/10"
    }
}

struct Response: Decodable {
    var page: Int?
    var results: [Result]?
    var totalResults: Int?
    var totalPages: Int?
}



struct Constant{
    static let imagesBaseUrl = "https://image.tmdb.org/t/p/w500"
    static let api = "a2ee2cca0adf4dd900e7c0dfa94c5dae"
    static let baseUrl = "https://api.themoviedb.org/4"
}

