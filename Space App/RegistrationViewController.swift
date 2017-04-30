//
//  RegistrationViewController.swift
//  Space App
//
//  Created by Space Apps Challenge  on 30.04.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit

// RESERVAATION!!!!!
class RegistrationViewController: UIViewController {

    
    
    @IBOutlet weak var powerLabel: UILabel!
    
    @IBOutlet weak var phoneLabel: UILabel!
    
    @IBOutlet weak var computerLabel: UILabel!
    
    @IBOutlet weak var carLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    
    var powerPhoneMax = 1700 //mAh
    var powerComputer = 6900 //mAh
    var poweCarMax = 200000 //mAh
    
    var phone = 0
    var comp = 0
    var car = 0
    var powerVal = 0
    
    
    var energyPrice = 0.57
    var totalPrice = 0.0
    
    var totalHardware = 0
    var totalEnergy = 0
    
    var phonePrice = 0.0
    var compPrice = 0.0
    var carPrice = 0.0
    
    var phoneCarbon = 0.0048
    var comCarbon = 0.024
    var carCarbon = 64.0
    
    var totalCabon = 0.0
    
   
    @IBAction func minusPhone(_ sender: Any) {
        if (phone <= 0) {
            phoneLabel.text = "0"
        } else {
        
            phone -= 1
        
        }
        
        phoneLabel.text = "\(phone)"
        
        compute()
        computePrice()
        
    }
    
    
    
    
    @IBAction func plusPhone(_ sender: Any) {
        
        phone += 1
        phoneLabel.text = "\(phone)"
        compute()
        computePrice()
        
        
    }
    
    
    
    @IBAction func minusComp(_ sender: Any) {
        
        if (comp <= 0) {
            computerLabel.text = "0"
        } else {
            
            comp -= 1
            
        }
        
        computerLabel.text = "\(comp)"
        
        compute()
        computePrice()
    }
        
    
    
    
    
    @IBAction func plusComp(_ sender: Any) {
        
        comp += 1
        computerLabel.text = "\(comp)"
        compute()
        computePrice()
    }
    
    
    
    @IBAction func minusCar(_ sender: Any) {
        
        if (car <= 0) {
            carLabel.text = "0"
            
        } else {
            car -= 1
        }
        
        carLabel.text = "\(car)"
        
        compute()
        computePrice()
    }
    
    
    @IBAction func plusCar(_ sender: Any) {
        car += 1
        carLabel.text = "\(car)"
        compute()
        computePrice()
        
    }
    
    
    func compute() {
    
        powerVal = phone * powerPhoneMax + comp * powerComputer + car * poweCarMax
        powerLabel.text = "\(powerVal) mAh"
        
    }
    
    func computePrice() {
        
        phonePrice = 0.009 * Double(phone)
        compPrice = 0.041 * Double(comp)
        carPrice = 80 * 0.57 * Double(car)
        
        totalPrice = phonePrice + compPrice + carPrice
        
        
        
        priceLabel.text = "\(totalPrice) zł"
    
    }

    
    
    @IBAction func bookButton(_ sender: Any) {
        
        
        showAlert()
        calcTotalCaron()
        
        
    }
    
    func calcTotalCaron() {
        
        totalCabon = phoneCarbon * Double(phone) + comCarbon * Double(comp) + carCarbon * Double(car)
    
    }
    
    
    func showAlert() {
        
        let alertController = UIAlertController(title: "THANK YOU!!", message: "You just saved \(totalCabon) kg of CO2. Earth thanks you!", preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        
    }

    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"tło_72.png")!)
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        UIImage(named: "tło_72.png")?.draw(in: self.view.bounds)
        
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        self.view.backgroundColor = UIColor(patternImage: image)
        
        
        
        // Do any additional setup after loading the view.
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
