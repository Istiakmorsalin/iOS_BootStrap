//
//  BasicGridView.swift
//   
//
//  Created by Istiak on 8/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit.UITableView
import SkeletonView

class BasicListView: UIView {

    struct Appearence {
        let insets: UIEdgeInsets
        let cellHeight: CGFloat?
        var isPagingEnabled = true
        var allowsSelection = false
        var isUserInteractionEnabled = true
        
        init(insets: UIEdgeInsets, cellHeight: CGFloat? = nil) {
            self.insets = insets
            self.cellHeight = cellHeight
        }
    }

    var presenter: BasicListViewPresenter? {
        didSet {
            presenter?.setupListView(tableView)
        }
    }
    
    var tableView: PagingTableView!
    var isFirstLoad = true

    private func commonInit() {
        if tableView == nil {
            tableView = PagingTableView()
            tableView.delegate = self
            tableView.dataSource = self
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.backgroundColor = .white
            tableView.allowsSelection = true
            tableView.isScrollEnabled = true
            tableView.showsHorizontalScrollIndicator = false
            tableView.showsVerticalScrollIndicator = false
            tableView.isUserInteractionEnabled = true
            tableView.separatorInset = UIEdgeInsetsMake(0, 16, 0, 16)
            addSubview(tableView)
            
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableView]-0-|", options: .alignAllCenterY, metrics: nil, views: ["tableView": tableView]))
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-0-[tableView]-0-|", options: .alignAllCenterX, metrics: nil, views: ["tableView": tableView]))
            
            presenter?.setupListView(tableView)
        }
        tableView.tableFooterView = UIView(frame: .zero)
        tableView.isSkeletonable = true
        self.isSkeletonable = true
        tableView.reloadData()
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
            self.showSkeleton()
            isFirstLoad = false
        }
    }
}

extension BasicListView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.tableView(tableView, didSelectRowAt: indexPath)
    }

}

extension BasicListView: SkeletonTableViewDataSource {
    func numberOfSections(in tableview: UITableView) -> Int {
        return presenter?.nummberOfSections(in: tableview) ?? 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.tableView(tableView, numberOfRowsInSection: section) ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let presenter = presenter else {
            return UITableViewCell()
        }

        let cell = presenter.tableView(tableView, cellForRowAt: indexPath)
        presenter.tableView(tableView, configureCell: cell, at: indexPath)

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return presenter?.tableView(tableView, heightForRowAt: indexPath) ?? 110
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return presenter!.collectionSkeletonView(skeletonView, cellIdentifierForRowAt: indexPath)
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter!.collectionSkeletonView(skeletonView, numberOfRowsInSection: section)
    }
    
 }
