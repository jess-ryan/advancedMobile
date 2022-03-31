//
//  dataHandler.swift
//  firebase-example-app
//
//  Created by Jess Ryan on 3/30/22.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class dataHandler{
    let db = Firestore.firestore()
    var Data = [item]()
    
    func getFirebaseData() async{
        do {
            let snapshot = try await db.collection("collection").getDocuments()
            self.Data = snapshot.documents.compactMap{document->item? in return try? document.data(as:item.self)}
        }
        catch{
            print("ERROR")
        }
        
    }
    
    func getName()->[item]{
            return Data
        }
    
func addName(name:String){
    let nameCollection = db.collection("collection")
     print("trying to add name!!!")
     //create Dictionary
     let newDict = ["name": name]
     
     // Add a new document with a generated id
     var ref: DocumentReference? = nil
     ref = nameCollection.addDocument(data: newDict)
     {err in
         if let err = err {
             print("Error adding document: \(err)")
         } else {
             print("Document added with ID: \(ref!.documentID)")
         }
     }
 }

 func deleteName(nameID: String){
     // Delete the object from Firestore
     db.collection("collection").document(nameID).delete() { err in
         if let err = err {
             print("Error removing document: \(err)")
         } else {
             print("Document successfully removed!")
         }
     }
 }
}
