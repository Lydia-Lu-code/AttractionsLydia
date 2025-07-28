//
//  Attraction.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import Foundation

struct Attraction: Decodable {
    let id: Int
    let name: String
    let introduction: String
    let images: [ImageData]
    
    struct ImageData: Decodable {
        let src: String
        let subject: String
    }
}

struct AttractionResponse: Decodable {
    let total: Int
    let data: [Attraction]
}


