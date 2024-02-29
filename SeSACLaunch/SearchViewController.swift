//
//  SearchViewController.swift
//  SeSACLaunch
//
//  Created by Madeline on 2/29/24.
//

import UIKit

class SearchViewController: UIViewController {
    
    let mainView = SearchView()
    let collectionView = UICollectionView()
    
    override func loadView() {
        view = mainView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: 프로토콜 실행 내가 하겠음 코드!!!!
        mainView.testDelegate = self
        
        print("🥟")
    }
    
    deinit {
        print("😴")
    }
}

extension SearchViewController: PassDataProtocol {
    func didSelectRowAT(indexPath: IndexPath) {
        // MARK: 프로토콜로 값 받아
        print("\(indexPath.row)")
        dismiss(animated: true)
    }
}

