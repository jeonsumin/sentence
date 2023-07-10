//
//  BaseTabBarController.swift
//  sentence
//
//  Created by terry on 2023/06/30.
//

import UIKit

class BaseTabBarController: UITabBarController, UITabBarControllerDelegate {
    //MARK: - Properties
//    private lazy var homeViewController: UIViewController = {
//        let layout = UICollectionViewLayout()
//        let viewController = ViewController(collectionViewLayout: layout)
//        let tabBarItem = UITabBarItem(title: nil, image: UIImage(systemName: "house"), tag: 0)
//        viewController.tabBarItem = tabBarItem
//        return viewController
//    }
    
    private lazy var feedViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: HomeViewController())
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "feed"),
                                      tag: 0)
        
        tabBarItem.selectedImage = UIImage(named: "feed_on")
        viewController.tabBarItem = tabBarItem
        return viewController
    }()
    
    private lazy var searchViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: SearchViewController()) 
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "search"),
                                      tag: 1)
        tabBarItem.selectedImage = UIImage(named: "search_on")
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var createSentenceViewController: UIViewController = {
        let viewController = EditSentenceViewController()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "plus"),
                                      tag: 2)
        tabBarItem.selectedImage = UIImage(named: "plus_on")
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    private lazy var activeViewController: UIViewController = {
        let viewController = UINavigationController(rootViewController: ActiveViewController())
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "bell"),
                                      tag: 3)
        tabBarItem.selectedImage = UIImage(named: "bell_on")
        viewController.tabBarItem = tabBarItem

        
        return viewController
    }()
    
    private lazy var ProfileViewController: UIViewController = {
        let viewController = sentence.ProfileViewController()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "profile"),
                                      tag: 4)
        tabBarItem.selectedImage = UIImage(named: "profile_on")
        viewController.tabBarItem = tabBarItem
        
        return viewController
    }()
    
    //MARK: - LifeCycle
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [
            feedViewController,
            searchViewController,
            createSentenceViewController,
            activeViewController,
            ProfileViewController
        ]
        self.delegate = self
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController.isKind(of: EditSentenceViewController.self) {
          let vc =  EditSentenceViewController()
         vc.modalPresentationStyle = .fullScreen
         self.present(vc, animated: true, completion: nil)
         return false
      }
      return true
    }
    
    private func validateAuth(){
        let vc = LoginViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .fullScreen
        present(navVC, animated: false)
    }
}
