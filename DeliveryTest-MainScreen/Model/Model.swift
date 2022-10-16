//
//  Model.swift
//  DeliveryTest-MainScreen
//
//  Created by Ксения Кобак on 14.10.2022.
//

import Foundation


struct JsonResults: Decodable {
    var results: [Item]
}

struct  Item: Codable  {
    var title: String?
    var image: String?
    
    enum CodingKeys : String, CodingKey {
        case title = "title"
        case image = "image"
    }
    
}




