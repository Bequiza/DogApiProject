//
//  DogBreeds.swift
//  DogApiProject
//
//  Created by Rebecca Zadig on 2023-12-07.
//

import Foundation

struct DogBreedsResponse: Codable {
    let message: [String: [String]]
}

class DogBreeds : ObservableObject {
    
    @Published var breed : [String] = []
    
    func loadApi() async {
        
        if let url = URL(string: "https://dog.ceo/api/breeds/list/all") {
            
            Task {
                do {
                    var (apiData, _) = try await URLSession.shared.data(from: url)
                    
                    print(apiData.count)
                    
                    let decoder = JSONDecoder()
                    
                    let allBreeds = try decoder.decode(DogBreedsResponse.self, from: apiData)
                    
                    let sortedBreeds = allBreeds.message.keys.sorted()
                        DispatchQueue.main.async {
                            self.breed = sortedBreeds
                        }
                } catch {
                    print("error fetching breed list")
                }
            }
        } else {
            print("Error URL")
        }
    }
}
