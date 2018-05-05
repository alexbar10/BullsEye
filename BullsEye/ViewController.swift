//
//  ViewController.swift
//  BullsEye
//
//  Created by Alejandro Barranco on 02/05/18.
//  Copyright © 2018 Alejandro Barranco. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currenrValue = 0
    @IBOutlet weak var labelTargetValue: UILabel!
    @IBOutlet weak var labelScore: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelRound: UILabel!
    var targetValue = 0
    var score = 0
    var round = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currenrValue = lroundf(slider.value)
        startNewRound()
//        buttonStartOverPressed(null)
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal") //UIImage(named: "SliderThumb-Normal")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let inset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let trackLeftImage = UIImage(named: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage?.resizableImage(withCapInsets: inset)

        let trackRightImage = UIImage(named: "SliderTrackRight")
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets: inset)

        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    func startNewRound() {
        targetValue = 1 + Int(arc4random_uniform(100))
        labelTargetValue.text = "\(targetValue)"
        labelScore.text = "\(score)"
        currenrValue = 50
        slider.value = Float(currenrValue)
        round += 1
        labelRound.text = "\(round)"
    }
    
    func getTitle(forDifference difference: Int) -> (String, Int) {
        if difference == 0 {
            return ("Perfect!", 100)
        } else if difference < 5 {
            return ("You almost had it!", 50)
        } else if difference < 10 {
            return ("Pretty good!", 0)
        } else {
            return ("Not even close...", 0)
        }
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        print("The value of slider is now: \(slider.value)")
        currenrValue = lroundf(slider.value)
    }
    
    @IBAction func showHelloAlert() {
        // Calculate difference
        let difference = abs(targetValue - currenrValue)
        var points = 100 - difference
        
        // first algorit
//        if currenrValue > targetValue {
//            difference = currenrValue - targetValue
//        } else if targetValue > currenrValue {
//            difference = targetValue - currenrValue
//        } else {
//            difference = 0
//        }

        // second algorit
//        difference = targetValue - currenrValue
//        if difference < 0 {
//            difference *= -1
//        }
        
        let (title, bonusScore) = getTitle(forDifference: difference)
        points += bonusScore
        score += points
        
        let message = "The value of the slider is: \(currenrValue) - Instance" +
        "\nThe target value is: \(targetValue) - Instance" +
        "\nThe difference is: \(difference) - local" +
        "\nThe point is: \(points) - local" +
        "\nThe score is: \(score) + Instance"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
        //startNewRound()
    }
    
    @IBAction func buttonStartOverPressed(_ sender: UIButton) {
        targetValue = 0
        score = 0
        round = 0
        
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
