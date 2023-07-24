//
//  APIHandler.swift
//  Emoji
//
//  Created by Lamiaa on 2023-07-20.
//


import Foundation
import Alamofire

class APIHandler {
    static let sharedInstance = APIHandler()

    func fetchingDataApi(handler: @escaping ([EmojiType]) -> Void) {
        let url = "https://emoji-api.com/emojis?access_key=0e8c181b4cad1a3874260b7d6703d1691c5746c9"
        
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: ["Content-Type": "application/json"], interceptor: nil).response { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else {
                        print("Empty data received.")
                        return
                    }
                    
                    let jsonDecoder = JSONDecoder()
                    jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                    let jsonData = try jsonDecoder.decode([EmojiType].self, from: data)
                    handler(jsonData)
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            case .failure(let error):
                print("API Request Error: \(error.localizedDescription)")
            }
        }
    }
}
