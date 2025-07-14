//
//  ViewController.swift
//  calculator
//
//  Created by Айгерим Акылбекова on 13.07.2025.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lable: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var textfield2: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touched(_ sender: Any) {
        //lable.text = textfield.text
        let a = textfield.text!
        let b = textfield2.text!
        //let sum = (Int(a) ?? 0) + (Int(b) ?? 0)
        if let numberA = Int(a), let numberB = Int(b){
            let sum = numberA + numberB
            lable.text = String(sum)
        } else{
            lable.text = "2 numbers"
        }
    }
    @IBAction func minus(_ sender: Any) {
        let a = textfield.text!
        let b = textfield2.text!
        //let sum = (Int(a) ?? 0) + (Int(b) ?? 0)
        if let numberA = Int(a), let numberB = Int(b){
            let sum = numberA - numberB
            lable.text = String(sum)
        } else{
            lable.text = "write down 2 numbers"
        }
    
    }
    
    @IBAction func devide(_ sender: Any) {
        let a = textfield.text!
        let b = textfield2.text!
        //let sum = (Int(a) ?? 0) + (Int(b) ?? 0)
        if let numberA = Double(a), let numberB = Double(b){
            let sum = numberA / numberB
            lable.text = String(sum)
        } else{
            lable.text = "write down 2 numbers"
        }
    }
    
    @IBAction func x(_ sender: Any) {
        let a = textfield.text!
        let b = textfield2.text!
        //let sum = (Int(a) ?? 0) + (Int(b) ?? 0)
        if let numberA = Int(a), let numberB = Int(b){
            let sum = numberA * numberB
            lable.text = String(sum)
        } else{
            lable.text = "write down 2 numbers"
        }
    }
}




