//
//  PersonTableViewController.swift
//  To-Do List
//
//  Created by Айгерим Акылбекова on 22.07.2025.
//

import UIKit

class PersonViewController: UIViewController {

    @IBOutlet weak var firstNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!

    var contact: Contact?
    var contactIndex: Int?

    var onSave: ((Contact, Int) -> Void)?  // callback

    override func viewDidLoad() {
        super.viewDidLoad()

        if let contact = contact {
            firstNameField.text = contact.firstName
            lastNameField.text = contact.lastName
            phoneField.text = contact.phoneNumber
        }
    }

    @IBAction func saveChanges(_ sender: UIButton) {
        guard let firstName = firstNameField.text,
              let lastName = lastNameField.text,
              let phone = phoneField.text,
              let index = contactIndex else { return }

        let updatedContact = Contact(firstName: firstName, lastName: lastName, phoneNumber: phone)

        onSave?(updatedContact, index)
        navigationController?.popViewController(animated: true)
    }
}
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }     */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


