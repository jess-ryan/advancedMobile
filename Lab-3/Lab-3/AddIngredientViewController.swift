//
//  AddIngredientViewController.swift
//  Lab-3
//
//  Created by Jess Ryan on 2/9/22.
//

import UIKit

class AddIngredientViewController: UIViewController {
    
    var ingredient = String()
    
    @IBOutlet weak var addedIngredient: UITextField!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "doneSegue"{
            if addedIngredient.text?.isEmpty == false{
                ingredient=addedIngredient.text!
            }
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
