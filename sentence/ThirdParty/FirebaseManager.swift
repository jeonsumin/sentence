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

    func fetchCurrentUser(_ userId: String, completion: @escaping (User) -> Void ){
        databaseRef.child("user/\(userId)").getData { _, snapshot in
            guard let user = snapshot?.value as? [String: Any] else { return }
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: user,options: [])
                let decoded = try JSONDecoder().decode(User.self, from: jsonData)
                completion(decoded)
            } catch {
                print("fetch Current user ::  \(error.localizedDescription)")
            }
        }
    }

    func fetchSentence(completion: @escaping ([Sentence]) -> Void) {
        databaseRef.child("sentence").observeSingleEvent(of: .value) { snapshot in
            var sentences: [Sentence] = []
            for child in snapshot.children {
                guard let snap = child as? DataSnapshot else { return }
                guard let value = snap.value as? [String: Any] else { return }

                do{
                    let jsonData = try JSONSerialization.data(withJSONObject: value, options: [])
                    let jsonDecode = try JSONDecoder().decode(Sentence.self, from: jsonData)
                    sentences.append(jsonDecode)
                } catch {
                    print("Faild JSON Parse Setence: \(error.localizedDescription)")
                }
            }
            sentences.reverse()
            completion(sentences)
        }
    }
}
