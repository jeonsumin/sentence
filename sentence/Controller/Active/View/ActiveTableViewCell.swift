//
//  ActiveTableViewCell.swift
//  sentence
//
//  Created by deepvisions on 2023/07/04.
//

import UIKit

class ActiveTableViewCell: UITableViewCell {
    
    static let identifier = "ActivetableViewCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
