//
//  Dictionary+Extension.swift
//  Weather
//
//  Created by Guzel Gubaidullina on 01.03.2021.
//  Copyright © 2020 Guzel Gubaidullina. All rights reserved.
//

import Foundation

func +<Key, Value> (lhs: [Key: Value],
                    rhs: [Key: Value]) -> [Key: Value] {
    var result = lhs
    rhs.forEach{ result[$0] = $1 }
    return result
}
