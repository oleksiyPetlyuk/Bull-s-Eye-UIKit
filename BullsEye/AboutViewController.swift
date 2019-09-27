//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Oleksiy Petlyuk on 9/26/19.
//  Copyright © 2019 Oleksiy Petlyuk. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    
    @IBAction func close() {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let htmlPath = Bundle.main.path(forResource: "BullsEye", ofType: "html") {
            let url = URL(fileURLWithPath: htmlPath)
            
            let request = URLRequest(url: url)
            
            webView.load(request)
        }
    }
    
}
