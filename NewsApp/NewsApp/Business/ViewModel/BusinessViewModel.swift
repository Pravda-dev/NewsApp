//
//  BusinessViewModel.swift
//  NewsApp
//
//  Created by pravda on 19.11.2023.
//

import UIKit

final class BusinessViewModel: NewsListViewModel {
    
<<<<<<< HEAD
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)
        
        ApiManager.getNews(from: .business, 
                           page: page,
                           searchText: searchText) { [weak self] result in
            self?.handleResult(result)
=======
    var numberOfCells: Int { get }
    
<<<<<<< HEAD
    func loadData()
=======
>>>>>>> BusinessViewModel
    func getArticle(for row: Int) -> ArticleCellViewModel
}

final class BusinessViewModel: BusinessViewModelProtocol {
    var reloadData: (() -> Void)?
    var reloadCell: ((Int) -> Void)?
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
    
<<<<<<< HEAD
=======
    init() {
        loadData()
    }
    
>>>>>>> BusinessViewModel
    func getArticle(for row: Int) -> ArticleCellViewModel {
        return articles[row]
    }
    
<<<<<<< HEAD
    func loadData() {
        print(#function)
        
        ApiManager.getNews(from: .business) { [weak self] result in
=======
    private func loadData() {
        ApiManager.getBusinessNews { [weak self] result in
>>>>>>> BusinessViewModel
            guard let self = self else { return }
>>>>>>> 4f293bfcc9c7db2035cef9467e7d59a236717465
            
        
        }
    }
    
<<<<<<< HEAD
    override func convertToCellViewModel(_ articles: [ArticleRensponseObject]) {
        var viewModels = articles.map { ArticleCellViewModel(article: $0) }
        
        if sections.isEmpty {
            let firstSection = TableCollectionViewSection(items: [viewModels.removeFirst()])
            let secondSection = TableCollectionViewSection(items: viewModels)
            sections = [firstSection, secondSection]
        } else {
            sections[1].items += viewModels
=======
    private func loadImage() {
        for (index, article) in articles.enumerated() {
<<<<<<< HEAD
            guard let url = article.imageUrl else { return }
            ApiManager.getImageData(url: url) { [weak self] result in
=======
            ApiManager.getImageData(url: article.imageUrl) { [weak self] result in
>>>>>>> BusinessViewModel
                
                DispatchQueue.main.async {
                    switch result {
                    case .success(let data):
                        self?.articles[index].imageData = data
                        self?.reloadCell?(index)
                    case .failure(let error):
                        self?.showError?(error.localizedDescription)
                    }
                }
            }
>>>>>>> 4f293bfcc9c7db2035cef9467e7d59a236717465
        }
    }
}
