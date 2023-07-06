//
//  SetNameViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/07/06.
//

import UIKit
import SwiftUI

class SetNameViewController:UIViewController {
 
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


//MARK: - Preview
struct SetNameViewControllerController_Previews: PreviewProvider {
    static var previews: some View {
        SetNameViewControllerRepresentable().edgesIgnoringSafeArea(.all)
    }
}
struct SetNameViewControllerRepresentable:UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let homeViewController = SetNameViewController()
        return UINavigationController(rootViewController: homeViewController)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        typealias UIViewControllerType = UIViewController
    }
}
