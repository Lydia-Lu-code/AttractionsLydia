//
//  ActivityImageCell.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import Foundation
import UIKit

class ActivityImageCell: UITableViewCell {
    
    let scrollView = UIScrollView()
    var imageViews: [UIImageView] = []
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(hex: "#B8D9F9") // 淡天藍
        contentView.backgroundColor = UIColor(hex: "#B8D9F9")

        setupScrollView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupScrollView()
    }

    private func setupScrollView() {
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        contentView.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: contentView.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            scrollView.heightAnchor.constraint(equalToConstant: 200) // 高度自訂
        ])
    }

    func configure(with imageURLs: [String]) {

        imageViews.forEach { $0.removeFromSuperview() }
        imageViews = []

        var xOffset: CGFloat = 0

        for urlString in imageURLs {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.backgroundColor = .clear
            imageView.frame = CGRect(x: xOffset, y: 0, width: UIScreen.main.bounds.width, height: 200)
            scrollView.addSubview(imageView)
            imageViews.append(imageView)

            if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { data, _, _ in
                    if let data = data, let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            imageView.image = image
                        }
                    }
                }.resume()
            }

            xOffset += UIScreen.main.bounds.width
        }

        scrollView.contentSize = CGSize(width: xOffset, height: 200)
    }
}
