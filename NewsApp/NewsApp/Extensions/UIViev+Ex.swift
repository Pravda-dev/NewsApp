//
//  UIViev+Ex.swift
//  NewsApp
//
//  Created by pravda on 14.11.2023.
//

import UIKit

extension UIView {
    func addSubviews(_ views: [UIView]) {
        views.forEach { view in
            addSubview(view)
        }
    }
}
