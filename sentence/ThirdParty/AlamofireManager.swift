//
//  AlamofireManager.swift
//  sentence
//
//  Created by Terry on 2023/08/16.
//

import Foundation
import Alamofire

class AlamofireManager{
    
    static let shared = AlamofireManager()
    
    
    func fetchData(for searchQuery: String, completed: @escaping (Book) -> Void) {
        let url = URL(string: Content.BOOK_URL)!
        let headers: HTTPHeaders = [
            "X-Naver-Client-id":"HyZ2qewmZEjb5OUojiW_",
            "X-Naver-Client-Secret" :"LAZCvTGVDm"
        ]
        let parameter: Parameters = [
            "query": searchQuery
        ]
        AF.request(url,method: .get, parameters: parameter , headers: headers).responseJSON { response in
            switch response.result {
            case .success(let data):
                do{
                    let dataJSON = try JSONSerialization.data(withJSONObject: data,options: .prettyPrinted)
                    let jsonDecoder = try JSONDecoder().decode(Book.self, from: dataJSON)
                    completed(jsonDecoder)
                }catch{
                    print("book API JSON Decoder ",error)
                }
                
                
            case .failure(let error):
                print("alamofire Book Call Error ", error)
            }
        }
    }
}
