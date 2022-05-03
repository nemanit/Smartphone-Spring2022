//
//  ViewController.swift
//  BMICalculator
//
//  Created by Tejaswi Nemani on 5/3/22.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var txtWeight: UITextField!
    
    
    @IBOutlet weak var txtFeet: UITextField!
    
    
    @IBOutlet weak var txtInches: UITextField!
    
    
    @IBAction func calculateBMI(_ sender: Any) {
        
        let weight = Float(txtWeight.text!)!
                let feet = Float(txtFeet.text!)!
                let inches = Float(txtInches.text!)!
                
                let totalInches = (feet*12) + inches
                let bmi = (Float((weight*703)/(totalInches*totalInches)))
                let bmiString = String(format:"%.2f", bmi)
                
                
                
                if (bmi < 18.5) {
                    lblBMI.text = "Underweight: " + bmiString
                }
                else if (bmi  < 24.9){
                    lblBMI.text = "Normal: " + bmiString
                }
                else if (bmi  < 29.9){
                    lblBMI.text = "Overweight: " + bmiString
                }
                else {
                    lblBMI.text = "Obese: " + bmiString
                }
        
    
    }
    
    
    @IBOutlet weak var lblBMI: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

