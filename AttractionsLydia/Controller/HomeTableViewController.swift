//
//  HomeTableViewController.swift
//  AttractionsLydia
//
//  Created by Lydia Lu on 2025/7/27.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    private let mainViewModel = MainViewModel()
    private let attractionViewModel = AttractionViewModel()
    
    var attractions: [Attraction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "悠遊台北"
        
        navigationController?.navigationBar.barTintColor = UIColor.systemBlue
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationController?.navigationBar.isTranslucent = false
        
        let langButton = UIBarButtonItem(title: "🌐", style: .plain, target: self, action: #selector(showLanguageOptions))
        navigationItem.rightBarButtonItem = langButton
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "TitleCell")
        tableView.register(AttractionCell.self, forCellReuseIdentifier: "AttractionCell")
        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension

        loadData(lang: "zh-tw")
        
        
    }
    
    @objc func showLanguageOptions() {
        let alert = UIAlertController(title: "選擇語言", message: nil, preferredStyle: .alert)
        let options = [("繁體中文", "zh-tw"), ("簡體中文", "zh-cn"), ("English", "en"), ("日文", "ja"), ("韓文", "ko")]
        for (title, code) in options {
            alert.addAction(UIAlertAction(title: title, style: .default) { [weak self] _ in
                self?.loadData(lang: code)
            })
        }
        alert.addAction(UIAlertAction(title: "取消", style: .cancel))
        present(alert, animated: true)
    }

    func loadData(lang: String) {
        mainViewModel.loadAllData(lang: lang) { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1: return mainViewModel.eventItem.count
        case 2: return mainViewModel.attractionItem.count
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1: return "最新消息"
        case 2: return "旅遊景點"
        default: return nil
        }
    }
    
override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    if indexPath.section == 0 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath)
        cell.textLabel?.text = "台北市景點"
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return cell
    }

    if indexPath.section == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        let news = mainViewModel.eventItem[indexPath.row]
        cell.titleLabel.text = news.title
        cell.contentLabel.text = news.description
        return cell
    }

    if indexPath.section == 2 {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AttractionCell", for: indexPath) as! AttractionCell
        let attraction = mainViewModel.attractionItem[indexPath.row]
        cell.titleLabel.text = attraction.name
        cell.contentLabel.text = attraction.introduction
        return cell
    }

    


    // 預設回傳一個空的 UITableViewCell，防止 crash
    return UITableViewCell()
}


    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 30 // 你想要的高度
        }
        return UITableView.automaticDimension
    }

    
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section != 0 else { return nil }
        
        let label = PaddingLabel()
        label.text = section == 1 ? "最新消息" : "旅遊景點"
        label.textColor = .white
        label.backgroundColor = .systemBlue
        label.layer.cornerRadius = 12
        label.layer.masksToBounds = true
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        
        return label
    }
    
    
}


class PaddingLabel: UILabel {
    var insets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + insets.left + insets.right,
                      height: size.height + insets.top + insets.bottom)
    }
}
