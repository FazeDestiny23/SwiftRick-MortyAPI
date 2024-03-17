//
//  API.swift
//  SwiftAPI
//
//  Created by FRANCISCO AQUINO on 05/03/24.
//

import Foundation

class API: ObservableObject {
    
    @Published var characters: [Character] = []
    @Published var planets: [Planet] = []
    
    func fetchCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character/1,2,3,4,5,17,46,47,81,107") else {
            return
        }
        
        fetchData(from: url, responseType: [Character].self) { [weak self] result in
            switch result {
            case .success(let characters):
                DispatchQueue.main.async {
                    self?.characters = characters
                }
            case .failure(let error):
                print("Error fetching characters: \(error)")
            }
        }
    }
    
    func fetchPlanets() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/planet/1,2,3,4,5,6,7,8,9,10") else {
            return
        }
        
        fetchData(from: url, responseType: [Planet].self) { [weak self] result in
            switch result {
            case .success(let planets):
                DispatchQueue.main.async {
                    self?.planets = planets
                }
            case .failure(let error):
                print("Error fetching planets: \(error)")
            }
        }
    }
    
    private func fetchData<T: Decodable>(from url: URL, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                if let error = error {
                    completion(.failure(error))
                } else {
                    completion(.failure(NSError(domain: "API", code: -1, userInfo: [NSLocalizedDescriptionKey: "Unknown error fetching data"])))
                }
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

