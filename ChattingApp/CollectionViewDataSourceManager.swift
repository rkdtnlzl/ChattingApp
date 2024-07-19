//
//  CollectionViewDataSourceManager.swift
//  ChattingApp
//
//  Created by 강석호 on 7/19/24.
//

import UIKit

class CollectionViewDataSourceManager {
    static func createChatDataSource(for collectionView: UICollectionView) -> UICollectionViewDiffableDataSource<Section, Chat> {
        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Chat> { (cell, indexPath, chat) in
            var content = UIListContentConfiguration.subtitleCell()
            content.text = chat.user.rawValue
            content.textProperties.color = .black
            content.textProperties.font = .boldSystemFont(ofSize: 17)
            content.secondaryText = chat.message
            content.image = UIImage(named: "\(chat.user.rawValue)")
            let imageSize = CGSize(width: 60, height: 60)
            content.imageProperties.reservedLayoutSize = imageSize
            content.imageProperties.maximumSize = imageSize
            content.imageProperties.cornerRadius = 40
            cell.contentConfiguration = content
        }
        
        return UICollectionViewDiffableDataSource<Section, Chat>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, item: Chat) -> UICollectionViewCell? in
            return collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        }
    }

    static func applySnapshot(to dataSource: UICollectionViewDiffableDataSource<Section, Chat>, section: Section, items: [Chat], animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Chat>()
        snapshot.appendSections([section])
        snapshot.appendItems(items)
        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
