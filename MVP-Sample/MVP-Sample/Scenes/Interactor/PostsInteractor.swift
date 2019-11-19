//
//  PostsInteractor.swift
//  MVP-Sample
//
//  Created by Hazem Mohammed on 11/19/19.
//  Copyright © 2019 Hazem Mohammed. All rights reserved.
//

import Foundation

class PostsInteractor {
    
    func getPosts(completionHandler: @escaping ([Post]?, Error?) -> ()) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.timeoutInterval = 60
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error = error {
                
                if error.localizedDescription.contains("timed out") {
                    completionHandler(nil, error)
                } else {
                    completionHandler(nil, error)
                }
                
            } else if let responseData = data {
                
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode([Post].self, from: responseData)
                    completionHandler(response, nil)
                }
                    
                catch {
                    completionHandler(nil, error)
                }
                
            } else {
                completionHandler(nil, error)
            }
        }.resume()
    }
}
