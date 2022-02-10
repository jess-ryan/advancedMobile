//
//  coffeeDataLoader.swift
//  Lab-3
//
//  Created by Jess Ryan on 2/9/22.
//

import Foundation

class DataLoader{
    var allData = [RecipeData]()
    
    func loadData(filename: String){
            if let pathURL = Bundle.main.url(forResource: filename, withExtension: "plist"){
                
                let plistdecoder = PropertyListDecoder()
                do {
                    let data = try Data(contentsOf: pathURL)
                    
                    allData = try plistdecoder.decode([RecipeData].self, from: data)
                } catch {
                    
                    print(error)
                }
            }
        }
    
    func getDishes() -> [String]{
        var dishes = [String]()
        for item in allData{
            dishes.append(item.dish)
        }
        return dishes
    }
        
    func getIngredients(index:Int) -> [String] {
        return allData[index].ingredients
    }
        
    func addIngredient(index:Int, newIngredient:String, newIndex: Int){
        allData[index].ingredients.insert(newIngredient, at: newIndex)
    }

    func deleteIngredients(index:Int, ingredientIndex: Int){
        allData[index].ingredients.remove(at: ingredientIndex)
    }
        
}
