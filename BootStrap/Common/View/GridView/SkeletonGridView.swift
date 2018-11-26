//
//  SkeletonGridView.swift
//   
//
//  Created by Istiak on 4/9/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit.UICollectionView
import SkeletonView

class SkeletonGridView: UIView {

    struct Appearence {
        let insets: UIEdgeInsets
        let cellSpacing: CGFloat
        let cellsPerLine: Int
        let cellWidth: CGFloat?
        let cellHeight: CGFloat?
        var isPagingEnabled = false
        var allowsSelection = false
        var isUserInteractionEnabled = true
        let scrollDirection: UICollectionViewScrollDirection

        init(insets: UIEdgeInsets, cellSpacing: CGFloat, cellsPerLine: Int,cellWidth: CGFloat? = nil, cellHeight: CGFloat? = nil, scrollDirection: UICollectionViewScrollDirection = .vertical) {
            self.insets = insets
            self.cellSpacing = cellSpacing
            self.cellsPerLine = cellsPerLine
            self.cellWidth = cellWidth
            self.cellHeight = cellHeight
            self.scrollDirection = scrollDirection
        }
    }

    var appearence = Appearence(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), cellSpacing: 0, cellsPerLine: 1, scrollDirection: .vertical) {
        didSet {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = appearence.cellSpacing
            layout.minimumInteritemSpacing = appearence.cellSpacing
            layout.scrollDirection = appearence.scrollDirection
            collectionView.collectionViewLayout = layout
        }
    }

    var presenter: SkeletonGridViewPresenter? {
        didSet {
            presenter?.setupGridView(collectionView)
            collectionView.reloadData()
        }
    }

    public func reloadData() {
        collectionView.reloadData()
    }

    public func setBottomInset(_ height: CGFloat) {
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: height, right: 0)
    }

    var collectionView: UICollectionView!
    var isFirstLoad = true
    private func commonInit() {
        if collectionView == nil {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = appearence.cellSpacing
            layout.minimumInteritemSpacing = appearence.cellSpacing
            layout.scrollDirection = .horizontal

            collectionView = UICollectionView(frame: bounds, collectionViewLayout: layout)
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            collectionView.backgroundColor = .white
            collectionView.isPagingEnabled = false
            collectionView.allowsSelection = true
            collectionView.isScrollEnabled = true
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            collectionView.isUserInteractionEnabled = true
            addSubview(collectionView)

            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[collectionView]-0-|", options: .alignAllCenterY, metrics: nil, views: ["collectionView": collectionView]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[collectionView]-0-|", options: .alignAllCenterX, metrics: nil, views: ["collectionView": collectionView]))

            presenter?.setupGridView(collectionView)

        }
        collectionView.isPrefetchingEnabled = true
        collectionView.reloadData()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    override func didMoveToWindow() {
        super.didMoveToWindow()
        if isFirstLoad {
            self.collectionView.showSkeleton()
            isFirstLoad = false
        }
    }
}

extension SkeletonGridView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.gridView(collectionView, didSelectItemAt: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //        presenter?.gridView(collectionView, didDeSelectItemAt: indexPath)
    }
}

extension SkeletonGridView: SkeletonCollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter?.nummberOfSections(in: collectionView) ?? 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.gridView(collectionView, numberOfItemsInSection: section) ?? 0
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, cellIdentifierForItemAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return presenter!.collectionSkeletonView(skeletonView, cellIdentifierForItemAt: indexPath)
    }

    func collectionSkeletonView(_ skeletonView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter!.collectionSkeletonView(skeletonView, numberOfItemsInSection: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let presenter = presenter else {
            return UICollectionViewCell()
        }

        let cell = presenter.gridView(collectionView, cellForItemAt: indexPath)
        presenter.gridView(collectionView, configureCell: cell, at: indexPath)

        return cell
    }
}

extension SkeletonGridView: UICollectionViewDelegateFlowLayout {

    private func expectedCellWidth() -> CGFloat {
        let a = appearence
        let padding = a.insets.left + a.insets.right
        let cpl = CGFloat(a.cellsPerLine)
        let space = a.cellSpacing * (cpl - 1)
        return (bounds.width - padding - space) / cpl
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let w = appearence.cellWidth ?? expectedCellWidth()
        return CGSize(width: w, height: appearence.cellHeight ?? w)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return appearence.insets
    }
}

extension SkeletonGridView {
    func scrollToNextCell() {
        //get cell size
        let w = expectedCellWidth()
        let cellSize = CGSize(width: w, height: appearence.cellHeight ?? w)

        //get current content Offset of the Collection view
        let contentWidth = collectionView.contentSize.width
        let contentOffset = collectionView.contentOffset
        let widthToScroll = contentOffset.x + cellSize.width
        let x = widthToScroll >= contentWidth ? 0 : widthToScroll

        //scroll to next cell
        collectionView.scrollRectToVisible(CGRect(x: x, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)

    }

    func resetScrollPosition() {
        let w = expectedCellWidth()
        let cellSize = CGSize(width: w, height: appearence.cellHeight ?? w)
        collectionView.scrollRectToVisible(CGRect(x: 0, y: 0, width: cellSize.width, height: cellSize.height), animated: false)
    }
}
