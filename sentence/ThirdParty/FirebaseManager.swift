//
//  FirebaseManager.swift
//  sentence
//
//  Created by Terry on 2023/08/15.
//

import Foundation
import FirebaseFirestore
import FirebaseStorage
import FirebaseDatabase

class FirebaseManager {

    static let shared = FirebaseManager()
    var databaseRef = Database.database().reference()
    var storage = Storage.storage().reference()

}
