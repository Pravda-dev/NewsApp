//
//  ApiManager.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import UIKit

final class ApiManager {
    enum Category: String {
        case general = "general"
        case business = "business"
        case technology = "technology"
    }
    
    private static let apiKey = "18743f970bea4105b7b8fc232b617976"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "top-headlines"
    
    //Create url path and make request
    static func getNews(from category: Category,
                        page: Int,
                        searchText: String?,
                        completion: @escaping (Result<[ArticleRensponseObject], Error>) -> ()) {
        var searchParameter = ""
        if let searchText = searchText {
            searchParameter = "&q=\(searchText)"
        }
        let stringUrl = baseUrl + path + "?category=\(category.rawValue)&language=en&page=\(page)" + searchParameter + "&apiKey=\(apiKey)"
        
        guard let url = URL(string: stringUrl) else { return }
        print(stringUrl)
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            handleResponse(data: data,
                           error: error,
                           completion: completion)
        }
        
        session.resume()
    }
    
    static func getBusinessNews(completion: @escaping (Result<[ArticleRensponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?category=business&language=en" + "&apiKey=\(apiKey)"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            handleResponse(data: data,
                           error: error,
                           completion: completion)
        }
        
        session.resume()
    }
    
    static func getImageData(url: String, completion: @escaping (Result<Data, Error>) -> ()) {
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, _, error in
            if let data = data {
                completion(.success(data))
            }
            
            if let error =  error {
                completion(.failure(error))
            }
        }
        
        session.resume()
    }
    
    // Handle response
    private static func handleResponse(data: Data?,
                                       error: Error?,
                                       completion: @escaping (Result<[ArticleRensponseObject], Error>) -> ()) {
        if let error = error {
            completion(.failure(NetworkingError.networkingError(error)))
        } else if let data = data {
            let json = try? JSONSerialization.jsonObject(with: data, options: [])
            print(json ?? "")
                  
            do {
                let model = try JSONDecoder().decode(NewsResponseObject.self,
                                                     from: data)
                completion(.success(model.articles))
            }
            catch let decodeError {
                completion(.failure(decodeError))
            }
        } else {
            completion(.failure(NetworkingError.unknown))
        }
    }
}

