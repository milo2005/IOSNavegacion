//
//  ViewController.swift
//  Navegacion
//
//  Created by Aplimovil on 27/04/17.
//  Copyright © 2017 Aplimovil. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pass: UITextField!
    @IBOutlet weak var user: UITextField!
    
    var userD:UserDefaults!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userD = UserDefaults()
        
        let username = userD.object(forKey: "username") as? String
        user.text = username
        
    }

    @IBAction func login(_ sender: Any) {
        let password = pass.text!
        let username = user.text!
        
        if(username == "abc" && password == "abc"){
            userD.set(username, forKey: "username")
            userD.set(password, forKey: "password")
            userD.set(true, forKey:"logged")
            
            performSegue(withIdentifier: "principal", sender: nil)
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registro" {
            let registro = segue.destination as! RegistroViewController
            registro.info = user.text!
        }
    }
    
    @IBAction func goToMain(_ segue:UIStoryboardSegue){
    }


}

