//
//  SceneDelegate.swift
//  sentence
//
//  Created by terry on 2023/06/30.
//

import UIKit
import NaverThirdPartyLogin
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        window?.rootViewController = BaseTabBarController()
        window?.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        NaverThirdPartyLoginConnection.getSharedInstance().receiveAccessToken(URLContexts.first?.url)
    }
}

