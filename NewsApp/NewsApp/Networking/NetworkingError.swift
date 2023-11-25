//
//  NetworkingError.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import UIKit

enum NetworkingError: Error {
    case networkingError(_ error: Error)
    case unknown
}
