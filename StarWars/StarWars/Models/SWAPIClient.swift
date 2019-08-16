//
//  SWAPIClient.swift
//  StarWars
//
//  Created by Apps on 8/15/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

//MARK: ---------------STARSHIP--------------//

struct Starship: Codable, StarWarsItem {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let hyperdriveRating: String
    let MGLT: String
    let starshipClass: String
    let pilots: [String]
    let films: [String]
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case length
        case crew
        case passengers
        case consumables
        case MGLT
        case pilots
        case films
        case costInCredits = "cost_in_credits"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case hyperdriveRating = "hyperdrive_rating"
        case starshipClass = "starship_class"
    }
}

struct StarshipTopLevelDictionary: Codable {
    let results: [Starship]
    let next: String?
}

//MARK: ---------------PERSON--------------//

struct Person: Codable, StarWarsItem {
    let name: String
    let height: String
    let mass: String
    let hairColor: String
    let skinColor: String
    let eyeColor: String
    let birthYear: String
    let gender: String
    let homeworld: String
    let films: [String]
    
    private enum CodingKeys: String, CodingKey {
        case name
        case height
        case mass
        case gender
        case homeworld
        case films
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
    }
}

struct PersonTopLevelDictionary: Codable {
    let results: [Person]
    let next: String?
}


//MARK: ---------------FILM---------------//

struct Film: Codable, StarWarsItem {
    
    let name: String
    let episodeId: Int?
    let openingCrawl: String?
    let director: String
    let producer: String
    let releaseDate: String
    let characters: [String]
    let planets: [String]
    let starships: [String]
    let vehicles: [String]
    let species: [String]
    let created: String
    let edited: String
    let url: String

    enum CodingKeys: String, CodingKey {
        case name = "title"
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case characters
        case planets
        case starships
        case vehicles
        case species
        case created
        case edited
        case url
}
}

struct FilmTopLevelDictionary: Codable {
    let results: [Film]
    let next: String?
}

//MARK: ---------------VEHICLE---------------//

struct Vehicle: Codable, StarWarsItem {
    let name: String
    let model: String
    let manufacturer: String
    let costInCredits: String
    let length: String
    let maxAtmospheringSpeed: String
    let crew: String
    let passengers: String
    let cargoCapacity: String
    let consumables: String
    let vehicleClass: String
    let pilots: [String]
    let films: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case model
        case manufacturer
        case length
        case crew
        case passengers
        case consumables
        case pilots
        case films
        case url
        case costInCredits = "cost_in_credits"
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case cargoCapacity = "cargo_capacity"
        case vehicleClass = "vehicle_class"
    }
}

struct VehicleTopLevelDictionary: Codable {
    let results: [Vehicle]
    let next: String?
}

//MARK: ---------------PLANET---------------//

struct Planet: Codable, StarWarsItem {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate: String
    let gravity: String
    let terrian: String?
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrian
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
        case url
    }
}

struct PlanetTopLevelDictionary: Codable {
    let results: [Planet]
    let next: String?
}

//MARK: ---------------SPECIES---------------//

struct Species: Codable, StarWarsItem {
    let name: String
    let classification: String
    let designation: String
    let averageHeight: String
    let skinColors: String
    let hairColors: String
    let eyeColors: String
    let averageLifespan: String
    let homeworld: String?
    let language: String
    let people: [String]
    let films: [String]
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld
        case language
        case people
        case films
        case url
    }
}

struct SpeciesTopLevelDictionary: Codable {
    let results: [Species]
    let next: String?
}

enum StarWarsType {
    case Person
    case Starship
    case Planet
    case Species
    case Vehicle
    case Film
}
