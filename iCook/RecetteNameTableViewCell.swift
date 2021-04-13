//
//  RecetteNameTableViewCell.swift
//  iCook
//
//  Created by Julie Saby on 09/03/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit

class RecetteNameTableViewCell: UITableViewCell {

	@IBOutlet weak var recetteName: UILabel!
	
	var name: String?
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		if let name = self.name {
			self.recetteName?.text = name
		}
    }

	func configure(_ name: String) {
		self.name = name
		self.recetteName?.text = name
	}

}
