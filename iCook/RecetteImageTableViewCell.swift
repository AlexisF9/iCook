//
//  RecetteImageTableViewCell.swift
//  iCook
//
//  Created by Julie Saby on 09/03/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit

class RecetteImageTableViewCell: UITableViewCell {

	@IBOutlet weak var recetteImage: UIImageView!
	
	var imageName: String?
	
    override func awakeFromNib() {
        super.awakeFromNib()
		
		if let imageName = self.imageName {
			recetteImage?.image = UIImage(named: imageName)
		}
    }
	
	func configure(_ imageName: String) {
		self.imageName = imageName
		recetteImage?.image = UIImage(named: imageName)
	}

}
