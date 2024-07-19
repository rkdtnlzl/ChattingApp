//
//  DiffableDataSource+.swift
//  ChattingApp
//
//  Created by 강석호 on 7/19/24.
//

import UIKit

typealias ChatDiffableDataSource = UICollectionViewDiffableDataSource<Section, Chat>

extension ChatDiffableDataSource {
    func applySnapshot(section: Section, items: [Chat], animatingDifferences: Bool = true) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Chat>()
        snapshot.appendSections([section])
        snapshot.appendItems(items)
        self.apply(snapshot, animatingDifferences: animatingDifferences)
    }
}
