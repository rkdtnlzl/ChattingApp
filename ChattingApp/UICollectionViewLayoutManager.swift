//
//  UICollectionViewLayoutManager.swift
//  ChattingApp
//
//  Created by 강석호 on 7/19/24.
//

import UIKit

class CollectionViewLayoutManager {
    static func createListLayout(itemHeight: CGFloat) -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: itemHeight)
        return layout
    }
}
