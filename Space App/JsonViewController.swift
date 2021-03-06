//
//  JsonViewController.swift
//  Space App
//
//  Created by Space Apps Challenge  on 29.04.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit
import Charts

class JsonViewController: UIViewController{
    
    @IBOutlet weak var barChartView: BarChartView!
    
    @IBOutlet weak var titleLabel: UILabel!
  
    var outputValue = ["DC mouthly", "AC mounthly", "Solrad monthly"]
    
    var temp1 = "dc_monthly"
    var temp2 = "ac_monthly"
    var temp3 = "solrad_monthly"
    
    var calcAverage = 0.0
    var average = 0.0
    
    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
    

    var dataArray:NSArray = []
    var dataDou = [Double]()
    
    
    
    
    @IBAction func dcButton(_ sender: UIButton) {
        
        
        dataDou = []
        getJsonData(val: temp1)
        barChartView.reloadInputViews()
        
        titleLabel.text = "DC Monthly"
        
        
    }
    
    
    
  
    @IBAction func acButton(_ sender: UIButton) {
        
        dataDou = []
        getJsonData(val: temp2)
        barChartView.reloadInputViews()

        titleLabel.text = "AC Monthly"
        
        
    }
    
    
    
    @IBAction func solradButton(_ sender: UIButton) {
       
        dataDou = []
        getJsonData(val: temp3)
        barChartView.reloadInputViews()
        
        titleLabel.text = "Solrad Monthly"
        
        
    }
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
     
     
        
    }
 
    
    func getJsonData(val: String) {
    
        
        average = 0.0
        calcAverage = 0.0
        
        let url = URL(string: "https://developer.nrel.gov/api/pvwatts/v5.json?api_key=DEMO_KEY&lat=40&lon=-105&system_capacity=4&azimuth=180&tilt=40&array_type=1&module_type=1&losses=10")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            
            if error != nil {
                print("Error")
                
            } else {
                
                if data != nil {
                    
                    do {
                        
                        let json = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as AnyObject
                        
                        if let outputs = json["outputs"] as? NSDictionary {
                            if let ac_monthly = outputs[val] {
                                
                                
                                self.dataArray = ac_monthly as! NSArray
                                for i in self.dataArray {
                                    
                                    self.calcAverage += i as! Double
                                
                                    self.dataDou.append(i as! Double)
                                
                                }
                                
                                
                                
                                print(self.temp1)
                                self.setChart(dataPoints: self.months, values: self.dataDou)
                                

                            }
                            
                        }
                        
                        
                        
                    } catch {
                        
                        
                    }
                    
                }
                
            }
            
        }
        
        
        task.resume()


    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setChart(dataPoints: [String], values: [Double]) {
        barChartView.noDataText = "You need to provide data for the chart."
        
        var dataEntries: [BarChartDataEntry] = []
        
        for i in 0..<dataPoints.count {
            let dataEntry = BarChartDataEntry(x: Double(i+2), y:values[i], data: months as AnyObject )
            dataEntries.append(dataEntry)
        }
        
        average = calcAverage/12
        
        let chartDataSet = BarChartDataSet(values: dataEntries, label: "output")
        let ll = ChartLimitLine(limit: average, label: String(format: "Average = %.2f", average))
        
        
        let chartData = BarChartData()
        chartData.addDataSet(chartDataSet)

        barChartView.rightAxis.addLimitLine(ll)
        barChartView.animate(xAxisDuration: 2.0, yAxisDuration: 2.0)
        
        barChartView.data = chartData
        barChartView.backgroundColor = UIColor(red: 189/255, green: 195/255, blue: 199/255, alpha: 0.80)
        barChartView.xAxis.labelPosition = .bottom
        barChartView.chartDescription?.text = ""
        
        
    }


}
