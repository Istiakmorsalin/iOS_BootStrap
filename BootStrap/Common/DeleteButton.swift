//
//  DeleteButton.swift
//   
//
//  Created by Istiak on 9/8/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit.UIButton

class DeleteButton: UIButton {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    var isDeletable: Bool = false {
        didSet {
            if isDeletable {
                self.setImage(nil, for: .normal)
                self.setTitle("キャンセル", for: .normal)
                self.sizeToFit()
            } else {
                self.setTitle(nil, for: .normal)
                self.setImage(#imageLiteral(resourceName: "bin"), for: .normal)
                self.sizeToFit()
            }
        }
    }

    private func commonInit() {
        self.tintColor = .white
        self.setTitleColor(#colorLiteral(red: 0.9960784314, green: 0.3803921569, blue: 0.6392156863, alpha: 1), for: .normal)
        self.isDeletable = false
        self.titleLabel?.font =  UIFont(name: Constants.Font.hiraginoSansW6, size: 14)
    }
}
