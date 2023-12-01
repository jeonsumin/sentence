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
    private(set) var sentences: [Sentence]?

    let userDefault = UserDefaults.standard
    var changeData: ((User) -> Void)?
    var changeSenetance: (([Sentence]) -> Void)?

    func fetchMySentence() {
        guard let loginId = Auth.auth().currentUser?.uid else{ return }
        FirebaseManager.shared.fetchSentence { sentence in
            let filterData = sentence.filter{ $0.id == loginId }
            self.sentences = filterData
            self.changeSenetance?(filterData)
        }
    }

    func fetchProfile(){
//        if let currentUser = Auth.auth().currentUser?.uid {
//            Database.database().reference().child("user/\(currentUser)").getData { _, snapshot in
//                let value = snapshot?.value
//                do {
//                    let user = try DataLoader.load(json: value as! String, for: User.self)
//                    print("fetch user : \(user)")
//                    self.changeData?(self.user!)
//                } catch {
//                    print(error.localizedDescription)
//                }
//            }
//        }

    }

    var sentenceTotalCount: Int {
        return self.sentences?.count ?? 0 
    }
}
