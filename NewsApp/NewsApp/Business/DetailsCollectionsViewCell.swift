//
//  DetailsCollectionsViewCell.swift
//  NewsApp
//
//  Created by pravda on 15.11.2023.
//

import UIKit
import SnapKit

final class DetailsCollectionsViewCell: UICollectionViewCell {
    //MARK: - GUI Variables
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        
//        view.image = UIImage(named: "businessImage")
//        view.contentMode = .scaleAspectFill
//        view.layer.masksToBounds = true
        
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Title"
        label.textColor = .white
        
        return label
    }()
    
//    private lazy var descriptionLabel: UILabel = {
//        let label = UILabel()
//        
//        label.font = .systemFont(ofSize: 14)
//        label.textColor = .gray
//        label.text = "another text another text another text another text another text another text another text another text another text another text another text another text another text another text another text another text "
//        label.numberOfLines = 2
//        
//        return label
//    }()
    //MARK: - Initializations
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Methods
    func set(article: ArticleCellViewModel) {
        titleLabel.text = article.title
        
        if let data = article.imageData,
            let image = UIImage(data: data) {
            imageView.image = image
        } else {
            imageView.image = UIImage(named: "image")
        }
    }
    
    //MARK: - Private methods
    private func setupUI() {
        addSubview(imageView)
        addSubview(titleLabel)
//        addSubview(descriptionLabel)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.leading.bottom.equalToSuperview()
            make.width.height.equalTo(self.frame.height)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.leading.equalTo(imageView.snp.trailing).offset(5)
        }
        
//        descriptionLabel.snp.makeConstraints { make in
//            make.top.equalTo(titleLabel.snp.bottom).offset(5)
//            make.leading.equalTo(imageView.snp.trailing).offset(5)
//            make.trailing.equalToSuperview()
//        }
    }
}
