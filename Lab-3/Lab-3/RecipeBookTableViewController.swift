//
//  CoffeeTableViewController.swift
//  Lab-3
//
//  Created by Jess Ryan on 2/7/22.
//

import UIKit

class RecipeBookViewController: UITableViewController {
    
    var dishList = [String]()
    var dishData = DataLoader()
    let file = "recipeData"
    var searchController = UISearchController()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        dishData.loadData(filename: file)
        dishList = dishData.getDishes()
        
        let resultsController = SearchResultsTableViewController()
        resultsController.allWords = dishList
        searchController = UISearchController(searchResultsController: resultsController)
        
        searchController.searchBar.placeholder = "Enter a search term" //place holder text
        searchController.searchBar.sizeToFit() //sets appropriate size for the search bar
        tableView.tableHeaderView=searchController.searchBar //install the search bar as the table header
        searchController.searchResultsUpdater = resultsController //sets the instance to update search results


        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return dishList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishCell", for: indexPath)
        
        var cellConfig = cell.defaultContentConfiguration()
        cellConfig.text = dishList[indexPath.row]
        cell.contentConfiguration = cellConfig

        return cell
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ingredientSegue"{
            if let ingredientVC = segue.destination as? IngredientsTableViewController {
                if let indexPath = tableView.indexPath(for: (sender as? UITableViewCell)!){
                    ingredientVC.title = dishList[indexPath.row]
                    ingredientVC.recipeData = dishData
                    ingredientVC.selectedRecipe = indexPath.row
                }
                
            }
        }
    }
    

}
