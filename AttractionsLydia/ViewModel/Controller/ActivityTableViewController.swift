import UIKit

class ActivityTableViewController: UITableViewController {
    
    var urlString: String = ""
    
    var attraction: Attraction?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = attraction?.name ?? "景點詳情"
        
        // 註冊自訂 Cell
        tableView.register(ActivityImageCell.self, forCellReuseIdentifier: "ActivityImageCell")
        tableView.register(ActivityCell.self, forCellReuseIdentifier: "ActivityCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none

        
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let attraction = attraction else {
            return UITableViewCell()
        }

        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityImageCell", for: indexPath) as! ActivityImageCell
            let imageURLs = attraction.images.map { $0.src }
            cell.configure(with: imageURLs)
            return cell
        }

        let cell = tableView.dequeueReusableCell(withIdentifier: "ActivityCell", for: indexPath) as! ActivityCell

        switch indexPath.row {
            case 1:
                cell.set(title: "名稱", content: attraction.name)
            case 2:
                cell.set(title: "簡介", content: attraction.introduction)
            case 3:
                cell.set(title: "官方網站", content: attraction.official_site)
            case 4:
                cell.set(title: "行政區", content: attraction.distric ?? "無資料")
            case 5:
                cell.set(title: "地址", content: attraction.address ?? "無資料")
            case 6:
                cell.set(title: "電話", content: attraction.tel ?? "無資料")
            case 7:
                cell.set(title: "電子郵件", content: attraction.email ?? "無資料")
            case 8:
                cell.set(title: "票務資訊", content: attraction.ticket ?? "無資料")
            case 9:
                cell.set(title: "相關網址", content: attraction.url ?? "無資料")
            default:
                break
            }
            
            return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let attraction = attraction else { return }
        
        var urlStringToOpen: String?
        
        switch indexPath.row {
        case 3: // 官方網站
            urlStringToOpen = attraction.official_site
        case 9: // 相關網址
            urlStringToOpen = attraction.url
        default:
            break
        }
        
        if let urlStr = urlStringToOpen, let url = URL(string: urlStr), url.scheme?.hasPrefix("http") == true {
            let webVC = WebViewController()
            webVC.urlString = urlStr
            navigationController?.pushViewController(webVC, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}

