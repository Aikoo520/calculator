//
//  TableViewController.swift
//  To-Do List
//
//  Created by Айгерим Акылбекова on 21.07.2025.
//

import UIKit

class ContactListViewController: UITableViewController {

    var contacts: [Contact] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Contacts"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                            target: self,
                                                            action: #selector(addContact))
    }

    @objc func addContact() {
        performSegue(withIdentifier: "addContact", sender: self)
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }

    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        let contact = contacts[indexPath.row]
        cell.textLabel?.text = "\(contact.firstName) \(contact.lastName)"
        cell.detailTextLabel?.text = contact.phoneNumber
        return cell
    }

    @IBAction func unwindToContactList(_ segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? ViewController,
           let contact = sourceVC.contact {
            contacts.append(contact)
            tableView.reloadData()
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let personVC = storyboard.instantiateViewController(identifier: "PersonViewController") as? PersonViewController {
            personVC.contact = contacts[indexPath.row]
            personVC.contactIndex = indexPath.row

            personVC.onSave = { [weak self] updatedContact, index in
                self?.contacts[index] = updatedContact
                self?.tableView.reloadData()
            }

            navigationController?.pushViewController(personVC, animated: true)
        }
    }
}
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        
        // Override to support editing the table view.
        //override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        //if editingStyle == .delete {
        // Delete the row from the data source
        //array.remove(at: indexPath.row)
        //tableView.deleteRows(at: [indexPath], with: .fade)
        //} else if editingStyle == .insert {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        //}
        
        
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
        
    

