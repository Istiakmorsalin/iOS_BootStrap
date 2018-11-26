//
//  UnderlineButton.swift
//   
//
//  Created by Istiak on 7/8/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

class UnderlineButton: UIButton {
    private var underlineView: UIView!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    private func commonInit() {
        self.setTitleColor(#colorLiteral(red: 0.4509803922, green: 0.4509803922, blue: 0.4509803922, alpha: 1), for: .normal)
        self.setTitleColor(#colorLiteral(red: 0.1930259168, green: 0.1930313706, blue: 0.19302845, alpha: 1), for: .selected)
        self.tintColor = .white
    }
}
