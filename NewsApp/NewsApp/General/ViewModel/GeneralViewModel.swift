//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import Foundation

protocol GeneralViewModelProtocol {
    var reloadData: (() -> Void)? { get set }
    var showError: ((String) -> Void)? { get set}
    
    var numberOfCells: Int { get }
    
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class GeneralViewModel: GeneralViewModelProtocol {
    var reloadData: (() -> Void)?
    var showError: ((String) -> Void)?
    
    //MARK: - Properties
    var numberOfCells: Int {
        articles.count
    }
    
    private var articles: [ArticleCellViewModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.reloadData?()
            }
        }
    }
    
    init() {
        loadData()
    }
    
    func getArticle(for row: Int) -> ArticleCellViewModel {
        let article = articles[row]
        loadImage(for: row)
        return article
    }
    
    private func loadData() {
        ApiManager.getNews { [weak self] result in
            switch result {
            case .success(let articles):
                self?.articles = articles
            case.failure(let error):
                DispatchQueue.main.async {
                    self?.showError?(error.localizedDescription)
                }
            }
        }
    }
    
    private func loadImage(for row: Int) {
        //TODO: Get imageData
        
        articles[row].
    }
    
    private func convertToCellViewModel(_ article: ArticleRensponseObject) -> ArticleCellViewModel {
        ArticleCellViewModel(article: article)
    }
    
    private func setupMockObjects() {
        articles = [
        ArticleRensponseObject(title: "First object title", 
                               description: "First object description",
                               urlToImage: "...",
                               date: "23.01.2023"),
        
        ArticleRensponseObject(title: "Second object title",
                               description: "Second object description",
                               urlToImage: "...",
                               date: "23.01.2023"),
        
        ArticleRensponseObject(title: "Third object title",
                               description: "Third object description",
                               urlToImage: "...",
                               date: "23.01.2023"),
        
        ArticleRensponseObject(title: "Fourth object title",
                               description: "Fourth object description",
                               urlToImage: "...",
                               date: "23.01.2023"),
        
        ArticleRensponseObject(title: "Fifth object title",
                               description: "Fifth object description",
                               urlToImage: "...",
                               date: "23.01.2023"),
        ]
    }
}
