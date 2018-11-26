//
//  PhraseTableViewCell.swift
//   
//
//  Created by Istiak on 12/7/18.
//  Copyright © 2018 Monstar Lab Bangladesh Ltd. All rights reserved.
//

import UIKit
import Kingfisher
import SkeletonView

class BasicTableViewCell: UITableViewCell, Cellable {
    @IBOutlet weak var lyricsLabel: VerticalAlignLabel!
    @IBOutlet weak var pictureCountLabel: UILabel!
    @IBOutlet weak var messageUsageCountLabel: UILabel!
    @IBOutlet weak var favoriteCountLabel: UILabel!
    @IBOutlet weak var thnumImageView: UIImageView!
    @IBOutlet weak var viewMoreButton: BorderButton!
    @IBOutlet weak var userPhraseButton: GradientButton!
    
    var viewMoreButtonAction: ((BasicTableViewCell) -> Void)?
    var phraseButtonAction: ((BasicTableViewCell) -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()

        lyricsLabel.verticalAlignment = .top
        lyricsLabel.lastLineFillPercent = 50 
        lyricsLabel.linesCornerRadius = 2
    }

    @IBAction func viewMoreButtonPressed(_ sender: BorderButton) {
        self.viewMoreButtonAction?(self)
    }

    @IBAction func phraseButtonPressed(_ sender: GradientButton) {
        self.phraseButtonAction?(self)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
