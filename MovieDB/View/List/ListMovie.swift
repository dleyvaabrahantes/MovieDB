//
//  ListMovie.swift
//  MovieDB
//
//  Created by David on 11/13/21.
//

import SwiftUI

struct ListMovie: View {
    @StateObject var viewModel = ViewModel()
    @State private var showFavoritesOnly = true
    
    var body: some View {
        NavigationView{
//        ScrollView(showsIndicators: false){
//            VStack(alignment: .leading){
//                ForEach(viewModel.movies!, id: \.self){ item in
//                    ListItemMovie(item: item)
//
//                }
//            }
//        }
            List{
                
                Toggle(isOn: $showFavoritesOnly) {
                                    Text("Favorites only")
                }
                ForEach(viewModel.movies!, id: \.self){ item in
                    NavigationLink(destination: {
                        EmptyView()
                    }, label: {
                        ListItemMovie(item: item)
                            .padding(.top,5)
                    })
            }
                
            }
        .navigationTitle("FInd")
        }
        
    }
}

struct ListMovie_Previews: PreviewProvider {
    static var previews: some View {
        ListMovie()
    }
}
