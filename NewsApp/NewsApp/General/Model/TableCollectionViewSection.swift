//
//  TableCollectionViewSection.swift
//  NewsApp
//
//  Created by pravda on 24.11.2023.
//

import UIKit

protocol tableCollectionsViewItemsProtocol { }

struct TableCollectionViewSection {
    var title: String?
    var items: [tableCollectionsViewItemsProtocol]
    
    
}
