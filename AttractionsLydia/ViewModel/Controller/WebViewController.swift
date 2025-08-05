import UIKit
import WebKit

class WebViewController: UIViewController {
    var urlString: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let webView = WKWebView(frame: view.bounds)
        webView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        view.addSubview(webView)

        if let urlString = urlString, let url = URL(string: urlString) {
            print("開啟 WebView 網址：\(urlString)")
            webView.load(URLRequest(url: url))
        } else {
            print("無效網址")
        }
    }
}



