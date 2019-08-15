//
//  PeopleController.swift
//  StarWars
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

class PeopleController {
    
    static func fetchAllPeople(completion: @escaping ([Person]) -> Void) {
        
        guard var baseURL = URL(string: "https://swapi.co/api/") else { completion([]); return}
        
        baseURL.appendPathComponent("people")
        
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
                let topLevelDictionary = try decoder.decode(PersonTopLevelDictionary.self, from: data)
                print("Success getting people")
                completion(topLevelDictionary.results)
            } catch {
                print("Error getting the person array. \(#function) - \(error) - \(error.localizedDescription)")
                completion([])
            }
        }.resume()
    }
}
