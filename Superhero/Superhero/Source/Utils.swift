//
//  Utils.swift
//  Superhero
//
//  Created by David Pilarski on 2023-04-04.
//

import Foundation

class Utils {
    
    static func convertTo0To100Range(num: Int) -> Int {
        return  max(0, min(100, num))
    }
    
}
