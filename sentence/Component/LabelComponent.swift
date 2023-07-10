//
//  UILabel.swift
//  sentence
//
//  Created by deepvisions on 2023/06/30.
//

import UIKit

class SmallBoldLabel: UILabel{
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: 12, weight: .bold)
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SmallLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.systemFont(ofSize: 12)
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class NormalGrayLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        textColor = .systemGray
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class NormalLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class TitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.boldSystemFont(ofSize: 16)
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class LargeTitleLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        font = UIFont.boldSystemFont(ofSize: 20)
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
