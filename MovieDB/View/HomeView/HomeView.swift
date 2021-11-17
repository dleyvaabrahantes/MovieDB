//
//  HomeView.swift
//  MovieDB
//
//  Created by David on 11/12/21.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    
                        MoviewRow(categoryName: "Popular",orientation: "vertical")
                        MoviewRow(categoryName: "Top Rated")
                       MoviewRow(categoryName: "Upcoming")
                    
                   
                }
            }
            .navigationBarTitle("MovieDB")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
