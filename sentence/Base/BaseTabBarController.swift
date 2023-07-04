//
//  BaseTabBarController.swift
//  sentence
//
//  Created by terry on 2023/06/30.
//

import UIKit

class BaseTabBarController: UITabBarController {
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
        let viewController = sentence.ProfileViewController()
        let tabBarItem = UITabBarItem(title: nil,
                                      image: UIImage(named: "plus"),
                                      tag: 2)
        tabBarItem.selectedImage = UIImage(named: "plus_on")
        viewController.tabBarItem = tabBarItem
        viewController.modalPresentationStyle = .fullScreen
        
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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewControllers = [
            feedViewController,
            searchViewController,
            createSentenceViewController,
            activeViewController,
            ProfileViewController
        ]
        
    }
}
