//
//  ActiveViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/06/30.
//

import UIKit

class ActiveViewController: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        CommonUtils.navigationTitleConfigure(viewController: self, navigationTitle: "Activity")
    }
}
