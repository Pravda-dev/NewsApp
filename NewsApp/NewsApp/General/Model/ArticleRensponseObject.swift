//
//  ArticleRensponseObject.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import Foundation

struct ArticleRensponseObject: Codable {
    let title: String
    let description: String
    let urlToImage: String
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case urlToImage
        case date = "publishedAt"
    }
}
