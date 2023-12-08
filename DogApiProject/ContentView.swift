//
//  ContentView.swift
//  DogApiProject
//
//  Created by Rebecca Zadig on 2023-12-07.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var breeds = DogBreeds()
    @State private var selectedBreed : String?
    @State private var imageURL: URL?
    
    var body: some View {
    
            NavigationView {
                VStack {
                    if let breed = selectedBreed {
                        Text("\(breed)")
                            .padding()
                            .font(.headline)
                    } else {
                        Text("")
                    }
                        
                    Text("Välj hundras")
                    
                    NavigationLink(destination: ViewDogBreeds(breeds: breeds, selectedBreed: $selectedBreed)) {
                        Text("Bläddra")
                    }
                }
                .padding()
            }
        }
    }

#Preview {		
    ContentView()
}
