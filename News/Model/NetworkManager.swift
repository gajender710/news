//
//  NetworkManager.swift
//  News
//
//  Created by Gajender Jangir on 25/04/22.
//

import Foundation

// object is a design pattern which publishes to properties to any interseted parties

class NetworkManager : ObservableObject{
    
    @Published var posts = [Post]()
    
    func fetch()
    {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page"){
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, response, error) in
                if error == nil{
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do{
                            let results = try decoder.decode(Results.self, from: safeData)
                            DispatchQueue.main.async {
                                // this should happen on main thread rather tan background as this content  is published to all views and must be updated on the main thread
                                self.posts = results.hits
                            }
                            
                        }
                        catch{
                            print("Error occured")
                        }
                        
                        
                    }
                    
                }
                
            }
                .resume()
        }
    }
}
