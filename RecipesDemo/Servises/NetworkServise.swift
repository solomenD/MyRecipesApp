//
//  NetworkServise.swift
//  RecipesDemo
//
//  Created by Solomon  on 11.12.2022.
//

import Foundation

class NetworkService {
    private init() { }
    static let shared = NetworkService()
    
    func loadRecipes(query: String, loadedNow: @escaping([Result])->()) {
        
        let headers = [
            "X-RapidAPI-Key": "eaf2601874msh7d7cb171c834291p1cfa96jsnef6d24d659ab",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        let baseURL = "https://tasty.p.rapidapi.com/recipes/list?from=0&size="
        let countOfResults = 20
        
        let request = NSMutableURLRequest(url: NSURL(string: "\(baseURL)\(String(countOfResults))&q=\(query)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            if error == nil && data != nil {
                
                let decode = JSONDecoder()
                
                do {
                    
                    let resipis = try decode.decode(Recipes.self, from: data!)
                    loadedNow(resipis.results ?? [])
                    
                } catch {
                    print(error)
                }
            }

        })
        print(dataTask)
        
        dataTask.resume()
    }
}
