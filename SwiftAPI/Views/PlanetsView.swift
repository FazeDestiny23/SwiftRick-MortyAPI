//
//  PlanetsView.swift
//  SwiftAPI
//
//  Created by FRANCISCO AQUINO on 10/03/24.
//

import SwiftUI

struct PlanetsView: View {
    @StateObject var api = API()

    var body: some View {
        TabView {
            NavigationView {
                List {
                    Section(header:
                        Text("Planets")
                        .font(.custom("ZenDots-Regular", size: 30))
                        .foregroundColor(.green)
                        .frame(maxWidth: .infinity, alignment: .center)) {
                            
                        ForEach(api.planets, id: \.self) { planet in
                            HStack(spacing: 15) {
                                if let planetImage = UIImage(named: planet.imageName) {
                                    Image(uiImage: planetImage)
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .clipShape(Rectangle())
                                        .overlay(Rectangle().stroke(Color.green, lineWidth: 2))
                                        .shadow(radius: 7)
                                        .frame(width: 120, height: 100)
                                }
                                VStack(alignment: .leading) {
                                    Text("Name: \(planet.name)")
                                        .font(.headline)
                                        .foregroundColor(.green)
                                    Text("Type: \(planet.type)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    Text("Dimension: \(planet.dimension)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("")
                .onAppear {
                    api.fetchPlanets()
                }
            }
            .tabItem {
                Image(systemName: "globe")
                Text("Planets")
            }
            
            ContentView()
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Characters")
                }
            
            Home(image: Image("logo"))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
        }
    }
}

struct PlanetsView_Previews: PreviewProvider {
    static var previews: some View {
        let planets: [Planet] = [
            Planet(id: 1, name: "Earth (C-137)", type: "Planet", dimension: "Dimension C-137", imageName: "Earth (C-137)"),
            Planet(id: 2, name: "Abadango", type: "Cluster", dimension: "unknown", imageName: "Abadango"),
            Planet(id: 3, name: "Citadel of Ricks", type: "Space station", dimension: "unknown", imageName: "citadel"),
            Planet(id: 4, name: "Worldender's lair", type: "Planet", dimension: "unknown", imageName: "worldender"),
            Planet(id: 5, name: "Anatomy Park", type: "Microverse", dimension: "Dimension C-137", imageName: "anatomy_park"),
            Planet(id: 6, name: "Interdimensional Cable", type: "TV", dimension: "unknown", imageName: "interdimensional_cable"),
            Planet(id: 7, name: "Immortality Field Resort", type: "Resort", dimension: "unknown", imageName: "immortality_field_resort"),
            Planet(id: 8, name: "Post-Apocalyptic Earth", type: "Planet", dimension: "Post-Apocalyptic Dimension", imageName: "post_apocalyptic_earth"),
            Planet(id: 9, name: "Purge Planet", type: "Planet", dimension: "Replacement Dimension", imageName: "purge_planet"),
            Planet(id: 10, name: "Venzenulon 7", type: "Planet", dimension: "unknown", imageName: "venzenulon_7")
        ]
        let api = API()
        api.planets = planets
        return PlanetsView(api: api)
            .previewDevice("iPad Pro (12.9-inch) (5th generation)")
    }
}
