//
//  ViewDogBreeds.swift
//  DogApiProject
//
//  Created by Rebecca Zadig on 2023-12-07.
//

import SwiftUI

struct ViewDogBreeds: View {
    
    @ObservedObject var breeds = DogBreeds()
    @Binding var selectedBreed: String?
    
    var body: some View {
        
        NavigationView {
            VStack {
                
                List(breeds.breed, id: \.self) { breed in
                    Button(action: {
                        selectedBreed = breed
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        }
                    }) {
                        HStack {
                            
                            Text(breed)
                            Spacer()
                            
                            if breed == selectedBreed {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            .onAppear() {
                    Task {
                        await breeds.loadApi()
                    }
                }
            }
        }
    }

//detta under fattade jag ingenting av.

struct ViewDogBreeds_Previews: PreviewProvider {
    static var previews: some View {
        ViewDogBreeds(breeds: DogBreeds(), selectedBreed: .constant(nil))
    }
}
