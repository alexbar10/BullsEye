//
//  ViewController.swift
//  BullsEye
//
//  Created by Alejandro Barranco on 02/05/18.
//  Copyright © 2018 Alejandro Barranco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func showHelloAlert() {
        let alert = UIAlertController(title: "Hello World!", message: "This is my first app", preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
//    @IBAction func knockknock() {
//        let alert = UIAlertController(title: "knock knock!", message: "Who's there?", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Litle old lady", style: .default, handler: nil)
//        
//        alert.addAction(action)
//        
//        present(alert, animated: true, completion: nil)
//    }
}
