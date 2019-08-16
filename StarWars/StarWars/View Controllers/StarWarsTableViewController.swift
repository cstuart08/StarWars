//
//  StarWarsTableViewController.swift
//  StarWars
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import UIKit

class StarWarsTableViewController: UITableViewController {
    
    var landingPad: [StarWarsItem] = []
    var objectToDisplay: StarWarsType = .Planet

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchObjects {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    func fetchObjects(completion: @escaping () -> Void) {
        switch objectToDisplay {
        case .Starship:
            StarshipController.fetchAllStarships { (starships) in
                self.landingPad = starships
                completion()
            }
        case .Person:
            PeopleController.fetchAllPeople { (people) in
                self.landingPad = people
                completion()
            }
        case .Film:
            FilmController.fetchAllFilms { (films) in
                self.landingPad = films
                completion()
            }
        case .Planet:
            PlanetController.fetchAllPlanets { (planets) in
                self.landingPad = planets
                completion()
            }
        case .Species:
            SpeciesController.fetchAllSpecies { (species) in
                self.landingPad = species
                completion()
            }
        case .Vehicle:
            VehicleController.fetchAllVehicles { (vehicles) in
                self.landingPad = vehicles
                completion()
            }
        default:
            completion()
            return
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landingPad.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "StarshipCell", for: indexPath)
        let starWarsObject = landingPad[indexPath.row]
        cell.textLabel?.text = starWarsObject.name
        return cell
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

protocol StarWarsItem {
    var name: String { get }
}
