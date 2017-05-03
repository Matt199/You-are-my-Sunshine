//
//  LiveDataController.swift
//  Space App
//
//  Created by Space Apps Challenge  on 30.04.2017.
//  Copyright © 2017 Mateusz Kopacz. All rights reserved.
//

import UIKit

class LiveDataController: UIViewController {

    @IBOutlet weak var webW: UIWebView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        webW.delegate = self as? UIWebViewDelegate
        if let url = URL(string: "http://172.16.176.254/api") {
            let request = URLRequest(url: url)
            webW.loadRequest(request)
        }
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
