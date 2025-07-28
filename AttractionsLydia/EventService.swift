import Foundation

class EventService {
    
    func fetchTopNews(lang: String = "zh-tw", completion: @escaping (Result<[News], Error>) -> Void) {
        let urlString = "https://www.travel.taipei/open-api/\(lang)/Events/News?page=1"
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")  // 這行加在這裡
        
        URLSession.shared.dataTask(with: request) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            
            // debug 輸出原始資料
            if let jsonString = String(data: data, encoding: .utf8) {
                print("回傳原始資料：", jsonString)
            }
            
            do {
                let result = try JSONDecoder().decode(NewsResponse.self, from: data)
                let top3 = Array(result.data.prefix(3))
                completion(.success(top3))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }

    
    
}
