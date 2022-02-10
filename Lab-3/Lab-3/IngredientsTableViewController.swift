//
//  DrinksTableViewController.swift
//  Lab-3
//
//  Created by Jess Ryan on 2/9/22.
//

import UIKit

class IngredientsTableViewController: UITableViewController {
    
    @IBAction func unwindSegue (_ segue: UIStoryboardSegue){
        if segue.identifier == "doneSegue"{
            if let source = segue.source as? AddIngredientViewController{
                if source.ingredient.isEmpty == false{
                    recipeData.addIngredient(index: selectedRecipe, newIngredient: source.ingredient, newIndex: ingredientsList.count)
                    ingredientsList.append(source.ingredient)
                    tableView.reloadData()
                }
            }
        }
        
    }
    
    var recipeData = DataLoader()
    var selectedRecipe = 0
    var ingredientsList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ingredientsList = recipeData.getIngredients(index: selectedRecipe)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ingredientsList.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientCell", for: indexPath)
        
        var cellConig = cell.defaultContentConfiguration()
        cellConig.text = ingredientsList[indexPath.row]
        cell.contentConfiguration = cellConig

        // Configure the cell...

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
            // Delete the row from the data source
            ingredientsList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            recipeData.deleteIngredients(index: selectedRecipe, ingredientIndex: indexPath.row)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let fromRow = fromIndexPath.row
        let toRow = to.row
        let moveIngredient = ingredientsList[fromRow]
        ingredientsList.swapAt(fromRow,toRow)
        recipeData.deleteIngredients(index: selectedRecipe, ingredientIndex: fromRow)
        recipeData.addIngredient(index: selectedRecipe, newIngredient: moveIngredient, newIndex: toRow)
    }
    

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
