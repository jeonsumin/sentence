//
//  BaseViewController.swift
//  sentence
//
//  Created by Terry on 2023/08/16.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIConfigure()
    }
    
    func UIConfigure(){
        view.backgroundColor = .systemBackground
    }
}
