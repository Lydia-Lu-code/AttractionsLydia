//
//  MainViewModel.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import Foundation
import UIKit

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
            group.leave()
        }

        group.enter()
        attractionViewModel.loadAttractions(lang: lang) { [weak self] attractionList in
            self?.attractionItem = attractionList
            group.leave()
        }
        
        group.notify(queue: .main) {
            completion()
        }
    }
}


extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let r = CGFloat((rgb & 0xFF0000) >> 16) / 255
        let g = CGFloat((rgb & 0x00FF00) >> 8) / 255
        let b = CGFloat(rgb & 0x0000FF) / 255
        self.init(red: r, green: g, blue: b, alpha: 1)
    }
}
