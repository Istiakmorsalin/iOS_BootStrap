//
//  BasicGridView.swift
//   
//
//  Created by Istiak on 8/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit.UICollectionView

class BasicGridView: UIView {
    
    struct Appearence {
        let insets: UIEdgeInsets
        let cellSpacing: CGFloat
        let cellsPerLine: Int
        let cellWidth: CGFloat?
        let cellHeight: CGFloat?
        let isPagingEnabled: Bool
        let allowsSelection: Bool
        let isScrollEnabled: Bool
        let scrollDirection: UICollectionViewScrollDirection
        let isUserInteractionEnabled: Bool
        
        init(insets: UIEdgeInsets, cellSpacing: CGFloat,
             cellsPerLine: Int,cellWidth: CGFloat? = nil,
             cellHeight: CGFloat? = nil,
             isPagingEnabled: Bool = false,
             allowsSelection: Bool = false,
             isScrollEnabled: Bool = false,
             isUserInteractionEnabled: Bool = false,
             scrollDirection: UICollectionViewScrollDirection = .vertical) {

            self.insets = insets
            self.cellSpacing = cellSpacing
            self.cellsPerLine = cellsPerLine
            self.cellWidth = cellWidth
            self.cellHeight = cellHeight
            self.isPagingEnabled = isPagingEnabled
            self.allowsSelection = allowsSelection
            self.scrollDirection = scrollDirection
            self.isUserInteractionEnabled = isUserInteractionEnabled
            self.isScrollEnabled = isScrollEnabled
        }
    }
    
    var appearence = Appearence(insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0), cellSpacing: 0, cellsPerLine: 1, scrollDirection: .vertical) {
        didSet {
            let layout = UICollectionViewFlowLayout()
            layout.minimumLineSpacing = appearence.cellSpacing
            layout.minimumInteritemSpacing = appearence.cellSpacing
            layout.scrollDirection = appearence.scrollDirection
            collectionView.collectionViewLayout = layout
            collectionView.allowsSelection = appearence.allowsSelection
            collectionView.isPagingEnabled = appearence.isPagingEnabled
            collectionView.isUserInteractionEnabled = appearence.isUserInteractionEnabled
            collectionView.isScrollEnabled = appearence.isScrollEnabled
        }
    }
    
    var presenter: BasicGridViewPresenter? {
        didSet {
            presenter?.setupGridView(collectionView)
            collectionView.reloadData()
        }
    }
    
    weak var delegate: GridViewDelegate!
   
    
    public func reloadData() {
      collectionView.reloadData()
    }
    
    var collectionView: UICollectionView!
    
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
            collectionView.allowsSelection = false
            collectionView.isScrollEnabled = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.showsVerticalScrollIndicator = false
            collectionView.isUserInteractionEnabled = false
            
            addSubview(collectionView)
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[collectionView]-0-|", options: .alignAllCenterY, metrics: nil, views: ["collectionView": collectionView]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[collectionView]-0-|", options: .alignAllCenterX, metrics: nil, views: ["collectionView": collectionView]))
            
            presenter?.setupGridView(collectionView)
        }
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
    
}

extension BasicGridView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.gridView(collectionView, didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //presenter?.gridView(collectionView, didDeSelectItemAt: indexPath)
    }
}

extension BasicGridView: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return presenter?.nummberOfSections(in: collectionView) ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter?.gridView(collectionView, numberOfItemsInSection: section) ?? 0
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

extension BasicGridView: UICollectionViewDelegateFlowLayout {
    
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

extension BasicGridView {
    func scrollToNextCell(autoReset: Bool = false) {
        //get cell size
        let w = expectedCellWidth()
        let cellSize = CGSize(width: w, height: appearence.cellHeight ?? w)
        
        //get current content Offset of the Collection view
        let contentWidth = collectionView.contentSize.width
        let contentOffset = collectionView.contentOffset
        let widthToScroll = contentOffset.x + cellSize.width

        let x = autoReset ? (widthToScroll >= contentWidth ? 0 : widthToScroll) : widthToScroll
        collectionView.scrollRectToVisible(CGRect(x: x, y: contentOffset.y, width: cellSize.width, height: cellSize.height), animated: true)
    }

    func scrollToItem(_ item: Int, animated: Bool = true) {
        let indexPath = IndexPath(item: item, section: 0)
        if collectionView.isValidate(indexPath) {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: animated)
        }
    }
    
    func resetScrollPosition(animated: Bool = true) {
        let w = expectedCellWidth()
        let cellSize = CGSize(width: w, height: appearence.cellHeight ?? w)
        collectionView.scrollRectToVisible(CGRect(x: 0, y: 0, width: cellSize.width, height: cellSize.height), animated: true)
    }
}

extension BasicGridView: UIScrollViewDelegate {
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if self.delegate != nil {
            self.delegate.scrollViewDidBeginDraggingAction(status: true)
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if !decelerate {
            self.stoppedScrolling(scrollView)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        self.stoppedScrolling(scrollView)
    }
    
    private func stoppedScrolling(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / collectionView.w)
        if self.delegate != nil {
            self.delegate.scrollViewDidEndDeceleratingAction(status: true, index: index)
        }
    }
}

protocol GridViewDelegate: class {
    func scrollViewDidBeginDraggingAction(status: Bool)
    func scrollViewDidEndDeceleratingAction(status: Bool, index: Int)
}
