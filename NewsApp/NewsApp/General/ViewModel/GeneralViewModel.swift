//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    
    //MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    
    private var articles: [ArticleRensponseObject] = [] {
        didSet {
            reloadData?()
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        return ArticleCellViewModel(article: article)
    }
    
    private func loadData() {
        
    }
    
    private func setupMockObjects() {
        articles = [
        ArticleRensponseObject(title: "First object title", 
                               description: "First object description",
                               urlToImage: "...",
                               publishedAt: "23.01.2023"),
        
        ArticleRensponseObject(title: "Second object title",
                               description: "Second object description",
                               urlToImage: "...",
                               publishedAt: "23.01.2023"),
        
        ArticleRensponseObject(title: "Third object title",
                               description: "Third object description",
                               urlToImage: "...",
                               publishedAt: "23.01.2023"),
        
        ArticleRensponseObject(title: "Fourth object title",
                               description: "Fourth object description",
                               urlToImage: "...",
                               publishedAt: "23.01.2023"),
        
        ArticleRensponseObject(title: "Fifth object title",
                               description: "Fifth object description",
                               urlToImage: "...",
                               publishedAt: "23.01.2023"),
        ]
    }
}
