//
//  PlatosTableViewController.swift
//  Proyecto_GD3
//
//  Created by Instructor Fredy Asencios on 8/24/19.
//  Copyright © 2019 AcademiaMoviles. All rights reserved.
//

import UIKit

class PlatosTableViewController: UITableViewController {
    
    var paramId:String?
    var arrayPlatos = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    override func viewWillAppear(_ animated: Bool) {
//        print(paramId)
        let idCategoria =  paramId ?? "1"
        arrayPlatos = DataBase.shared()?.ejecutarSelect("select * from platos_comidas where id_categoria = '\(idCategoria)' ") as! [[String : String]]
        print("platos:",arrayPlatos)
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPlatos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPlato", for: indexPath) as! PlatoTableViewCell
        //recuperando dato
        let nombrePlato = arrayPlatos[indexPath.row]["nombre_plato"]
        let precioPlato = arrayPlatos[indexPath.row]["precio_plato"]
        let descripPlato = arrayPlatos[indexPath.row]["descripcion_plato"]
        
        
       //configurando celda
        //cell.textLabel?.text = nombrePlato
        cell.nombrePlatoCell.text = nombrePlato
        cell.descripcionPlatoCell.text = descripPlato
        cell.precioPlatoCell.text = precioPlato
        let imagePlato = arrayPlatos[indexPath.row]["archivo_plato"] ?? "avatar"
        cell.imagenPlatoCell.image = UIImage(named: imagePlato)
        return cell
    }
    


}
