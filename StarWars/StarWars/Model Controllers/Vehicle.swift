//
//  Vehicle.swift
//  StarWars
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

class VehicleController {
    
    static func fetchAllVehicles(completion: @escaping ([Vehicle]) -> Void) {
        
        guard var baseURL = URL(string: "https://swapi.co/api/") else { completion([]); return }
        
        baseURL.appendPathComponent("vehicles")
        
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
                let topLevelDictionary = try decoder.decode(VehicleTopLevelDictionary.self, from: data)
                print("Success getting vehicles.")
                completion(topLevelDictionary.results)
            } catch {
                print("Error getting the film array. \(#function) - \(error) - \(error.localizedDescription)")
                completion([])
            }
            }.resume()
        return
    }
}
