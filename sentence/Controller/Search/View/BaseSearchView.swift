//
//  BaseSearchView.swift
//  sentence
//
//  Created by deepvisions on 2023/07/03.
//

import UIKit

class BaseSearchView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
