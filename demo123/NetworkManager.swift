//
//  NetworkManager.swift
//  demo123
//
//  Created by Альберт Садыков on 02.02.2021.
//

import Foundation
import Alamofire

let url = "https://pryaniky.com/static/json/sample.json"

class NetworkManager {
    
    
    static func getRequest(complition: @escaping (_ p : Priniky?) -> ()) {
        AF.request(url).response { (response) in
            
            switch response.result{
            
            case .success(let value):
                
                guard let jsonData = value else{return}
                let priniky = try? self.newJSONDecoder().decode(Priniky.self, from: jsonData)
                complition(priniky)
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
    static func newJSONDecoder() -> JSONDecoder {
        let decoder = JSONDecoder()
        if #available(iOS 10.0, OSX 10.12, tvOS 10.0, watchOS 3.0, *) {
            decoder.dateDecodingStrategy = .iso8601
        }
        return decoder
    }

}
