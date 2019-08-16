//
//  VehicleController.swift
//  StarWars
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

class VehicleController {
    
    static var vehicles: [Vehicle] = []
    
    static func fetchAllVehicles(pageNumber: Int = 1, completion: @escaping ([Vehicle]) -> Void) {
        
        guard var baseURL = URL(string: "https://swapi.co/api/") else { completion([]); return }
        
        baseURL.appendPathComponent("vehicles")
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
                let topLevelDictionary = try decoder.decode(VehicleTopLevelDictionary.self, from: data)
                print("Success getting vehicles.")
                vehicles.append(contentsOf: topLevelDictionary.results)
                if topLevelDictionary.next != nil {
                    fetchAllVehicles(pageNumber: pageNumber + 1, completion: completion)
                } else {
                
                    completion(vehicles)
                }
            } catch {
                print("Error getting the film array. \(#function) - \(error) - \(error.localizedDescription)")
                completion([])
            }
            }.resume()
        return
    }
}
