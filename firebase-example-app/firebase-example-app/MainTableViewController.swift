//
//  MainTableViewController.swift
//  firebase-example-app
//
//  Created by Jess Ryan on 3/3/22.
//

import UIKit

class MainTableViewController: UITableViewController {
    let handler = dataHandler()
    var names = [item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    
    func getData(){
            Task {
                await handler.getFirebaseData()
                    names = handler.getName()
                    tableView.reloadData()
            }
        }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        if segue.identifier == "saveSegue" {
                    print("identified segue correctly")
                    let source = segue.source as! AddItemViewController
                    if source.addedName.isEmpty == false {
                        print("text not empty")
                        handler.addName(name: source.addedName)
                        getData()
                    }
                }
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
       
        return names.count
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Configure the cell...
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = names[indexPath.row].name
        cell.contentConfiguration = cellConfig
        return cell

    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if let nameID = names[indexPath.row].id {
                            handler.deleteName(nameID: nameID)
                            getData()
                        }
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
