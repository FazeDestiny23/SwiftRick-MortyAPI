//
//  PlanetModel.swift
//  SwiftAPI
//
//  Created by FRANCISCO AQUINO on 10/03/24.
//

import Foundation
import SwiftUI

struct Planet : Hashable, Codable {
    var id : Int
    var name : String
    var type : String
    var dimension : String
    var imageName : String
}
