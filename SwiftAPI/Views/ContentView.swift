//
//  ContentView.swift
//  SwiftAPI
//
//  Created by FRANCISCO AQUINO on 05/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var api = API()
    @State private var searchText = ""
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationView {
                VStack {
                    TextField("Search characters", text: $searchText)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .background(Color.gray.opacity(0.2))
                        .cornerRadius(8)
                        .padding(.horizontal)
                        .padding(.bottom, 8)

                    List {
                        Section(header:
                            Text("Characters")
                            .font(.custom("ZenDots-Regular", size: 30))
                            .foregroundColor(.green)
                            .frame(maxWidth: .infinity, alignment: .center)) {
                                    ForEach(api.characters.filter {
                                        searchText.isEmpty || $0.name.localizedCaseInsensitiveContains(searchText)
                                    }, id: \.self) { character in
                                        NavigationLink(destination: CharacterDetailView(character: character)) {
                                            CharacterRow(character: character)
                                        }
                                    }
                        }
                    }
                    .listStyle(GroupedListStyle())
                    .onAppear {
                        api.fetchCharacters()
                    }
                }
                .navigationTitle("")
            }
            .tabItem {
                Image(systemName: "list.bullet")
                Text("Characters")
            }
            .tag(0)
            
            PlanetsView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Planets")
            }
            .tag(1)
            
            Home(image: Image("logo"))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(2)
        }
    }
}

struct CharacterRow: View {
    var character: Character
    
    var body: some View {
        HStack(spacing: 15) {
            URLImage(urlString: character.image)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.green, lineWidth: 2))
                .shadow(radius: 7)
                .frame(width: 120, height: 100)

            VStack(alignment: .leading) {
                Text(character.name)
                    .foregroundColor(.green)
                    .font(.custom("AlegrayaSansSC-Regular", size: 20))
                    .font(.headline)
                Text("Status: \(character.status)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                Text("Species: \(character.species)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(10)
    }
}


struct ContentView_Previews : PreviewProvider {
    static var previews : some View {
        let characters = [
            Character(id: 1, name: "Rick", status: "Alive", species: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", origin: Location(name: "Earth (C-137)", url: URL(string: "https://rickandmortyapi.com/api/location/1")!), location: Location(name: "Citadel of Ricks", url: URL(string: "https://rickandmortyapi.com/api/location/3")!)),
            
            Character(id: 2, name: "Morty", status: "Alive", species: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/2.jpeg", origin: Location(name: "Earth (C-137)", url: URL(string: "https://rickandmortyapi.com/api/location/1")!), location: Location(name: "Citadel of Ricks", url: URL(string: "https://rickandmortyapi.com/api/location/3")!)),
            
            Character(id: 3, name: "Summer Smith", status: "Alive", species: "Human", gender: "Female", image: "https://rickandmortyapi.com/api/character/avatar/3.jpeg", origin: Location(name: "Earth (Replacement Dimension)", url: URL(string: "https://rickandmortyapi.com/api/location/20")!), location: Location(name: "Earth (Replacement Dimension)", url: URL(string: "https://rickandmortyapi.com/api/location/20")!)),
            
            Character(id: 4, name: "Beth Smith", status: "Alive", species: "Human", gender: "Female", image: "https://rickandmortyapi.com/api/character/avatar/4.jpeg", origin: Location(name: "Earth (Replacement Dimension)", url: URL(string: "https://rickandmortyapi.com/api/location/20")!), location: Location(name: "Earth (Replacement Dimension)", url: URL(string: "https://rickandmortyapi.com/api/location/20")!)),
            
            Character(id: 5, name: "Jerry Smith", status: "Alive", species: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/5.jpeg", origin: Location(name: "Earth (Replacement Dimension)", url: URL(string: "https://rickandmortyapi.com/api/location/20")!), location: Location(name: "Earth (Replacement Dimension)", url: URL(string: "https://rickandmortyapi.com/api/location/20")!)),
            
            Character(id: 17, name: "Annie", status: "Alive", species: "Human", gender: "Female", image: "https://rickandmortyapi.com/api/character/avatar/17.jpeg", origin: Location(name: "Post-Apocalyptic Earth", url: URL(string: "https://rickandmortyapi.com/api/location/8")!), location: Location(name: "Post-Apocalyptic Earth", url: URL(string: "https://rickandmortyapi.com/api/location/8")!)),
            
            Character(id: 46, name: "Bill", status: "unknown", species: "Animal", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/46.jpeg", origin: Location(name: "Earth (Replacement Dimension)", url: URL(string: "https://rickandmortyapi.com/api/location/20")!), location: Location(name: "unknown", url: URL(string: "https://rickandmortyapi.com/api/location/8")!)),
            
            Character(id: 47, name: "Birdperson", status: "Alive", species: "Alien", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/47.jpeg", origin: Location(name: "Bird World", url: URL(string: "https://rickandmortyapi.com/api/location/15")!), location: Location(name: "Planet Squanch", url: URL(string: "https://rickandmortyapi.com/api/location/35")!)),
            
            Character(id: 81, name: "Crocubot", status: "Dead", species: "Animal", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/81.jpeg", origin: Location(name: "unknown", url: URL(string: "https://rickandmortyapi.com/api/location/20")!), location: Location(name: "Worldender's lair", url: URL(string: "https://rickandmortyapi.com/api/location/4")!)),
            
            Character(id: 107, name: "Dr. Wong", status: "Alive", species: "Human", gender: "Female", image: "https://rickandmortyapi.com/api/character/avatar/107.jpeg", origin: Location(name: "Earth (Replacement Dimension)", url: URL(string: "https://rickandmortyapi.com/api/location/20")!), location: Location(name: "Earth (Replacement Dimension)", url: URL(string: "https://rickandmortyapi.com/api/location/20")!))
        ]
        let api = API()
        api.characters = characters
        return ContentView(api: api)
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
