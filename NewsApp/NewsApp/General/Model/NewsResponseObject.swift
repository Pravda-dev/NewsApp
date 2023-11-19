//
//  NewsResponseObject.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import Foundation

struct NewsResponseObject: Codable {
    let totalResults: Int
    let articles: [ArticleRensponseObject]
    
    enum CodingKeys: CodingKey {
        case totalResults
        case articles
    }
}
