//
//  GenderSelectionButton.swift
//   
//
//  Created by Istiak on 7/19/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit

class GenderSelectionButton: UIButton {
    var whiteColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    var pinkColor = #colorLiteral(red: 0.9960784314, green: 0.3803921569, blue: 0.6392156863, alpha: 1)
    var borderWidth: CGFloat =   1.0
    var selectedState: Int = 0
    
    override func awakeFromNib() {
        layer.cornerRadius = 40
        isSelected = false
        selectedState = 0
        backgroundColor = whiteColor
        addBorder(width: borderWidth, color: pinkColor)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateOnSelection()
    }
    
    func getSelectedState() -> Int {
        return selectedState
    }
    
    func updateOnSelection() {
        if isSelected {
            backgroundColor = pinkColor
            setTitleColor(whiteColor, for: .normal)
            selectedState = 1
        } else {
            backgroundColor = whiteColor
            addBorder(width: borderWidth, color: pinkColor)
            setTitleColor(pinkColor, for: .normal)
            selectedState = 0
        }
    }
}
