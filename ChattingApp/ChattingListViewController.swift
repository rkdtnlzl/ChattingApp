//
//  ChattingListViewController.swift
//  ChattingApp
//
//  Created by 강석호 on 7/18/24.
//

import UIKit
import SnapKit

final class ChattingListViewController: BaseViewController {
    
    let searchBar = UISearchBar()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: CollectionViewLayoutManager.createListLayout(itemHeight: 100))
    var chatRoom = mockChatList.first { $0.chatroomId == 1 }
    var filteredList: [Chat] = []
    var isFiltering: Bool {
        return !(searchBar.text?.isEmpty ?? true)
    }
    var dataSource: ChatDiffableDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        filteredList = chatRoom?.chatList ?? []
        configureNavigation()
        configureDataSource()
        updateSnapshot()
    }
    
    override func configureHierarchy() {
        view.addSubview(searchBar)
        view.addSubview(collectionView)
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func configureNavigation() {
        self.navigationItem.title = "TRAVEL TALK"
    }
    
    func configureDataSource() {
        dataSource = CollectionViewDataSourceManager.createChatDataSource(for: collectionView)
    }
    
    func updateSnapshot() {
        dataSource.applySnapshot(section: .main, items: filteredList)
    }
}

extension ChattingListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let chatList = chatRoom?.chatList else { return }
        if searchText.isEmpty {
            filteredList = chatList
        } else {
            filteredList = chatList.filter { $0.user.rawValue.lowercased().contains(searchText.lowercased()) }
        }
        updateSnapshot()
    }
}
