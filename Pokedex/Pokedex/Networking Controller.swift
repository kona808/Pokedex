//
//  Networking Controller.swift
//  Pokedex
//
//  Created by Jacob Perez on 10/7/22.
//

import UIKit

class NetworkingController {
    
    private static let baseURLString = "https://pokeapi.co"
    
    static func fetchPokemon(with searchTerm: String, completion: @escaping (Pokemon?) -> Void) {
        
        guard let baseURL = URL(string: baseURLString) else {return}
        let finalURL = baseURL.appendingPathComponent("/api/v2/pokemon/\(searchTerm.lowercased())")
        //        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        //        urlComponents?.path = "/api/v2/pokemon/\(searchTerm.lowercased())"
        //
        //        guard let finalURL = urlComponents?.url else {return}
        //        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { dTaskData, _, error in
            if let error = error {
                print("Encountered error: \(error.localizedDescription)")
                completion(nil)
            }
            
            guard let pokemonData = dTaskData else { completion(nil); return }
            
            do {
                if let topLevelDictionary = try? JSONSerialization.jsonObject(with: pokemonData) as? [String: Any] {
                    let pokemon = Pokemon(topLevelDictionary: topLevelDictionary)
                    completion(pokemon)
                }
            }
        }.resume()
    }
    func fetchImage(pokemon: Pokemon, completionHandler: @escaping (UIImage?) -> Void) {
       // Step 1 Contrust the url
        guard let url = URL(string: pokemon.spritePath) else { completionHandler(nil); return }
        // Step 2 the data task
        URLSession.shared.dataTask(with: url) { pokemonData, _, error in
            if let error = error {
                completionHandler(nil); return
            }
            guard let imageData = pokemonData else { completionHandler(nil); return }
            
            let image = UIImage(data: imageData)
            completionHandler(image)
        }.resume()
    }
} // END of class
