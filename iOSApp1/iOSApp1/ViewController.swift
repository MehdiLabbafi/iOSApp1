//
//  ViewController.swift
//  iOSApp1
//
//  Created by Mehdi Labbafi on 2024-05-22.
//

import UIKit

class ViewController: UIViewController {
    // Outlets connected to UI elements
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var mLabel: UILabel!
    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var pickedNumber: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    // Using Four Variables to Store Current Value, Multiplication Result, and Sum Result
    var currentValue = 2
    var mResult = 0
    var sResult = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Set the slider's minimum and maximum values
        slider.minimumValue = 2
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        pickedNumber.text = "\(currentValue)"
    }
    
    // Function for Handling Slider Value Changes
    @IBAction func sliderMove(_ slider: UISlider) {
        // Update the current value based on the slider's position
        currentValue = lroundf(slider.value)
        // Update the label to show the current value
        pickedNumber.text = "\(currentValue)"
    }
    
    // Procedure for Calculating and Displaying Results
    @IBAction func Results() {
        // Calculate the multiplication and sum results
        mResult = currentValue * currentValue
        sResult = currentValue + currentValue
        // Display the results
        printResults()
    }
    
    // Method to Display Results and Toggle Button Title
    @IBAction func printResults() {
        // Update the labels with the calculated results
        mLabel.text = "\(mResult)"
        sumLabel.text = "\(sResult)"
        // Reset the current value
         currentValue = 0
        // Toggle the button title between "Click to see the result" and "Reset"
    }
}
