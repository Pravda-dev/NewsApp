//
//  ApiManager.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import UIKit

final class ApiManager {
    private static let apiKey = "b5f227d594134f2da38106545d2e0455"
    private static let baseUrl = "https://newsapi.org/v2/"
    private static let path = "everything"
    
    //Create url path and make request
    static func getNews(completion: @escaping (Result<[ArticleRensponseObject], Error>) -> ()) {
        let stringUrl = baseUrl + path + "?sources=bbc-news&language=en" + "&apiKey=\(apiKey)"
        
        guard let url = URL(string: stringUrl) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            handleResponse(data: data,
                           error: error,
                           completion: completion)
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

