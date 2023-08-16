//
//  ButtonComponent.swift
//  sentence
//
//  Created by Terry on 2023/08/16.
//

import UIKit

class BaseButton:UIButton{
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerCurve
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
