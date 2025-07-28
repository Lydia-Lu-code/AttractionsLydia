import UIKit

class ActivityTableViewController: UITableViewController {

    var activity: Activity?
    var urlString: String = ""

    var detailItems: [(String, String)] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white

        // ✅ 把 activity 組成要顯示的資料
        if let act = activity {
            detailItems.append(("活動描述", act.description))
            detailItems.append(("地點", "\(act.distric) \(act.address)"))
            detailItems.append(("主辦單位", act.organizer))
            detailItems.append(("聯絡人", act.contact))
            detailItems.append(("票務資訊", act.ticket))
            detailItems.append(("交通資訊", act.traffic))
            detailItems.append(("停車資訊", act.parking))
            detailItems.append(("發佈時間", act.posted))
            detailItems.append(("網址", act.url))
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return detailItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailCell", for: indexPath) as! DetailCell
        let (title, content) = detailItems[indexPath.row]
        cell.set(title: title, content: content)
        return cell
    }
}


//import UIKit
//
//class DetailTableViewController: UITableViewController {
//    
//    var activity: Activity?
//    
//    let cellIdentifier = "DetailCell"
//    
//    var urlString = String()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        tableView.register(DetailCell.self, forCellReuseIdentifier: cellIdentifier)
//        tableView.separatorStyle = .none
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 100
//
//        
//        tableView.register(DetailCell.self, forCellReuseIdentifier: "DetailCell")
//
//    }
//    
//    // 要顯示的欄位文字陣列
//    var infoList: [(title: String, content: String)] {
//        guard let a = activity else { return [] }
//        return [
//            ("活動描述", a.description),
//            ("地點", "\(a.distric) \(a.address)"),
//            ("主辦單位", a.organizer),
//            ("協辦單位", a.co_rganizer),
//            ("聯絡人", a.contact),
//            ("票務資訊", a.ticket),
//            ("交通資訊", a.traffic),
//            ("停車資訊", a.parking),
//            ("發佈時間", a.posted),
//            ("網址", a.url)
//        ]
//    }
//    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return infoList.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! DetailCell
//        let item = infoList[indexPath.row]
//        cell.set(title: item.title, content: item.content)
//        return cell
//    }
//}
