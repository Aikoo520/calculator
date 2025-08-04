//
//  TableViewController.swift
//  To-Do list
//
//  Created by Айгерим Акылбекова on 25.07.2025.
//

import UIKit

class TableViewController: UITableViewController {
    var arrayPerson: [Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = UserDefaults.standard.data (forKey: "nameArray"){
            let array = try? JSONDecoder().decode([Person].self, from: data)
            self.arrayPerson = array ?? []
            self.tableView.reloadData()
        }
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        if let data = UserDefaults.standard.data (forKey: "nameArray"){
            let array = try? JSONDecoder().decode([Person].self, from: data)
            self.arrayPerson = array ?? []
            self.tableView.reloadData()
        }
        
    }
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPerson.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style:.subtitle, reuseIdentifier: "Cell")
        cell.textLabel?.numberOfLines = 0 // limit
        // Configure the cell...
        cell.textLabel?.text = arrayPerson[indexPath.row].name + " " + arrayPerson[indexPath.row].surname + "\n" + arrayPerson[indexPath.row].phone
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ViewController2ViewController") as! ViewController2ViewController
        vc.newTask = arrayPerson[indexPath.row]
        navigationController?.show(vc, sender: self)
        tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            arrayPerson.remove(at: indexPath.row)
            
            func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                if editingStyle == .delete {
                    // 1. Удаляем элемент из массива
                    arrayPerson.remove(at: indexPath.row)
                    
                    // 2. Удаляем строку из таблицы с анимацией
                    tableView.deleteRows(at: [indexPath], with: .fade)
                } else if editingStyle == .insert {
                    // Добавить новый элемент, если нужно

                }
            }
        }
    }
}
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         arrayPerson.remove(at: indexPath.row)
         tableView.reloadData()
         // Return false if you do not want the specified item to be editable.
         return true
         }
         /*
          
          
          // Override to support editing the table view.
          override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          if editingStyle == .delete {
          arrayPerson.remove(at: indexPath.row)
          tableView.reloadData()
          // Delete the row from the data source
          tableView.deleteRows(at: [indexPath], with: .fade)
          } else if editingStyle == .insert {
          // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
          }
          }
          
          
          
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
          
          
          // MARK: - Navigation
          
          // In a storyboard-based application, you will often want to do a little preparation before navigation
          override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          // Get the new view controller using segue.destination.
          // Pass the selected object to the new view controller.
          
          
          
          */*/
    
