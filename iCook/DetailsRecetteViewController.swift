//
//  DetailsRecetteViewController.swift
//  iCook
//
//  Created by Alexandre Lefebvre on 23/02/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit

class DetailsRecetteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var Back: UIButton!
	@IBOutlet weak var recetteTableView: UITableView!
    
    var recette: Recette?

    override func viewDidLoad() { // au chargement de l'écran
        super.viewDidLoad()
		
        self.recetteTableView.delegate = self //delègue les droits sur ce fichier
        self.recetteTableView.dataSource = self //done la source

        if recette != nil {
			DispatchQueue.main.async {
				self.recetteTableView.reloadData()
			}
        }// si la recette est non nul alors mon image prend l'image de la recette, prend le nom de la recette et les temps
    }
    
    func configure(recette: Recette) {
        self.recette = recette
		DispatchQueue.main.async {
			self.recetteTableView?.reloadData()
		}
    }
    
    @IBAction func backAction(){
        navigationController?.popViewController(animated: true)
    } // Bouton retour en arrière
    

	//MARK: -- UITAbleViewDelegate, UITableViewDataSource
	func numberOfSections(in tableView: UITableView) -> Int {
		//Image, Nom, Note, Temps, Titre Ingrédients, Ingrédients, Titre Etapes, Etapes
		return 8
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		switch section {
		case 0: // Image
			return 1
		case 1: // Nom
			return 1
		case 2: // Notes
			return 1
		case 3: // Temps
			return 1
		case 4: // Titre Ingrédients
			return 1
		case 5: // Ingrédients
			return recette?.ingre.count ?? 0
		case 6: // Titre Etapes
			return 1
		case 7: // Etapes
			return recette?.receipe.count ?? 0
		default:
			return 0
		}
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		switch indexPath.section {
		case 0: // Image
			let cell = recetteTableView.dequeueReusableCell(withIdentifier: "recetteImageCell", for: indexPath) as! RecetteImageTableViewCell //reccupere la cellule modèle
			if let image = recette?.image {
				cell.configure(image)
			}
			return cell// renvoi la cellule
		
		case 1: // Nom
			let cell = recetteTableView.dequeueReusableCell(withIdentifier: "recetteNameCell", for: indexPath) as! RecetteNameTableViewCell
			if let name = recette?.name {
				cell.configure(name)
			}
			return cell
		
		case 2: // Notes
			let cell = recetteTableView.dequeueReusableCell(withIdentifier: "recetteRatingCell", for: indexPath) as! RecetteRatingTableViewCell
			if let note = recette?.note {
				cell.configure(note)
			}
			return cell
		
		case 3: // Temps
			let cell = recetteTableView.dequeueReusableCell(withIdentifier: "recetteTimingCell", for: indexPath) as! RecetteTimingTableViewCell
			if let tcuisson = recette?.tcuisson, let tprepa = recette?.tprepa {
				cell.configure(tprepa: tprepa, tcuisson: tcuisson)
			}
			return cell
		
		case 4: // Titre Ingrédients
			let cell = recetteTableView.dequeueReusableCell(withIdentifier: "recetteSubtitleCell", for: indexPath) as! RecetteSubtitleTableViewCell
			cell.configure("Ingrédients :")
			return cell
		
		case 5: // Ingrédients
			let cell = recetteTableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientTableViewCell
			let ingre = recette?.ingre[indexPath.row] //recuppère l'ingredient par rapport à la ligne de ce tableau
			cell.configure(ingre)//envoi à la cellule l'ingredient selectionné
			return cell// renvoi la cellule
		
		case 6: // Titre Etapes
			let cell = recetteTableView.dequeueReusableCell(withIdentifier: "recetteSubtitleCell", for: indexPath) as! RecetteSubtitleTableViewCell
			cell.configure("Recette :")
			return cell
		
		case 7: // Etapes
			let cell = recetteTableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath) as! IngredientTableViewCell
			let ingre = recette?.receipe[indexPath.row] //recuppère l'ingredient par rapport à la ligne de ce tableau
			cell.configure(ingre)//envoi à la cellule l'ingredient selectionné
			return cell// renvoi la cellule
		
		default:
			return UITableViewCell()
		}
	}

}
