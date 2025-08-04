//
//  ViewController2ViewController.swift
//  To-Do list
//
//  Created by Айгерим Акылбекова on 28.07.2025.
//

import UIKit

class ViewController2ViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var surnameLabel: UITextField!
    @IBOutlet weak var phoneLabel: UITextField!
    var newTask: Person!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = newTask.name
        surnameLabel.text = newTask.surname
        phoneLabel.text = newTask.phone
        
        // Do any additional setup after loading the view.
    }
    @IBAction func fix(_ sender: Any)  {
        
        // let array = try? JSONDecoder().decode([Person].self, from: data) весь массив что бы передовать чела через весь массив
        let name = nameLabel.text ?? "No name"
            let surname = surnameLabel.text ?? "No surname"
            let phone = phoneLabel.text ?? "No phone"

            let updatedPerson = Person(name: name, surname: surname, phone: phone) //создаем весь массив

            if let data = UserDefaults.standard.data(forKey: "nameArray"),  //открываем и смотрим всю инфу  находим оттуда старого
               var personArray = try? JSONDecoder().decode([Person].self, from: data) { //декодируем старого(типо уже старую почву убираем))

               
                if !personArray.isEmpty {
                    personArray[0] = updatedPerson
                }

                if let newData = try? JSONEncoder().encode(personArray) {
                    UserDefaults.standard.set(newData, forKey: "nameArray")
                    print("фффф")
                }

            } else {
                // Нет массива — создадим с нуля
                let newArray = [updatedPerson]
                if let data = try? JSONEncoder().encode(newArray) {
                    UserDefaults.standard.set(data, forKey: "nameArray")
                    print("unreal")
                }
            }
        let vc = storyboard?.instantiateViewController(withIdentifier: "TableViewController") as! TableViewController
        navigationController?.show(vc, sender: self)
       
        TableViewController().tableView.reloadData()

            // MARK: - Navigation
            
            // In a storyboard-based application, you will often want to do a little preparation before navigation
            //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // Get the new view controller using segue.destination.
            // Pass the selected object to the new view controller.
            // }
            //*/
            
        
    }
}
