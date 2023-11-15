//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import Foundation

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    
    init(article: ArticleRensponseObject) {
        title = article.title
        description = article.description
        date = article.publishedAt
        
    }
}
