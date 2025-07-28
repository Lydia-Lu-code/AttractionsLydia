//
//  AttractionViewModel.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import Foundation

class EventViewModel {
    private let service = EventService()
    
    func loadTopNews(lang: String, completion: @escaping ([News]) -> Void) {
        service.fetchTopNews(lang: lang) { result in
            switch result {
            case .success(let newsList):
                completion(newsList)
            case .failure(let error):
                print("取得最新消息失敗：\(error)")
                completion([])
            }
        }
    }
}

