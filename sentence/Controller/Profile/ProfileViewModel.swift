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
                let value = snapshot?.value
                print("value : \(value)")
//                do {
//                    let user = try DataLoader.load(json: value as! String, for: User.self)
//                    print("fetch user : \(user)")
//                    self.changeData?(self.user!)
//                } catch {
//                    print(error.localizedDescription)
//                }
            }
        }

    }
}
