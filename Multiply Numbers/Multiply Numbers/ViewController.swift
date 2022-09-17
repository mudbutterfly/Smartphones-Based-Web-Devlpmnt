//
//  ViewController.swift
//  Multiply Numbers
//
//  Created by Kiki Pan on 9/13/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textFirstNumber: UITextField!
    @IBOutlet weak var textSecondNumber: UITextField!
    
    @IBOutlet weak var result: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func multiply(_ sender: Any) {
        let firstNumber = Int(textFirstNumber.text ?? "0") ?? 0
        let secondNumber = Int(textSecondNumber.text ?? "0") ?? 0
        let product = firstNumber * secondNumber
        
        result.text = String(product)
    }
    
//    @IBAction func multiplyFuntion(_ sender: Any) {
//        let firstNumber = Int(textFirstNumber.text ?? "0") ?? 0
//        let secondNumber = Int(textSecondNumber.text ?? "0") ?? 0
//        let product = firstNumber * secondNumber
//
//        result.text = String(product)
//    }
}

