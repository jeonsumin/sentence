//
//  UIAction.swift
//  sentence
//
//  Created by deepvisions on 2023/07/03.
//

import UIKit

class CommonUtils {
//    static let share = UIAction()
    
    static func navigationTitleConfigure(viewController: UIViewController ,navigationTitle:String){
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = navigationTitle
        label.font = UIFont.systemFont(ofSize: 24,weight: .bold)
        
        label.textAlignment = .left
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        titleView.backgroundColor = .clear
        titleView.addSubview(label)
        viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
    }

}
