//
//  ViewController.swift
//  BullsEye
//
//  Created by Alejandro Barranco on 02/05/18.
//  Copyright © 2018 Alejandro Barranco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currenrValue: Int = 0
    @IBOutlet weak var labelTargetValue: UILabel!
    @IBOutlet weak var slider: UISlider!
    var targetValue = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currenrValue = lroundf(slider.value)
        startNewRound()
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        labelTargetValue.text = "\(targetValue)"
        currenrValue = 50
        slider.value = Float(currenrValue)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of slider is now: \(slider.value)")
        currenrValue = lroundf(slider.value)
    }
    
    @IBAction func showHelloAlert() {
        let message = "The value of the slider is: \(currenrValue)" +
        "\nThe target value is: \(targetValue)"
        let alert = UIAlertController(title: "Hello World!", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        startNewRound()
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
