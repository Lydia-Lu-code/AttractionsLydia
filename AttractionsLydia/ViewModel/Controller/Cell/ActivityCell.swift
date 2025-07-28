//
//  DetailCell.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/28.
//

import UIKit


class ActivityCell: UITableViewCell {
    
    var titleLabel = UILabel()
    var contentLabel = UILabel()
    
    var urlString = String()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    private func setupViews() {
        titleLabel.font = .boldSystemFont(ofSize: 16)
        contentLabel.font = .systemFont(ofSize: 14)
        contentLabel.numberOfLines = 0
        titleLabel.numberOfLines = 0

        let stackView = UIStackView(arrangedSubviews: [titleLabel, contentLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func set(title: String, content: String) {
        titleLabel.text = title
        contentLabel.text = content
    }
}


//class DetailCell: UITableViewCell {
//
//    var titleLabel = UILabel()
//    var contentLabel = UILabel()
//    
//    var urlString = String()
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//
//    
//    func set(title: String, content: String) {
//        titleLabel.text = title
//        contentLabel.text = content
//    }
//}
