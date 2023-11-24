//
//  Sentence.swift
//  sentence
//
//  Created by Terry on 2023/11/22.
//

import Foundation

struct Sentence: Codable {
    let id: String
    var user: User?
    let bookName: String
    let bookId: String
    let bookCover: URL
    let bookAuth: String
    let link: URL
    let descrips: String
    let sentence: String
    let createDate: String
}
