//
//  RecetteCollectionViewCell.swift
//  iCook
//
//  Created by Alexandre Lefebvre on 23/02/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit

class RecetteCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var recetteImage: UIImageView!
    @IBOutlet weak var recetteName: UILabel!
    
    func border() {
        recetteImage.layer.borderColor = UIColor.black.cgColor
        recetteImage.layer.masksToBounds = true
        recetteImage.contentMode = .scaleToFill
        recetteImage.layer.borderWidth = 3
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(imageName: String, recetteName: String) {
        recetteImage.image = UIImage(named: imageName)
        self.recetteName.text = recetteName
        border()

    }// lien avec le tableau de accueilviewController
    
}
