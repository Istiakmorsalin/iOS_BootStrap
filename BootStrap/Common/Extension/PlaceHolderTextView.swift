//
//  PlaceHolderTextView.swift
//
//  Created by Istiak on 2018/10/03.
//

import Foundation
import UIKit

@IBDesignable class PlaceHolderTextView: UITextView {
    private lazy var placeHolderLabel: UILabel = UILabel(frame: CGRect(x: 4.0,
                                                                       y: 2.0,
                                                                       width: 250.0,
                                                                       height: 30.0))

    private func configurePlaceHolder() {
        self.placeHolderLabel.lineBreakMode = .byWordWrapping
        self.placeHolderLabel.font = self.font
        self.placeHolderLabel.textColor = UIColor(red: 0.0,
                                                  green: 0.0,
                                                  blue: 0.0980392,
                                                  alpha: 0.22)
        self.placeHolderLabel.backgroundColor = .clear
        self.addSubview(placeHolderLabel)
    }

    func configureBorder() {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = #colorLiteral(red: 0.6078431373, green: 0.6078431373, blue: 0.6078431373, alpha: 1)
    }

    private func changeVisiblePlaceHolder() {
        if !self.text.isEmpty {
            self.placeHolderLabel.alpha = 0.0
        } else {
            self.placeHolderLabel.alpha = 1.0
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        self.configurePlaceHolder()
        self.changeVisiblePlaceHolder()
        self.configureBorder()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(textChanged),
                                               name: UITextView.textDidChangeNotification,
                                               object: nil)
    }

    @objc private func textChanged(notification: NSNotification?) {
        changeVisiblePlaceHolder()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @IBInspectable var placeHolder: String = "" {
        didSet {
            self.placeHolderLabel.text = self.placeHolder
        }
    }
}
