//
//  ViewController.swift
//  Space App
//
//  Created by Mateusz Kopacz on 27.04.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if userName.text == "admin" && password.text == "admin" {
            
            self.performSegue(withIdentifier: "showMenu", sender: nil)
        
            
        
        } else {
        
            showAlert()
        
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        userName.center.x -= view.bounds.width
        password.center.x -= view.bounds.width
        
        
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.9, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.userName.center.x += self.view.bounds.width
            
        }, completion: nil)
        
        
        
        UIView.animate(withDuration: 0.9, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
            
            self.password.center.x += self.view.bounds.width
            
        }, completion: nil)
        
        
    }
    
    
     func showAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "Wrong Username or Password", preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

