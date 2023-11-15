//
//  GeneralViewController.swift
//  NewsApp
//
//  Created by pravda on 12.11.2023.
//

import UIKit
import SnapKit

class GeneralViewController: UIViewController, UICollectionViewDelegate {

    
    //MARK: - GUI Variables
    private lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        
        return searchBar
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let width = (view.frame.width - 15) / 2
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
//        layout.scrollDirection = .vertical
        
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - searchBar.frame.height), collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
        
    }()
    
    //MARK: - Properties
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
    }
    
    //MARK: - Methods

    //MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        collectionView.register(GeneralCollectionViewCell.self, forCellWithReuseIdentifier: "GeneralCollectionViewCell")
        setupConstraints()
    }
    
    private func setupConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.equalToSuperview().inset(5)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension GeneralViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewCell",
                                                            for: indexPath) as? GeneralCollectionViewCell
        else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}

//MARK: - UICollectionViewDelegate
extension GeneralViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let news = NewsDetailViewController()
        news.newsTitle = "Apple Seeds Third Beta of macOS Sonoma 14.2 to Developers"
        news.newsDescription = "Apple today seeded the third beta of an upcoming macOS Sonoma 14.2 update to developers for testing purposes, with the software coming a week after Apple seeded the second beta of macOS Sonoma 14.2. Registered developers can opt-in to the beta through the Software Update section of the System Settings app. Under Beta updates, toggle on the Sonoma Developer Beta. Note that an Apple ID associated with an Apple Developer account is required to get the beta. macOS Sonoma‌ 14.2 adds an Apple Music Favorites playlist that houses everything you've favorited, plus Apple added support for collaborative playlists. You can now share a playlist with multiple people, and each participant can add songs. Shazam can also be added to the Control Center or menu bar on the Mac. Stickers can be used to reply to iMessages when you long press on a chat bubble in the Messages app, and there's also now support for the extra-secure iMessage Contact Key Verification option."
        news.newsDate = "November 14, 2023"
        
        navigationController?.pushViewController(news, animated: true)
    }
}
