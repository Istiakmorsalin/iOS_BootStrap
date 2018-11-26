//
//  EmptyBackgroundView.swift
//   
//
//  Created by Istiak on 8/10/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit
import SnapKit

class EmptyBackgroundView: UIView {
    private var placeholder: String?
    lazy private var placeholderLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = self.placeholder
        label.font = UIFont(name: Constants.Font.hiraginoSansW3, size: 13)
        label.textColor = #colorLiteral(red: 0.1450980392, green: 0.1450980392, blue: 0.1450980392, alpha: 1)
        return label
    }()

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    init(frame: CGRect, placeholder: String) {
        super.init(frame: frame)
        self.placeholder = placeholder
        setupViews()
    }

    private func setupViews() {
        addSubview(placeholderLabel)
        placeholderLabel.snp.makeConstraints { (make) -> Void in
            make.edges.equalTo(self).inset(UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
        }
    }
}
