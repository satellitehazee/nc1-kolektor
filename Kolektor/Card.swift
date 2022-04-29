//
//  Card.swift
//  Kolektor
//
//  Created by Hocky on 28/04/22.
//

import Foundation
import UIKit

struct Card: Codable {
    var series: String
    var id: String
    var name: String
    var rarity: String
    var price: String
    var wish: String
    
    init(series: String, id: String, name: String, rarity: String, price: String, wish: String){
        self.series = series
        self.id = id
        self.name = name
        self.rarity = rarity
        self.price = price
        self.wish = wish
    }
    
}
