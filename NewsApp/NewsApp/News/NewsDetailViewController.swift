//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by pravda on 14.11.2023.
//

import UIKit
import SnapKit

class NewsDetailViewController: UIViewController {
    //MARK: UI Variables
    
    private lazy var scrollView: UIScrollView = {
        let view = UIScrollView()
        
        view.showsVerticalScrollIndicator = false
        
        return view
    }()
    
    private lazy var contentView: UIView = UIView()
    
    private lazy var newsImageView: UIImageView = {
        let view = UIImageView()
        
        view.image = UIImage(named: "newsDetailImage") ?? UIImage.add
        view.backgroundColor = .white
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        
        return view
    }()
    
    private lazy var newsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.largeTitle)
        label.numberOfLines = 0
        label.text = "It will news at this place"
        
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    //MARK: - Properties
    var newsTitle: String?
    var newsDescription: String?
    var newsDate: String?
    
    //MARK: - Life cycles
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    //MARK: - Methods
    
    //MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubviews([newsImageView,
                               newsTitleLabel,
                               descriptionLabel,
                               dateLabel])
        
        populateData()
        setupConstraints()
    }
    
    private func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.width.edges.equalToSuperview()
//            make.size.edges.equalToSuperview()
        }
        
        newsImageView.snp.makeConstraints { make in
            make.top.leading.trailing.equalToSuperview().inset(4)
            make.height.equalTo(view.snp.height).multipliedBy(0.25)
        }
        
        newsTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(newsImageView.snp.bottom).offset(1)
            make.leading.trailing.equalToSuperview().inset(6)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(newsTitleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(6)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(descriptionLabel.snp.bottom).offset(5)
            make.leading.trailing.bottom.equalToSuperview().inset(6)
        }
    }
    
    private func populateData() {
        newsTitleLabel.text = newsTitle
        descriptionLabel.text = newsDescription
        dateLabel.text = newsDate
    }
}
//MARK: - UITextFieldDelegate
extension NewsDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if descriptionLabel.isFirstResponder {
            descriptionLabel.becomeFirstResponder()
        } else {
            scrollView.endEditing(true)
        }
        
        return true
    }
}