//
//  FirstViewController.swift
//  Proyecto_GD3
//
//  Created by Instructor Fredy Asencios on 8/10/19.
//  Copyright © 2019 AcademiaMoviles. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tomateImg: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       self.tomateImg.layer.position = CGPoint(x: -50, y: -50)
    }
    override func viewWillAppear(_ animated: Bool) {
        self.tomateImg.layer.position = CGPoint(x: -50, y: -50)
        //self.tomateImg.alpha
    }
    override func viewDidAppear(_ animated: Bool) {
        print("viewDidAppear")
        //animation
        UIView.animate(withDuration: 1, animations: {
              self.tomateImg.layer.position = CGPoint(x:75, y: 75)
        }) { (true) in
            //llamar a otra fucnio
            print("llamando a otra animacion")
        }
        
        
    }
    

    
}

