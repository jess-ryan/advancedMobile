//
//  MainTableViewController.swift
//  lab-5
//
//  Created by Jess Ryan on 2/28/22.
//

import UIKit

class MainTableViewController: UITableViewController {
    
    var trivias = [Trivia]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTestData()

        
    }

    // MARK: - Table view data source
    
    func getAPIdata() {
            Task {
                await TriviaDataHandler.loadjson()
                trivias = TriviaDataHandler.getTrivia()
                reloadData()
                print("Number of trivia \(trivias.count)")
            }
        }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return trivias.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = trivias[indexPath.row].question
        cell.contentConfiguration = cellConfig

        // Configure the cell...

        
        return cell
    }
    
    func loadTestData(){
        let t1 = Trivia(question: "what is the capital of NJ", answer: "Trenton")
        let t2 = Trivia(question: "Who was the first president of the USA", answer: "George Washington")
        
        trivias.append(t1)
        trivias.append(t2)
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
           let alert = UIAlertController(title: trivias[indexPath.row].question, message: trivias[indexPath.row].answer, preferredStyle: .alert)
           let okAction = UIAlertAction(title: "okay, cool", style: .default, handler: nil)
           alert.addAction(okAction)
           present(alert, animated: true, completion: nil)
           tableView.deselectRow(at: indexPath, animated: true) //deselects the row that had been choosen
       }
    

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

}
