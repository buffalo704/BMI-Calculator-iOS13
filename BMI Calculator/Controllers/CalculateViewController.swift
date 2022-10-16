//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    var calculatorBrain = CalculatorBrain()
    
    @IBOutlet weak var heightLabel: UIStackView!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var weightLabel: UIStackView!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var calculateButton: UIButton!
    
    @IBOutlet weak var weightNumberLabel: UILabel!
    @IBOutlet weak var heightNumberLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func heightSliderDragged(_ sender: UISlider) {
//        print(sender.value)
        let height = String(format:"%.2f", sender.value)
        heightNumberLabel.text = "\(height)m"
    }
    

    @IBAction func weightSliderDragged(_ sender: UISlider) {
//        print(sender.value)
        let weight = String(format:"%.0f", sender.value)
        weightNumberLabel.text = "\(weight)Kg"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let height = heightSlider.value
        let weight = weightSlider.value
        
        calculatorBrain.calculateBMI(height: height, weight: weight)
        performSegue(withIdentifier: "goToResult", sender: self)
//
        print(calculatorBrain.bmi!)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "goToResult" {
                let destinationVC = segue.destination as! ResultViewController
                destinationVC.bmiValue = calculatorBrain.getBMIValue()
                destinationVC.advice = calculatorBrain.getAdvice()
                destinationVC.color = calculatorBrain.getColor()
            }
        }
}

