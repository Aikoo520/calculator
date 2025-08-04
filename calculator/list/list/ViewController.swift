//
//  ViewController.swift
//  list
//
//  Created by Айгерим Акылбекова on 29.07.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func add(_ sender: Any) {
        let task = textfield.text!
        UserDefaults.standard.setValue([task], forKey: "taskArray")
        textfield.text = ""
    }
    
    

}

