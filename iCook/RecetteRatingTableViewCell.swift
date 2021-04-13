//
//  RecetteRatingTableViewCell.swift
//  iCook
//
//  Created by Julie Saby on 09/03/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit

class RecetteRatingTableViewCell: UITableViewCell {

	@IBOutlet weak var star1: UIImageView!
	@IBOutlet weak var star2: UIImageView!
	@IBOutlet weak var star3: UIImageView!
	@IBOutlet weak var star4: UIImageView!
	@IBOutlet weak var star5: UIImageView!
	
	var recetteNote: Float?
	
    override func awakeFromNib() {
        super.awakeFromNib()
        
		if recetteNote != nil {
			setRating()
		}
    }

	func configure(_ recetteNote: Float) {
		self.recetteNote = recetteNote
		setRating()
	}
	
	private func setRating() {
		switch recetteNote {
		case 0.5 : // appel de la fonction (self = this) stock les valeus des étoiles
			self.updateStars(star1: "star.lefthalf.fill", star2: "star", star3: "star", star4: "star", star5: "star")
		case 1.0 :
			self.updateStars(star1: "star.fill", star2: "star", star3: "star", star4: "star", star5: "star")
		case 1.5 :
			self.updateStars(star1: "star.fill", star2: "star.lefthalf.fill", star3: "star", star4: "star", star5: "star")
		case 2.0 :
			self.updateStars(star1: "star.fill", star2: "star.fill", star3: "star", star4: "star", star5: "star")
		case 2.5 :
			self.updateStars(star1: "star.fill", star2: "star.fill", star3: "star.lefthalf.fill", star4: "star", star5: "star")
		case 3.0 :
			self.updateStars(star1: "star.fill", star2: "star.fill", star3: "star.fill", star4: "star", star5: "star")
		case 3.5 :
			self.updateStars(star1: "star.fill", star2: "star.fill", star3: "star.fill", star4: "star.lefthalf.fill", star5: "star")
		case 4.0 :
			self.updateStars(star1: "star.fill", star2: "star.fill", star3: "star.fill", star4: "star.fill", star5: "star")
		case 4.5 :
			self.updateStars(star1: "star.fill", star2: "star.fill", star3: "star.fill", star4: "star.fill", star5: "star.lefthalf.fill")
		case 5.0 :
			self.updateStars(star1: "star.fill", star2: "star.fill", star3: "star.fill", star4: "star.fill", star5: "star.fill")
		default : // si pas de valeur (donc ici 0)
			self.updateStars(star1: "star", star2: "star", star3: "star", star4: "star", star5: "star")
		}
	}
	
	private func updateStars(star1: String, star2: String, star3: String, star4: String, star5: String) {
		self.star1.image = UIImage(systemName: star1)
		self.star2.image = UIImage(systemName: star2)
		self.star3.image = UIImage(systemName: star3)
		self.star4.image = UIImage(systemName: star4)
		self.star5.image = UIImage(systemName: star5)
	}// la fonction prend en parametre le systemeName des étoiles et les places sur les bonnes étoiles

}
