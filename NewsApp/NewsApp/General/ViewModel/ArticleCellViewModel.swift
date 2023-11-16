//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import UIKit

struct ArticleCellViewModel {
    let title: String
    let description: String
    let date: String
    let imageUrl: String
    var imageData: Data?
    
    
    init(article: ArticleRensponseObject) {
        title = article.title
        description = article.description
        date = article.date
        imageUrl = article.urlToImage
    }
}
