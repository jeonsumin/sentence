//
//  TermsViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/07/06.
//

import UIKit
import SwiftUI

class TermsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIConfigure()
    }
}

extension TermsViewController {
    func UIConfigure() {
        title = "서비스 이용 약관"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}


//MARK: - Preview
struct TermsViewControllerController_Previews: PreviewProvider {
    static var previews: some View {
        TermsViewControllerRepresentable().edgesIgnoringSafeArea(.all)
    }
}
struct TermsViewControllerRepresentable:UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let homeViewController = TermsViewController()
        return UINavigationController(rootViewController: homeViewController)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        typealias UIViewControllerType = UIViewController
    }
}
