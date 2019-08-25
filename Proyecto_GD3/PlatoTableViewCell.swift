//
//  PlatoTableViewCell.swift
//  Proyecto_GD3
//
//  Created by Instructor Fredy Asencios on 8/24/19.
//  Copyright © 2019 AcademiaMoviles. All rights reserved.
//

import UIKit

class PlatoTableViewCell: UITableViewCell {
    @IBOutlet weak var imagenPlatoCell: UIImageView!
    @IBOutlet weak var nombrePlatoCell: UILabel!
    @IBOutlet weak var descripcionPlatoCell: UILabel!
    @IBOutlet weak var precioPlatoCell: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
