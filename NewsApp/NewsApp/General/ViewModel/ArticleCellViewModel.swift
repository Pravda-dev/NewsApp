//
//  ArticleCellViewModel.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import UIKit

final
class ArticleCellViewModel: tableCollectionsViewItemsProtocol {
    let title: String
    let description: String?
    let imageUrl: String?
    var date: String
    var imageData: Data?
    
    
    init(article: ArticleRensponseObject) {
        title = article.title
        description = article.description
        date = article.date
        imageUrl = article.urlToImage ?? "No description available"
        
        if let formateDate = formatDate(dateString: self.date) {
            self.date = formateDate
        }
    }
    
    private func formatDate(dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        guard let date = dateFormatter.date(from: dateString) else { return nil }
        
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
}
