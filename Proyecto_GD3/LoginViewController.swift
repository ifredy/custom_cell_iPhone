//
//  LoginViewController.swift
//  Proyecto_GD3
//
//  Created by Instructor Fredy Asencios on 8/17/19.
//  Copyright © 2019 AcademiaMoviles. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logeando(_ sender: Any) {
        let urlSw = "\(DOMINIO)/auth/usuarios-login"
        guard let user = txtEmail.text , let pass = txtPass.text else {return}
        
        let paramLogin = ["email":user ,"password":pass ]
        Alamofire.request(urlSw, method: .post, parameters: paramLogin ).responseJSON { response in
            
            if  response.result.isSuccess{
                let jsonDatosUser = response.result.value as! [String:Any]
                print("respond:",jsonDatosUser)
                if  let datosUser  = jsonDatosUser["data"] as? [String:Any]{
                    //crear sesion ok
                    let id = datosUser["_id"] as? String ?? ""
                    let nombresUser = datosUser["nombres"] as? String ?? ""
                    let apellidos = datosUser["apellido_paterno"] as? String ?? ""
                    let emailUser = datosUser["email"] as? String ?? ""
                    let imagenUser = datosUser["imagen"] as? String ?? ""
                    let tokenUser = datosUser["token"] as? String ?? ""
                    
                    let queryInsert = "INSERT INTO usuario ('_id','nombres','apellidos','email','token','imagen') VALUES ('\(id)','\(nombresUser)','\(apellidos)','\(emailUser)','\(tokenUser)','\(imagenUser)')"
                    
                    DataBase.shared()?.ejecutarInsert(queryInsert)
                    self.dismiss(animated: true, completion: {
                        print("realizó login exito")
                    })
                    
                }else{
                    //lanzar alerta que ingrese nuevamente, usuario o clave incorrecto, via alert
                    
                    
                }
                
            }else{
                print("problema en el request")
            }
            
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
