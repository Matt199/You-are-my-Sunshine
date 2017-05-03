//
//  CalculateViewController.swift
//  Space App
//
//  Created by Space Apps Challenge  on 29.04.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    var annualRadiation = ["Norway", "Hawaii", "Poland", "USA", "Africa", "Germany"]
    
    
    var currentValue = 0
    var panelAreaStr = ""
    var panelArea = ""
    var pAera = 0
    var calcValue = 0
    var annualValue = 0
   
    
    
    @IBOutlet weak var efficiencyLabel: UILabel!
 
    @IBOutlet weak var areaTextField: UITextField!
    
    @IBOutlet weak var calculatedValue: UILabel!
    
    @IBAction func sliderEfficiency(_ sender: UISlider) {
        
        currentValue = Int(sender.value)
        
        efficiencyLabel.text = "\(currentValue)%"
        
        
    }
    
    
    
    @IBAction func calculateButton(_ sender: Any) {
        
        
        self.view.endEditing(true)
        
        
        
        if let panelArea = Int(areaTextField.text!) {
        
            calcValue = currentValue * panelArea * annualValue / 1000
            
            showCalculatedAlert(calcValue: calcValue)
            
            
            
            calculatedValue.text = "\(calcValue) kW"
        } else {
        
            showErrorAlert()
        
        }
 
        
    }
    
    
    @IBOutlet weak var annualPicker: UIPickerView!
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        
        return annualRadiation.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return annualRadiation[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch annualRadiation[row] {
        case "Norway":
            annualValue = 200
        case "Hawaii":
            annualValue = 3000
        case "Poland":
            annualValue = 1200
        case "USA":
            annualValue = 1800
        case "Africa":
            annualValue = 2600
        case "Germany":
            annualValue = 1300
        default:
            break
        }
        
        print(annualValue)
        
        
    }
    
    
    
    func showCalculatedAlert(calcValue: Int) {
        
        let alertController = UIAlertController(title: "Calculated", message: "\(calcValue) kW", preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        
    }

    func showErrorAlert() {
        
        let alertController = UIAlertController(title: "Error", message: "Wrong Value", preferredStyle: UIAlertControllerStyle.alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        
        
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.annualPicker.delegate = self
        self.annualPicker.dataSource = self

        self.hideKeyboard()
        
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
