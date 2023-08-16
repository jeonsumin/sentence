//
//  Book.swift
//  sentence
//
//  Created by Terry on 2023/08/16.
//

import UIKit
import Kingfisher
struct Book: Codable {
    var items: [Items]
}

struct Items: Codable{
    let title: String
    let link: String
    let author: String
    let image: String
    let description: String
    
//    var bookImage:UIImageView = {
//        let urlString = URL(string: self.image)!
//
//        return UIImageView.kf.setImage(with: urlString)
//    }()
}
