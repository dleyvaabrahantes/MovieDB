//
//  MoviewRow.swift
//  MovieDB
//
//  Created by David on 11/12/21.
//

import SwiftUI

struct MoviewRow: View {
    @StateObject var viewModel = ViewModel()
    var categoryName: String
    var orientation = "horizontal"
    var body: some View {
        VStack(alignment: .leading){
            Text(categoryName)
                .font(.title)
                .padding(.leading, 10)
                .padding(.top, 5)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 5){
                    ForEach(viewModel.movies!.sorted{
                        $0.popularity! < $1.popularity!
                    }, id: \.self){
                        item in
                        NavigationLink(destination: MovieDetail(item: item, orientation: orientation)){
                            MovieItem(item: item, orientation: orientation)
                                .frame(width: orientation == "horizontal" ? 272:200, height: orientation == "horizontal" ? 200: 380)
                                .padding(.leading, 16)
                            
                            
                        }
                    }
                    
                }
                
            }
            
            
        }
        
    }
}

struct MoviewRow_Previews: PreviewProvider {
    static var previews: some View {
        MoviewRow(categoryName: "Top Populated")
    }
}
