//
//  AttactionViewModel.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import Foundation

class AttractionViewModel {
    private let service = AttractionsService()

    func loadAttractions(lang: String = "zh-tw", completion: @escaping ([Attraction]) -> Void) {
        service.fetchAttractions(lang: lang) { result in
            switch result {
            case .success(let attractions):
                completion(attractions) // 直接回傳 Attraction 陣列
            case .failure(let error):
                print("抓取失敗: \(error.localizedDescription)")
                completion([])
            }
        }
    }
}

