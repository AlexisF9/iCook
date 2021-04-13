//
//  AccueilViewController.swift
//  iCook
//
//  Created by Alexandre Lefebvre on 11/02/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit

class Recette {
    var image: String
    var name: String
    var note: Float
    var tprepa: Int
    var tcuisson: Int
    var ingre: [String]
    var receipe: [String]
    var type: String
    var cat: String
    
    init(name: String, image: String, note: Float, tprepa: Int, tcuisson: Int, ingre: [String], receipe: [String], type: String, cat: String) {
        self.image = image
        self.name = name
        self.note = note
        self.tprepa = tprepa
        self.tcuisson = tcuisson
        self.ingre = ingre
        self.receipe = receipe
        self.type = type
        self.cat = cat
    }
}

class AccueilViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var saleeButton: UIButton!
    @IBOutlet weak var allButton: UIButton!
    @IBOutlet weak var sucreeButton: UIButton!
    @IBOutlet weak var platButton: UIButton!
    @IBOutlet weak var entreeButton: UIButton!
    @IBOutlet weak var dessertButton: UIButton!
    
    @IBAction func AllSelected() {
        datas = allDatas
        DispatchQueue.main.async {
            self.collectionView.reloadData()// recharge les infos de la collection view
            self.resetButton()
            self.allButton.setTitleColor(UIColor.orange, for: .normal)
        }
    }
    @IBAction func SaleeSelected() {
        datas = allDatas.filter({$0.type == "Salée"}) //filre datas, on parcours chaque élement du tableau et on garde que Salée
        DispatchQueue.main.async {
            self.collectionView.reloadData()// recharge les infos de la collection view
            self.resetButton()
            self.saleeButton.setTitleColor(UIColor.orange, for: .normal)
        }
    }
    
    @IBAction func SucreeSelected() {
        datas = allDatas.filter({$0.type == "Sucrée"}) //filre datas, on parcours chaque élement du tableau et on garde que Salée
        DispatchQueue.main.async {
            self.collectionView.reloadData()// recharge les infos de la collection view
            self.resetButton()
            self.sucreeButton.setTitleColor(UIColor.orange, for: .normal)
        }
    }

    @IBAction func EntreeSelected() {
        datas = allDatas.filter({$0.cat == "Entrée"}) //filre datas, on parcours chaque élement du tableau et on garde que Salée
        DispatchQueue.main.async {
            self.collectionView.reloadData()// recharge les infos de la collection view
            self.resetButton()
            self.entreeButton.setTitleColor(UIColor.orange, for: .normal)
        }
    }
    
    @IBAction func PlatSelected() {
           datas = allDatas.filter({$0.cat == "Plat"}) //filre datas, on parcours chaque élement du tableau et on garde que Salée
           DispatchQueue.main.async {
               self.collectionView.reloadData()// recharge les infos de la collection view
               self.resetButton()
               self.platButton.setTitleColor(UIColor.orange, for: .normal)
           }
       }

       @IBAction func DessertSelected() {
           datas = allDatas.filter({$0.cat == "Dessert"}) //filre datas, on parcours chaque élement du tableau et on garde que Salée
           DispatchQueue.main.async {
               self.collectionView.reloadData()// recharge les infos de la collection view
               self.resetButton()
               self.dessertButton.setTitleColor(UIColor.orange, for: .normal) // met le bouton actif en couleur
           }
       }
    
    func resetButton(){ // remet tout les boutons en noir
        self.saleeButton.setTitleColor(UIColor.black, for: .normal)
        self.allButton.setTitleColor(UIColor.black, for: .normal)
        self.sucreeButton.setTitleColor(UIColor.black, for: .normal)
        self.platButton.setTitleColor(UIColor.black, for: .normal)
        self.entreeButton.setTitleColor(UIColor.black, for: .normal)
        self.dessertButton.setTitleColor(UIColor.black, for: .normal)
    }
    
    var allDatas: [Recette] = [ // tableau des recettes
        Recette (name: "Soupe Potimarron", image: "R1", note: 4, tprepa: 10, tcuisson: 30, ingre: ["1kg de potimarron", "2 gousses d'ail", "eau", "sel"], receipe: ["Couper le potimarron en morceaux après avoir enlevé les pépins, mais sans l'avoir épluché", "Le mettre dans une casserole, recouvrir d'eau sans dépasser la hauteur du potimarron et faire cuire à basse température", "Ajouter l'ail écrasé et le sel en fin de cuisson", "Mixez le tout", "Servir chaud"], type: "Salée", cat: "Plat" ),
            
            Recette (name: "Pommes de terres sautées", image: "R2", note: 4, tprepa: 10, tcuisson: 10, ingre: ["6 pommes de terre à chair ferme", "Huile", "Poivre et sel", "Pincé de curry"], receipe: ["Eplucher et laver les pommes de terre, puis les couper en tranches de 1,5cm d'épaissseur, puis en cube", "Dans une sauteuse, faire chauffer 3 cuillères à soupe d'huile", "Lorsque l'huile est chaude, y mettre les pommes de terre d'un coup, puis les enrober d'huile dans tous les sens avec une cuillère en bois", "Ajouter sel et poivre (et éventuellemet curry), puis re-mélanger", "Porter à feu maximal et faire cuire avec le couvercle jusqu'a ce qu'une bonne odeur de pommes de terre grillées s'échappe... Ne pas les découvrir avant! Cela prend entre 3 et 5 minutes", "A ce moment là seulement, retourner les pommes de terre. Mettre à feu moyen", "Remettre le couvercle, puis retourner les pommes de terre tout les 3 minutes pendant 10 minutes", "Maintenant elle sont cuite, vérifier tout de même avec la pointe d'un couteau"], type: "Salée", cat: "Plat" ),
            
            Recette (name: "Crêpes", image: "R3", note: 4, tprepa: 5, tcuisson: 5, ingre: ["500g de farine", "4 oeufs", "50cl de lait", "50cl d'eau", "4 cuillères à soupe d'huile", "1 pincée de sel (facultatif)"], receipe: ["Mélanger le farine et les œufs, puis ajouter petit à petit le lait et l'eau", "Bien mélanger pour ne pas avoir de grumeaux", "Ajouter l'huile et le sel (facultatif)"], type: "Sucrée", cat: "Dessert" ),
            
            Recette (name: "Pancakes", image: "R4", note: 5, tprepa: 10, tcuisson: 4, ingre: ["2 oeufs", "250g de farine", "30cl de lait", "30g de sucre semoule", "1 sachet de levure", "65g de beurre doux", "1 pincé de sel"], receipe: ["Faire fondre le beurre, dans une casserole à feu doux ou dans un bol au micro-ondes", "Mettre la farine, la levure et le sucre dans un saladier. Mélanger et creuser un puits", "Ajouter ensuite les oeufs entiers et fouetter l'ensemble", "Incorporer le beurre fondu, fouetter puis délayer progressivement le mélange avec le lait afin d'éviter les grumeaux", "Laisser reposer la pâte au minimum 1 heure au réfrigérateur", "Dans une poêle chaude et légèrement huilée, faire cuire comme des crêpes, mais en les faisant plus petites. Réserver au chaud et déguster"], type: "Sucrée", cat: "Dessert" ),
            
            Recette (name: "Brunch", image: "R5", note: 3, tprepa: 60, tcuisson: 10, ingre: ["2 oeufs", "100g de comté", "30cl de jus d'orange", "3 lamelles de bacon"], receipe: ["Faire cuire les oeufs au plat", "Faire cuire le bacon", "Couper le fromage", "dégustez avec passion"], type: "Salée", cat: "Plat" ),
            
            Recette (name: "Burger", image: "R6", note: 5, tprepa: 30, tcuisson: 15, ingre: ["1 buns", "1 steak haché (boucher de préférence)", "2 tranches de comté", "sauce aux cèpes"], receipe: ["Faire cuire le steak dans une poèle chaude", "Faire le montage du burger", "Mettre le burger à 160°C pendant 15 minutes", "Déguster accompagné d'une salade ou de frites", "À noter que vous pouvez très bien changer le fromage et la sauce selo vos goûts"], type: "Salée", cat: "Plat" ),
            
            Recette (name: "Cup Cake", image: "R7", note: 1.5, tprepa: 25, tcuisson: 20, ingre: ["Gâteaux:", "2 oeufs", "140g de farine", "3 cuillières à soupe de lait", "120g de sucre", "0,5 sachet de levure", "1 cuillère à café de bicarbonate", "1 cuillère à café de vanille liquide", "Crème:", "100g de beurre tendre", "200g de sucre glace", "3 cuillère à soupe de lait"], receipe: ["Gâteaux:", "Faire fondre le beurre puis l'ajouter au sucre dans un saladier. bien remuer", "Ajouter les œufs puis la farine, le bicarbonate et la levure. Bien mélanger le tout pour éviter les grumeaux", "Incorporer le lait et la vanille", "Remplir les moules à cupcakes aux 3/4 (En cas de moules papier : les disposer dans un ramequin ou autre pour éviter qu'ils ne s’aplatissent)", "Enfourner pendant 20 min à 200°C (thermostat 6), puis laisser refroidir sans démouler","Quand les cupcakes sont bien refroidis, préparer la crème beurre", "Crème:", "battre avec un fouet (électrique ou non) pendant 3 à 5 min, le beurre mou et le sucre glace", "Ajouter du lait + ou - selon la consistance. La crème ne doit pas être trop liquide ni trop compacte afin d'avoir la consistance idéale pour la poche à douille", "Décorer vos cupcakes avec la crème au beurre et une poche à douille (pour faire plus joli) : Astuce, si vous n'avez pas de poche à douille, prenez un petit sachet de congélation dont vous aurez coupé un tout petit peu de l'un de ses coins !","Déguster ce délice sucré"], type: "Sucrée", cat: "Dessert" ),
            
            Recette (name: "Pizza", image: "R8", note: 3.5, tprepa: 15, tcuisson: 60, ingre: ["Du fromage rapé", "De la mozzarella di Buffala", "Du comté", "De la sauce tomate", "1 à 2 tranches jambon sec"], receipe: ["Bien appliquer la sauce tomate sur votre pate", "Mettre le fromage rapé de manièreà ce qu'il recouvre l'entièreté de la sauce tomate", "Couper la Mozzarella en tranche et la disposer sur la pizza", "Couper finement votre coté pour ensuite le mettre sur la pizza", "Enfourner à 180°C pendant environ 1h", "À 5 min de la fin de cuisson rajouter les lamelles de jambon", "dégustez avec passion"], type: "Salée", cat: "Plat" ),
            
            Recette (name: "Toast Avocat", image: "R9", note: 2.5, tprepa: 20, tcuisson: 0, ingre: ["1 toast", "1 cuillère à café de crème fraîche", "1/2 Avocat", "1 tranche de saumon fumé"], receipe: ["Couper l'avocat", "Disposer sur le pain la crème fraîche, le saumon et l'avocat", "dégustez avec passion"], type: "Salée", cat: "Entrée" ),
            
            Recette (name: "Pain perdu", image: "R10", note: 0.5, tprepa: 15, tcuisson: 15, ingre: ["3 oeufs", "75g de sucre de canne", "25cl de lait", "6 tranches de pain"], receipe: ["Fouetter les oeufs avec le sucre et le lait", "Y tremper les tranches de pain", "Deux solutions pour la cuisson : les cuire à la poêle dans du beurre en les faisant dorer de chaque côté, ou, les cuire au four : beurrer légèrement un plat à gratin, y répartir les tranches, verser le reste du mélange (ajouter du sucre si envie), laisser cuire à 180°C (thermostat 6) jusqu'à que les tranches soient dorées", "dégustez avec passion"], type: "Sucrée", cat: "Dessert" ),
        ]
        var datas: [Recette]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datas = allDatas
        self.allButton.setTitleColor(UIColor.orange, for: .normal) // met la couleur au bouton all dès le chargement
        
        navigationController?.setNavigationBarHidden(true, animated: true)

        collectionView.delegate = self
        collectionView.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    /*override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }*/
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return datas?.count ?? 0
    } // calcule le nombre de cellule qu'il y a dans le tableau
    
    func collectionView(_ CollectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "recetteCollectionViewCell", for: indexPath) as! RecetteCollectionViewCell
        let ligneActuel = indexPath.row
        let recetteImage = datas![ligneActuel].image
        let recetteName = datas![ligneActuel].name
        
        cell.configure(imageName: recetteImage, recetteName: recetteName)
        return cell //fait le lien avec RecetteCollectionViewCell
    }// boucle pour créer les élements du tableau
    
    func collectionView(_ CollectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ligneActuel = indexPath.row
        let storyboad = UIStoryboard(name: "Main", bundle: nil)
        let detailsRecetteViewController = storyboad.instantiateViewController(withIdentifier: "detailsRecetteViewController") as! DetailsRecetteViewController
        detailsRecetteViewController.configure(recette: datas![ligneActuel])
        self.navigationController?.pushViewController(detailsRecetteViewController, animated: true)
    }// changement de collectio view -> redirige vers details quand on clique sur une image
    //! égal forcément existant
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
