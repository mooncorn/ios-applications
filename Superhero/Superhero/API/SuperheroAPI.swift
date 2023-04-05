//
//  SuperheroApi.swift
//  Superhero
//
//  Created by David Pilarski on 2023-03-29.
//

import Foundation

class SuperheroAPI {
    static let baseURL = "https://www.superheroapi.com/api.php/5979247632190325/"
    
    static func search(term: String,
                       successHandler: @escaping (_ httpStatusCode : Int, _ response : [String: Any]) -> Void,
                       failHandler : @escaping (_ httpStatusCode : Int, _ errorMessage: String) -> Void) {
        
        let formattedTerm = term.replacingOccurrences(of: " ", with: "%20")
        
        let endPoint = "search/\(formattedTerm)"
        
        let header : [String:String] = [:]
        
        let payload : [String:String] = [:]
        
        API.call(baseURL: baseURL, endPoint: endPoint, method: "GET", header: header, payload: payload, successHandler: successHandler, failHandler: failHandler)
    }
}

struct SuperHeroAPISearch : Codable {
    
    var response : String
    var error : String?
    
    var results_for : String?
    var results : [Superhero]?
    
    private enum CodingKeys : String, CodingKey {
        case results, results_for = "results-for", response, error
    }
    
    static func decode( json : [String:Any] ) -> SuperHeroAPISearch? {
        
        let decoder = JSONDecoder()
        do{
            let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
            let object = try decoder.decode(SuperHeroAPISearch.self, from: data)
            return object
        } catch {
            print(error)
        }
        return nil
    }
}

struct Superhero : Codable {
    
    var id : String
    var name : String
    var powerstats : Powerstats
    var biography : Biography
    var appearance : Appearance
    var work : Work
    var connections : Connections
    var image : Image
    
    private enum CodingKeys : String, CodingKey {
        case id
        case name
        case powerstats
        case biography
        case appearance
        case work
        case connections
        case image
    }
    
    struct Powerstats : Codable {
        
        var intelligence : String
        var strength : String
        var speed : String
        var durability : String
        var power : String
        var combat : String
        
    }

    struct Biography : Codable {
        
        var full_name : String
        var alter_egos : String
        var aliases : [String]
        var place_of_birth : String
        var first_appearance : String
        var publisher : String
        var alignment : String
        
        private enum CodingKeys : String, CodingKey {
            case full_name = "full-name"
            case alter_egos = "alter-egos"
            case aliases
            case place_of_birth = "place-of-birth"
            case first_appearance = "first-appearance"
            case publisher
            case alignment
        }

    }

    struct Appearance : Codable {
        
        var gender : String
        var race : String
        var height : [String]
        var weight: [String]
        var eye_color: String
        var hair_color: String
        
        private enum CodingKeys : String, CodingKey {
            case gender
            case race
            case height
            case weight
            case eye_color = "eye-color"
            case hair_color = "hair-color"
        }
        
    }

    struct Work : Codable {
        
        var occupation : String
        var base : String
        
    }

    struct Connections : Codable {
        
        var group_affiliation : String
        var relatives : String
        
        private enum CodingKeys : String, CodingKey {
            case group_affiliation = "group-affiliation", relatives
        }
    }

    struct Image : Codable {
        
        var url : String
        
    }
    
}



