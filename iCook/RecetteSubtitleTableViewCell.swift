//
//  RecetteSubtitleTableViewCell.swift
//  iCook
//
//  Created by Julie Saby on 09/03/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit

class RecetteSubtitleTableViewCell: UITableViewCell {

	@IBOutlet weak var subtitleLabel: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func configure(_ subtitle: String) {
		self.subtitleLabel.text = subtitle
	}

}
