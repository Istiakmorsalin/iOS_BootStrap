//
//  UIImageView+Extra.swift
//   
//
//  Created by Istiak on 27/9/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    func setImageFromURL(_ url: URL?, placeholder ph: UIImage = #imageLiteral(resourceName: "placeholderimage"), animated: Bool = false) {
        let transition: ImageTransition = (animated) ? ImageTransition.fade(1) : .none
        self.kf
            .setImage(with: url, placeholder: ph,
                      options: [.transition(transition)],
                      progressBlock: { (_, _) in })
            { (_, _, _, _) in }
    }
}
