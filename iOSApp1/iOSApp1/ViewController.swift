//
//  ViewController.swift
//  iOSApp1
//
//  Created by Mehdi Labbafi on 2024-05-22.
//

import UIKit

class ViewController: UIViewController {
    
  
    @IBOutlet var slider: UISlider!
    @IBOutlet var sLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    
    var currentValue = 0
    var targetValue = 0
    var round = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)

        let thumbImageHighlighted = UIImage(
          named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)

        let insets = UIEdgeInsets(
          top: 0,
          left: 14,
          bottom: 0,
          right: 14)

        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(
          withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)

        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(
          withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
        
        startNewGame()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference // calculating points
        
        
        let title: String
        if difference == 0 { // If They Hit the Exact Number
            title = "You read my mind!\nMy number Was \(targetValue)"
            points += 100 // 100 bonus points
        }
        else if difference < 5 { // If They're Off by Five from the Chosen Number
            title = "Nearly there!\nMy Number was \(targetValue)"
            if difference == 1 {
                points += 50 // 50 bonus points
            }
        }
        else if difference < 10 { // if they're ten away from the chosen number
            title = "Close-ish.\nMy Number was \(targetValue)"
        }
        else { // If They Aren't Anywhere Near the Chosen Number
            title = "Not even close...\n My number was \(targetValue) "
        }
        score += points
        
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        
        let action = UIAlertAction(
            title: "Try again!",
            style: .default) {_ in
                self.startNewRound()
            }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        let currentValue = Int(slider.value)
        sLabel.text = "\(currentValue)" // Displaying the current slider value in real time
            }
    
    @IBAction func startNewGame(){ //wired up to 'Start Over' button
        score = 0
        round = 0 // starts at round 1
        startNewRound()
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(
            name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 1 // Moves the slider back to 1 after each round
        slider.value = Float(currentValue)
        sLabel.text = "\(currentValue)"
        updateLabels()
    }
    
    func updateLabels() {
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}
