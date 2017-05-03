//
//  LoginViewController.swift
//  Space App
//
//  Created by Space Apps Challenge  on 29.04.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    
    
    // User and password text field
    
    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBAction func passwordButton(_ sender: Any) {
        
        if userName.text == "admin" && password.text == "admin" {
            
            self.performSegue(withIdentifier: "showMenu", sender: nil)
            
            
            
        } else {
            
            showAlert()
            
        }
        

    }
    
    @IBOutlet weak var loginStack: UIStackView!
    
   
    @IBOutlet weak var backroundI: UIImageView!
    
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // hide text fields 
        
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"logowanie_72.png")!)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "logowanie_72.png")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        //loginStack.center.x -= view.bounds.width
       
        //userName.center.x -= view.bounds.width
        //password.center.x -= view.bounds.width
    
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        //loginStack.center.x -= view.bounds.width
        
        //userName.center.x -= view.bounds.width
        //password.center.x -= view.bounds.width
    }
    
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        
//        UIView.animate(withDuration: 0.9, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
//            
//            self.userName.center.x += self.view.bounds.width
//            
//        }, completion: nil)
//        
//        
//        
//        UIView.animate(withDuration: 0.9, delay: 0.2, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: UIViewAnimationOptions.curveEaseOut, animations: {
//            
//            self.password.center.x += self.view.bounds.width
//            
//        }, completion: nil)
//        
//        
//    }

    
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
