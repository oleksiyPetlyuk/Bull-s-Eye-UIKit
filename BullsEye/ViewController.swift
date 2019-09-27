//
//  ViewController.swift
//  BullsEye
//
//  Created by Oleksiy Petlyuk on 9/23/19.
//  Copyright © 2019 Oleksiy Petlyuk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetValueLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    var currentValue = 0
    
    var targetValue = 0
    
    var score = 0
    
    var round = 0
    
    @IBAction func handleStartOverButtonClick() {
        startNewGame()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        
        var bonusPoints = 0
        
        if difference == 0 {
            bonusPoints = 100
        } else if difference == 1 {
            bonusPoints = 50
        }
        
        let points = 100 - difference + bonusPoints
        
        score += points
        
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value.rounded())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        currentValue = Int(slider.value.rounded())
        
        targetValue = Int.random(in: 1...100)
        
        startNewGame()
        
        let thumbImageNormal = #imageLiteral(resourceName: "SliderThumb-Normal")
        let thumbImageHighlated = #imageLiteral(resourceName: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageNormal, for: .normal)
        slider.setThumbImage(thumbImageHighlated, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SliderTrackRight")
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    func startNewRound() {
        round += 1
        
        targetValue = Int.random(in: 1...100)
        
        currentValue = 50
        
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        targetValueLabel.text = String(targetValue)
        
        scoreLabel.text = String(score)
        
        roundLabel.text = String(round)
    }
    
    func startNewGame() {
        round = 0
        
        score = 0
        
        startNewRound()
    }
    
}

