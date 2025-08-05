//
//  AttractionCell.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import UIKit

class AttractionCell: UITableViewCell {
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let contentLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        // 設定圖片
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false

        // 設定標題與內文
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.textAlignment = .center

        contentLabel.font = UIFont.systemFont(ofSize: 14)
        contentLabel.numberOfLines = 3
        contentLabel.textColor = .darkGray
        contentLabel.textAlignment = .left

        let textStack = UIStackView(arrangedSubviews: [titleLabel, contentLabel])
        textStack.axis = .vertical
        textStack.spacing = 4
        textStack.translatesAutoresizingMaskIntoConstraints = false

        let containerStack = UIStackView(arrangedSubviews: [thumbnailImageView, textStack])
        containerStack.axis = .horizontal
        containerStack.spacing = 12
        containerStack.alignment = .center
        containerStack.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(containerStack)
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            containerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            containerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            containerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),

            thumbnailImageView.widthAnchor.constraint(equalTo: thumbnailImageView.heightAnchor, multiplier: 1.5), 
            thumbnailImageView.heightAnchor.constraint(equalToConstant: 80),
            
        ])

        contentView.layer.borderColor = UIColor.systemBlue.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.cornerRadius = 12
        contentView.layer.masksToBounds = true
        

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



