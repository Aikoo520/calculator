//
//  ViewController.swift
//  To-Do List
//
//  Created by Айгерим Акылбекова on 21.07.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!

    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New Contact"
    }

    @IBAction func saveContact(_ sender: UIButton) {
        guard let firstName = firstNameField.text, !firstName.isEmpty,
              let lastName = lastNameField.text, !lastName.isEmpty,
              let phone = phoneField.text, !phone.isEmpty else {
            // Можно добавить alert об ошибке
            return
        }

        contact = Contact(firstName: firstName, lastName: lastName, phoneNumber: phone)
        performSegue(withIdentifier: "unwindToContactList", sender: self)
    }
}
