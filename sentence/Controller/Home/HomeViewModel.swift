//
//  HomeViewModel.swift
//  sentence
//
//  Created by Terry on 2023/11/22.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class HomeViewModel {

    private(set) var sentence: [Sentence]?

    var changeData: (([Sentence]) -> Void)?

    var databaseRef = Database.database().reference()

    func fetchSentence() {
        FirebaseManager.shared.fetchSentence { snap in
            self.sentence = snap
            self.changeData?(snap)
        }
//        databaseRef.child("sentence").observeSingleEvent(of: .value) { snapshot in
//            var sentences: [Sentence] = []
//            for child in snapshot.children {
//                guard let snap = child as? DataSnapshot else { return }
//                guard let value = snap.value as? [String: Any] else { return }
//                do {
//                    let jsonData = try JSONSerialization.data(withJSONObject: value,options: [])
//                    let decoded = try JSONDecoder().decode(Sentence.self, from: jsonData)
//
//                    sentences.append(decoded)
//
//                } catch {
//                    print("Faild JSON Pase home view model fetch sentence: \(error.localizedDescription)")
//                }
//            }
//            self.sentence = sentences.reversed()
//            self.changeData?(sentences)
//        }
    }
}
