//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Alejandro Barranco on 04/05/18.
//  Copyright © 2018 Alejandro Barranco. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            if let htmlData = try? Data(contentsOf: url) {
                let baseURL = URL(fileURLWithPath: Bundle.main.bundlePath)
                webView.load(htmlData, mimeType: "text/html", textEncodingName: "UTF-8", baseURL: baseURL)
                
            }
        }
    }

    @IBAction func buttonClosePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
