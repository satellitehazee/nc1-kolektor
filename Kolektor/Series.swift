//
//  Series.swift
//  Kolektor
//
//  Created by Hocky on 28/04/22.
//

import Foundation
import UIKit

struct Series: Codable{
    var name: String
    
    init(name: String){
        self.name = name
    }
}
