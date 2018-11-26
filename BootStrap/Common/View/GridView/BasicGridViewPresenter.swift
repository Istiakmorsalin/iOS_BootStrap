//
//  BasicGridViewPresenter.swift
//   
//
//  Created by Istiak on 8/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit.UICollectionView

protocol BasicGridViewPresenter {
    func setupGridView(_ gridView: UICollectionView)
    func nummberOfSections(in gridView: UICollectionView) -> Int
    func gridView(_ gridView: UICollectionView, numberOfItemsInSection section: Int ) -> Int
    func gridView(_ gridView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    func gridView(_ gridView:UICollectionView,  configureCell cell: UICollectionViewCell, at indexPath:IndexPath)
    func gridView(_ gridView: UICollectionView, didSelectItemAt indexPath: IndexPath)
}
