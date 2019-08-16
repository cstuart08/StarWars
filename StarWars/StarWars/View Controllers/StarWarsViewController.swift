//
//  StarWarsViewController.swift
//  StarWars
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import UIKit

class StarWarsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destinationVC = segue.destination as? StarWarsTableViewController else { return }
        
        switch segue.identifier {
        case "peopleSegue":
            destinationVC.objectToDisplay = .Person
        case "planetSegue":
            destinationVC.objectToDisplay = .Planet
        case "vehicleSegue":
            destinationVC.objectToDisplay = .Vehicle
        case "speciesSegue":
            destinationVC.objectToDisplay = .Species
        case "filmsSegue":
            destinationVC.objectToDisplay = .Film
        case "starshipsSegue":
            destinationVC.objectToDisplay = .Starship
        default:
            return
        }
    }
}
