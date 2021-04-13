//
//  IngredientTableViewCell.swift
//  iCook
//
//  Created by Alexandre Lefebvre on 03/03/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit

class IngredientTableViewCell: UITableViewCell {

	@IBOutlet weak var ingreLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
    func configure(_ ingre: String?) {
        self.ingreLabel?.text = ingre
    }

}
