//
//  BusinessViewController.swift
//  NewsApp
//
//  Created by pravda on 12.11.2023.
//

import UIKit
import SnapKit

final class BusinessViewController: UIViewController, UICollectionViewDelegate {

    
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
<<<<<<< HEAD
    private var viewModel: NewsListViewModelProtocol
=======
    private var viewModel: BusinessViewModelProtocol
<<<<<<< HEAD:NewsApp/NewsApp/Business/View/BusinessViewController.swift
>>>>>>> 4f293bfcc9c7db2035cef9467e7d59a236717465
    
=======

>>>>>>> BusinessViewModel:NewsApp/NewsApp/Business/BusinessViewController.swift
    //MARK: - Life Cycle
    init (viewModel: NewsListViewModelProtocol) {
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
        
        viewModel.loadData(searchText: nil)
    }
    
    //MARK: - Methods
    private func setupViewModel() {
        viewModel.reloadData = { [weak self] in
            self?.collectionView.reloadData()
        }
        
        viewModel.reloadCell = { [weak self] IndexPath in
            self?.collectionView.reloadItems(at: [IndexPath])
            
        }
        
        viewModel.showError = { error in
<<<<<<< HEAD:NewsApp/NewsApp/Business/View/BusinessViewController.swift
            print(error)
        }
    }
    
    //MARK: - Private methods
=======
            //TODO: Show alert with error
            print(error)
        }
    }

>>>>>>> BusinessViewModel:NewsApp/NewsApp/Business/BusinessViewController.swift
    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(collectionView)

        setupConstraints()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(5)
            make.top.bottom.equalToSuperview()
//            make.top.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

//MARK: - UICollectionViewDataSource
extension BusinessViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        viewModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, 
                         numberOfItemsInSection section: Int) -> Int {
        viewModel.sections[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let article = viewModel.sections[indexPath.section].items[indexPath.row] as? ArticleCellViewModel else { return UICollectionViewCell() }
        
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GeneralCollectionViewCell",
                                                                for: indexPath) as? GeneralCollectionViewCell
            cell?.set(article: article)
            
            return cell ?? UICollectionViewCell()
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DetailsCollectionsViewCell",
                                                          for: indexPath) as? DetailsCollectionsViewCell
            cell?.set(article: article)
            
            return cell ?? UICollectionViewCell()
            
        }
<<<<<<< HEAD:NewsApp/NewsApp/Business/View/BusinessViewController.swift
=======
        
        let article = viewModel.getArticle(for: indexPath.row)
        cell.set(article: article)
        
        return cell ?? UICollectionViewCell()
>>>>>>> BusinessViewModel:NewsApp/NewsApp/Business/BusinessViewController.swift
    }
}

//MARK: - UICollectionViewDelegate
extension BusinessViewController {
<<<<<<< HEAD:NewsApp/NewsApp/Business/View/BusinessViewController.swift
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let article = viewModel.sections[indexPath.section].items[indexPath.row] as? ArticleCellViewModel else { return }
        navigationController?.pushViewController(NewsDetailViewController(viewModel: NewsViewModel(article: article)), animated: true)
=======
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        let article = viewModel.getArticle(for: indexPath.row)
        navigationController?.pushViewController(NewsDetailViewController(viewModel: NewsViewModel(article: article)),
                                                 animated: true)
>>>>>>> BusinessViewModel:NewsApp/NewsApp/Business/BusinessViewController.swift
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        if indexPath.row == (viewModel.sections[1].items.count - 12) {
            viewModel.loadData(searchText: nil)
            
        }
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
