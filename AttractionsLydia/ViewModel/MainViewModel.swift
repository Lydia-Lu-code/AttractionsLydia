//
//  MainViewModel.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import Foundation

class MainViewModel {
    private let eventViewModel = EventViewModel()
    private let attractionViewModel = AttractionViewModel()

    var eventItem: [News] = []
    var attractionItem: [Attraction] = []

    func loadAllData(lang: String = "zh-tw", completion: @escaping () -> Void) {
        let group = DispatchGroup()

        group.enter()
        eventViewModel.loadTopNews(lang: lang) { [weak self] newsList in
            self?.eventItem = newsList
            print("最新消息抓到 \(newsList.count) 筆")
            group.leave()
        }

        group.enter()
        attractionViewModel.loadAttractions(lang: lang) { [weak self] attractionList in
            self?.attractionItem = attractionList
            print("景點資料抓到 \(attractionList.count) 筆")
            group.leave()
        }

        group.notify(queue: .main) {
            completion()
        }
    }
}

