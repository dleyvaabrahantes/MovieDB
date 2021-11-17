//
//  viewModel.swift
//  MovieDB
//
//  Created by David on 11/12/21.
//

import Foundation



class ViewModel: ObservableObject {
    @Published var movies:[Result]? = []
    
    
    @Published var offset: Int = 1
    @Published var problem = ""
    
    
    init(){
        
        self.requestCode()
    }
    
    func requestCode() {
        let url = URL(string: "https://api.themoviedb.org/4/list/1?page=\(offset)&api_key=\(Constant.api)")!
        let request = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: request) {(data, response, error) in
    
            if let error = error{
                
                print(error.localizedDescription)
                return
            }
            
            guard let jsonData = data else {
                print("Data not found")
                return
            }
            do{
                let moviesRequest = try JSONDecoder().decode(Response.self, from: jsonData)
                DispatchQueue.main.async {
                    
                    self.movies = moviesRequest.results
                }
                
            }catch{
                
                print(error.localizedDescription)
            }
        }
        task.resume()
        
        
    }
}

