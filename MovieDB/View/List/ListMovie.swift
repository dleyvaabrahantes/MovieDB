//
//  ListMovie.swift
//  MovieDB
//
//  Created by David on 11/13/21.
//

import SwiftUI

struct ListMovie: View {
    @StateObject var viewModel = ViewModel()
    @State private var searchtext = ""
    
    var body: some View {
        NavigationView{
            
            List{
                
                ForEach(searchResults, id: \.self){ item in
                    NavigationLink(destination: {
                        EmptyView()
                    }, label: {
                        ListItemMovie(item: item)
                            .padding(.top,5)
                    })
                }
                
            }
            .searchable(text: $searchtext,prompt: "Enter title name movie...")
            .navigationTitle("Find")
        }
        
    }
    var searchResults: [Result] {
        if searchtext.isEmpty {
            return viewModel.movies!
        } else {
            return viewModel.movies!.filter { $0.title!.contains(searchtext) }
        }
    }
}

struct ListMovie_Previews: PreviewProvider {
    static var previews: some View {
        ListMovie()
    }
}
