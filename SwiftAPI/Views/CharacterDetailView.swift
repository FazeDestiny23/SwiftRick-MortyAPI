//
//  CharacterDetailView.swift
//  SwiftAPI
//
//  Created by FRANCISCO AQUINO on 05/03/24.
//
import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView("Loading...")
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
    }
}

struct CharacterDetailView: View {
    var character: Character
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            if isLoading {
                LoadingView()
            } else {
                VStack {
                    Text("Character Detail")
                        .bold()
                        .font(.largeTitle)
                        .foregroundColor(.green)
                        .padding()
                    
                    URLImage(urlString: character.image)
                        .frame(width: 150, height: 150)
                        .clipShape(Rectangle())
                        .overlay(
                            Rectangle().stroke(Color.cyan, lineWidth: 4)
                        )
                        .shadow(radius: 7)
                        .padding(.bottom, 20)
                    
                    Text(character.name)
                        .font(.custom("ZenDots-Regular", size: 50))
                        .fontWeight(.bold)
                        .foregroundColor(.cyan)
                    
                    Divider()
                        .padding(.vertical)
                    
                    VStack(alignment: .leading, spacing: 10) {
                        CharacterDetailRow(title: "Status", value: character.status)
                        Divider()
                            .padding(.vertical)
                        CharacterDetailRow(title: "Species", value: character.species)
                        Divider()
                            .padding(.vertical)
                        CharacterDetailRow(title: "Gender", value: character.gender)
                        Divider()
                            .padding(.vertical)
                        CharacterDetailRow(title: "Origin", value: character.origin.name)
                        Divider()
                            .padding(.vertical)
                        CharacterDetailRow(title: "Location", value: character.location.name)
                    }
                    .padding(.horizontal)
                    
                    Spacer()
                }
            }
        }
        .background(Color.gray.opacity(0.2))
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                isLoading = false
            }
        }
    }
}

struct CharacterDetailRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.green)
            Spacer()
            Text(value)
                .font(.body)
                .foregroundColor(.primary)
        }
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleCharacter = Character(id: 1, name: "Rick", status: "Alive", species: "Human", gender: "Male", image: "https://rickandmortyapi.com/api/character/avatar/1.jpeg", origin: Location(name: "Earth (C-137)", url: URL(string: "https://rickandmortyapi.com/api/location/1")!), location: Location(name: "Citadel of Ricks", url: URL(string: "https://rickandmortyapi.com/api/location/3")!))
        
        return CharacterDetailView(character: sampleCharacter)
            .navigationTitle("Character Detail")
    }
}
