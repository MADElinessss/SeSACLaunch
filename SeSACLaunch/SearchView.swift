//
//  SearchView.swift
//  SeSACLaunch
//
//  Created by Madeline on 2/29/24.
//

import SnapKit
import UIKit

/*
 weak:
 deinit이 안되는 순간 -> 잘 동작하게 하기 위해서!
 */

class SearchView: UIView {

    lazy var searchBar = {
        let view = UISearchBar()
        view.placeholder = "검색해주세요"
        view.delegate = self
        return view
    }() // 왜 괄호 넣어야되지???? -> 정리하기
    
    lazy var tableView = {
        let view = UITableView()
        view.delegate = self
        view.dataSource = self
        view.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return view
    }()
    
    weak var testDelegate: PassDataProtocol?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView() {
        addSubview(searchBar)
        addSubview(tableView)
    }
    
    func configureConstraints() {
        searchBar.snp.makeConstraints { make in
            make.top.horizontalEdges.equalToSuperview()
            make.height.equalTo(44)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }
}

extension SearchView: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("😇")
    }
}

extension SearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("\(indexPath.row)")
        // dismiss, present, alert 관련된 코드 X -> ViewController만이 담당함
        // 값 전달해야대 - closure, notification, delegate
        
        // custom protocol로 해보자: VC Label에 값 반영, dismiss
        // MARK: 프로토콜 메서드를 실행 -> 값 전달
        testDelegate?.didSelectRowAT(indexPath: indexPath)
    }
}
