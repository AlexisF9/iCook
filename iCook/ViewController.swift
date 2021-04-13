//
//  ViewController.swift
//  iCook
//
//  Created by Alexandre Lefebvre on 11/02/2021.
//  Copyright © 2021 iCook. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    @IBOutlet weak var cuisinons: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gesture = UITapGestureRecognizer(target: self, action: #selector(ViewController.accueil))
        cuisinons.addGestureRecognizer(gesture)
        cuisinons.layer.cornerRadius = 10
    }
    
    
    @objc func accueil() {
        let storyboard = UIStoryboard(name: "Main" , bundle: nil)
        let accueilViewController = storyboard.instantiateViewController(withIdentifier:"accueilViewController")as! AccueilViewController
        self.navigationController?.pushViewController(accueilViewController, animated:true)
    }


}

