//
//  ViewController.swift
//  BMICalculator
//
//  Created by english on 2022-09-22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var heightInCm: UITextField!
    @IBOutlet weak var weightInKg: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    /**
      Calculates BMI.
      - Parameters:
        - weight: Person's weight in kilograms
        - height: Person's height in centimeters
      - Returns: BMI value
    */
    func calculateBMI(_ weight: Double, _ height: Double) -> Double {
      let heightInMeters = height / 100
      return weight / (heightInMeters * heightInMeters)
    }
    
    /**
      Gets string description of BMI value.
      - Parameters:
        - bmi: BMI value
      - Returns: Description of given BMI value
    */
    func getClassification(_ bmi: Double) -> String {
      if (bmi < 18.5) {
        return "Underweight"
      } else if (bmi < 25) {
        return "Normal weight"
      } else if (bmi < 30) {
        return "Overweight"
      } else {
        return "Obesity"
      }
    }
    
    /**
     Gets a UIColor based on the BMI value.
     - Parameters:
        - bmi: BMI value
     - Returns: UIColor
     */
    func getColorForBMI(_ bmi: Double) -> UIColor {
        if (bmi < 18.5) {
            return UIColor.cyan
        } else if (bmi < 25) {
            return UIColor.green
        } else if (bmi < 30) {
            return UIColor.yellow
        } else {
            return UIColor.orange
        }
    }

    @IBAction func txtHeightEditingDidBegin(_ sender: Any) {
        lblResult.isHidden = true
    }
    @IBAction func txtWeightEditingDidBegin(_ sender: Any) {
        lblResult.isHidden = true
    }
    
    @IBAction func btnCalculateTouchUpInside(_ sender: Any) {
        guard let height = Double(heightInCm.text!), (height <= 250 && height >= 80) else {
            Toast.ok(view: self, title: "Review the height", message: "Enter a height between 80 cm and 250 cm.", handler: nil)
            return
        }
        
        guard let weight = Double(weightInKg.text!), (weight <= 300 && weight >= 30) else {
            Toast.ok(view: self, title: "Review the weight", message: "Enter a weight between 30 kg and 300 kg.", handler: nil)
            return
        }
        
        let bmi = calculateBMI(weight, height)
        let classification = getClassification(bmi)
        
        lblResult.text = "BMI Classification = \(classification)"
        lblResult.backgroundColor = getColorForBMI(bmi)
        lblResult.isHidden = false
    }
}

