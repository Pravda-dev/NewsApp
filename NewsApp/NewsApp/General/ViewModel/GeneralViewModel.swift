//
//  GeneralViewModel.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import UIKit

final class GeneralViewModel: NewsListViewModel {
    
    override func loadData(searchText: String?) {
        super.loadData(searchText: searchText)

        ApiManager.getNews(from: .general,
                           page: page,
                           searchText: searchText) { [weak self] result in
            self?.handleResult(result)
        }
    }
}
