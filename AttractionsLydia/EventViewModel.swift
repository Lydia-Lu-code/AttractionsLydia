//
//  AttractionViewModel.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import Foundation

class EventViewModel {
    private let service = AttractionService()

    func loadTopNews(lang: String = "zh-tw", completion: @escaping ([String]) -> Void) {
        service.fetchTopNews(lang: lang) { result in
            switch result {
            case .success(let news):
                let titles = news.map { $0.title }
                completion(titles)
            case .failure(let error):
                print("抓取失敗: \(error.localizedDescription)")
                completion([])
            }
        }
    }
}
