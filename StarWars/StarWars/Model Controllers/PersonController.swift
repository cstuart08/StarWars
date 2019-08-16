//
//  PersonController.swift
//  StarWars
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

class PeopleController {
    
    static var people: [Person] = []
    
    static func fetchAllPeople(pageNumber: Int = 1, completion: @escaping ([Person]) -> Void) {
        
        guard var baseURL = URL(string: "https://swapi.co/api/") else { completion([]); return}
        
        baseURL.appendPathComponent("people")
        var finalURL = baseURL
        if pageNumber > 1 {
            var components = URLComponents(url: finalURL, resolvingAgainstBaseURL: true)
            components?.queryItems = [URLQueryItem(name: "page", value: "\(pageNumber)")]
            guard let tempURL = components?.url else { return }
            finalURL = tempURL
        }
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
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
                people.append(contentsOf: topLevelDictionary.results)
                if topLevelDictionary.next != nil {
                    fetchAllPeople(pageNumber: pageNumber + 1, completion: completion)
                } else {
                    completion(people)
                }
            } catch {
                print("Error getting the person array. \(#function) - \(error) - \(error.localizedDescription)")
                completion([])
            }
        }.resume()
    }
}
