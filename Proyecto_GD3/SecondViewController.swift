//
//  SecondViewController.swift
//  Proyecto_GD3
//
//  Created by Instructor Fredy Asencios on 8/10/19.
//  Copyright © 2019 AcademiaMoviles. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var tableViewCategoria: UITableView!
    var arrayCategoria = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //evaluar si hay sesion
        tableViewCategoria.delegate = self
        tableViewCategoria.dataSource = self
        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        //ocultar el nav bar
        if evaluarSesion() {
            //si hay sesion y procesa la consulta al SW
            arrayCategoria = DataBase.shared()?.ejecutarSelect("select * from categoria_platos") as! [[String : String]]
            print("categorias:",arrayCategoria)
        }else{
            //no hay sesion
            //            presentar login
            let objLoginVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as! LoginViewController
            
//          self.navigationController?.pushViewController(objLoginVC, animated: true)
            present(objLoginVC, animated: false) {
                print("instanciando login")
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        //volver a visualizar el nav bar
    }
    func evaluarSesion()->Bool{
        //consultar la table y si existe registro entonces deveuelve true
        var success = false
        let datoUsuario = DataBase.shared()?.ejecutarSelect("select * from usuario") as! [[String:String]]
        if datoUsuario.count > 0 {
            success = true
        }else{
            success = false 
        }
        return success
    }
    
    @IBAction func haciendoLogout(_ sender: Any) {
        //borrar el registro
        DataBase.shared()?.ejecutarDelete("delete from usuario")
        viewWillAppear(false)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goPlatos"{
            if let indexPath2 = tableViewCategoria.indexPathForSelectedRow {
                guard  let objSelected = arrayCategoria[indexPath2.row] as? [String:String] else {return}
                let idCategoriaSelected = objSelected["id_categoria"]
                //instanciar el objDestino
                let objDestino = segue.destination  as! PlatosTableViewController
                objDestino.paramId = idCategoriaSelected
                
            }
        }
    }
    

}
extension SecondViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategoria.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaCategoria", for: indexPath)
        let nombreCategoria = arrayCategoria[indexPath.row]["nombre_categoria"]
        celda.textLabel?.text = nombreCategoria
        return celda
    }
    
    
    
}
