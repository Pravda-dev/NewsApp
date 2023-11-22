//
//  BusinessViewController.swift
//  NewsApp
//
//  Created by pravda on 12.11.2023.
//

import UIKit
import SnapKit

class BusinessViewController: UIViewController, UICollectionViewDelegate {

    
    //MARK: - GUI Variables

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.sectionInset = UIEdgeInsets(top: 20, 
                                           left: 20,
                                           bottom: 20,
                                           right: 20)
        
//        layout.scrollDirection = .vertical
        
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height), collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        return collectionView
        
    }()
    
    //MARK: - Properties
    private var viewModel: BusinessViewModelProtocol
    
    //MARK: - Life Cycle
    init (viewModel: BusinessViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        collectionView.register(GeneralCollectionViewCell.self, forCellWithReuseIdentifier: "GeneralCollectionViewCell")
        
        collectionView.register(DetailsCollectionsViewCell.self, forCellWithReuseIdentifier: "DetailsCollectionsViewCell")
        
        viewModel.loadData()
    }
    
    //MARK: - Methods
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.reloadCell = { [weak self] row in
            self?.collectionView.reloadItems(at: [IndexPath(row: row, section: 0)])
            
        }
        
        viewModel.showError = { error in
            //TODO: Show alert with error
            print(error)
        }
    }
    
    //MARK: - Private methods
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)

        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension BusinessViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.numberOfCells > 1 ? 2 : 1
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                         numberOfItemsInSection section: Int) -> Int {
        if viewModel.numberOfCells > 1 {
            return section == 0 ? 1 : viewModel.numberOfCells - 1
        }
        
        return viewModel.numberOfCells
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewCell",
                                                                for: indexPath) as? GeneralCollectionViewCell
            let article = viewModel.getArticle(for: 0)
            cell?.set(article: article)
            
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionsViewCell",
                                                          for: indexPath) as? DetailsCollectionsViewCell
            let article = viewModel.getArticle(for: indexPath.row + 1)
            cell?.set(article: article)
            
            return cell ?? UICollectionViewCell()
            
        }
    }
}

//MARK: - UICollectionViewDelegate
extension BusinessViewController {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let article = viewModel.getArticle(for: indexPath.section == 0 ? 0 : indexPath.row + 1)
        navigationController?.pushViewController(NewsDetailViewController(viewModel: NewsViewModel(article: article)), animated: true)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout
extension BusinessViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, 
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        let firstSectionItemSize = CGSize(width: width,
                                      height: width)
        let secondSectionItemSize = CGSize(width: width,
                                           height: 100)
        
        return indexPath.section == 0 ? firstSectionItemSize : secondSectionItemSize
    }
}