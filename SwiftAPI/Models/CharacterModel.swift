//
//  CharacterModel.swift
//  SwiftAPI
//
//  Created by FRANCISCO AQUINO on 05/03/24.
//

import Foundation
import SwiftUI

struct Character : Hashable, Codable {
    var id : Int
    var name : String
    var status : String
    var species : String
    var gender : String
    var image : String
    var origin : Location
    var location : Location
}

struct Location : Hashable, Codable {
    var name : String
    var url : URL
}

struct URLImage : View {
    let urlString : String
    
    @State var data : Data?
    
    var body : some View {
        if let data = data, let uiimage = UIImage(data : data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
        }
        
        if data != nil {
        }
        else {
            Image(systemName : "")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 130, height: 70)
                .background(Color.gray)
                .onAppear {
                    fetchData()
                }
        }
    }
    private func fetchData() {
        guard let url = URL(string : urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with : url) { data, _,_ in
            self.data = data
        }
        task.resume()
    }
}
