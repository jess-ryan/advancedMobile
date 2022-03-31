//
//  dataModel.swift
//  firebase-example-app
//
//  Created by Jess Ryan on 3/30/22.
//

import Foundation
import FirebaseFirestoreSwift

struct item: Codable, Identifiable{
    @DocumentID var id: String?
    var name: String
}
