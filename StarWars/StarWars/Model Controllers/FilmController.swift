//
//  FilmController.swift
//  StarWars
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

class FilmController {
    
    static func fetchAllFilms(completion: @escaping ([Film]) -> Void) {
        
        guard var baseURL = URL(string: "https://swapi.co/api/") else { completion([]); return }
        
        baseURL.appendPathComponent("films")
        
        URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
            
            if let error = error {
                print("Error creating a URL Session. \(#function) - \(error) - \(error.localizedDescription)")
                completion([])
                return
            }
            
            guard let data = data else {
                print("Error receiving the data. \(#function) - \(String(describing: error)) - \(String(describing: error?.localizedDescription))")
                completion([])
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let topLevelDictionary = try decoder.decode(FilmTopLevelDictionary.self, from: data)
                print("Success getting films.")
                completion(topLevelDictionary.results)
            } catch {
                print("Error getting the film array. \(#function) - \(error) - \(error.localizedDescription)")
                completion([])
            }
            }.resume()
        return
    }
}
