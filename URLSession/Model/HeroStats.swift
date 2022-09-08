//
//  Stats.swift
//  URLSession
//
//  Created by Kim Nghĩa on 08/09/2022.
//

import Foundation


struct HeroStats: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}
