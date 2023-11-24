//
//  Sentence.swift
//  sentence
//
//  Created by Terry on 2023/11/22.
//

import Foundation

struct Sentence: Decodable {
    let id: String
    let bookName: String
    let bookId: String
    let bookCover: URL
    let bookAuth: String
    let link: URL
    let descrips: String
    let sentence: String
}
