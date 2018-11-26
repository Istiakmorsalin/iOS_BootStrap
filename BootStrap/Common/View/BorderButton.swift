//
//  BorderButton.swift
//   
//
//  Created by Istiak on 13/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

class BorderButton: UIButton {
    @IBInspectable var borderWidth: CGFloat =   0.5 { didSet { updateBorderWidth() }}
    @IBInspectable var borderColor:   UIColor = #colorLiteral(red: 0.9960784314, green: 0.3803921569, blue: 0.6392156863, alpha: 1) { didSet { updateBorderColor() }}

    override func layoutSubviews() {
        super.layoutSubviews()

        updateBorderWidth()
        updateBorderColor()
        self.cornerRadius = K.View.cornerRadius
    }

    func updateBorderWidth() {
        self.addBorder(width: borderWidth, color: borderColor)
    }

    func updateBorderColor() {
        self.addBorder(width: borderWidth, color: borderColor)
    }
}
