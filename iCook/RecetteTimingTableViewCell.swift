//
//  RecetteTimingTableViewCell.swift
//  iCook
//
//  Created by Julie Saby on 09/03/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit

class RecetteTimingTableViewCell: UITableViewCell {

	@IBOutlet weak var prepaTime: UILabel!
	@IBOutlet weak var cuissonTime: UILabel!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

	func configure(tprepa: Int, tcuisson: Int) {
		self.prepaTime?.text = " \(tprepa) min"  //change le text du label avec le .text
		self.cuissonTime?.text = " \(tcuisson) min"
	}

}
