//
//  BasicCollectionViewCell.swift
//   
//
//  Created by Istiak on 26/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit
import Kingfisher

class BasicCollectionViewCell: UICollectionViewCell, Cellable {

    @IBOutlet weak var imageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configure(_ url: URL?) {
        imageView.setImageFromURL(url)
    }

    func configure(_ photo: UIImage) {
        imageView.image = photo
    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
