//
//  ViewController.swift
//  To-Do list
//
//  Created by Айгерим Акылбекова on 25.07.2025.
//
import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var surnameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    var newTask: Person!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    @IBAction func add(_ sender: Any) {
        let name = nameLabel.text ?? "No name"
        let surname = surnameLabel.text ?? "No name"
        let phone = phoneLabel.text ?? "No name"
        
        let newTask = Person(name: name, surname: surname, phone: phone)
            if let data = UserDefaults.standard.data (forKey: "nameArray") {
                var array = try? JSONDecoder().decode([Person].self, from: data)
                array?.append(newTask)
                let encodedata = try? JSONEncoder().encode(array)
                UserDefaults.standard.set(encodedata, forKey: "nameArray")
                print("aaaaaaaaaaaaaaaa")
                TableViewController().tableView.reloadData()
            } else {
                
                let encodedata = try? JSONEncoder().encode([newTask])
                UserDefaults.standard.set(encodedata, forKey: "nameArray")
                print("bbbbbbbbbb")
                TableViewController().tableView.reloadData()
            }
       
        //UserDefaults.standard.setValue([name], forKey: "nameArray")
        /*extension ViewController {
            
            func tableView.reloadData()
        }
         */
        nameLabel.text = ""
        surnameLabel.text = ""
        phoneLabel.text = ""
        
        
    }
    
}
