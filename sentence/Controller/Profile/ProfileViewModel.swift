//
//  ProfileViewModel.swift
//  sentence
//
//  Created by Terry on 2023/11/22.
//

import Foundation
import FirebaseDatabase
import FirebaseAuth

class ProfileViewModel {

    private(set) var user: User?
    let userDefault = UserDefaults.standard
    var changeData: ((User) -> Void)?

    func fetchProfile(){
        if let currentUser = Auth.auth().currentUser?.uid {
            Database.database().reference().child("user/\(currentUser)").getData { _, snapshot in
                let value = snapshot?.value as? NSDictionary
                let username = value?["username"] as? String ?? ""
                self.user = .init(id: currentUser,name: username)
                self.changeData?(self.user!)
            }
        }

    }
}
