//
//  Event.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import Foundation



struct News: Decodable {
    let id: Int
    let title: String
    let description: String
}

struct NewsResponse: Decodable {
    let data: [News]
}
