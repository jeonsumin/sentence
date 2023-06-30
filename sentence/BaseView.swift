//
//  BaseView.swift
//  sentence
//
//  Created by deepvisions on 2023/06/30.
//

import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        UIConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func UIConfigure(){
        self.backgroundColor = .systemBackground
    }
}
