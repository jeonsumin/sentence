//
//  AppDelegate.swift
//  sentence
//
//  Created by terry on 2023/06/30.
//

import UIKit
import FirebaseCore
import NaverThirdPartyLogin
import KakaoSDKCommon

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //FireBase
        FirebaseApp.configure()
        
        //MARK: - Naver
        let instance = NaverThirdPartyLoginConnection.getSharedInstance()
        
        //네이버 앱으로 인증하는 방식 활성화
        instance?.isNaverAppOauthEnable = true
        
        // SafariViewController에서 인증하는 방식 활성화
        instance?.isInAppOauthEnable = true
        
        // 인증 화면을 아이폰의 세로모드에서만 적용
        instance?.isOnlyPortraitSupportedInIphone()

        instance?.serviceUrlScheme = "naverlogin"
        instance?.consumerKey = "HyZ2qewmZEjb5OUojiW_"
        instance?.consumerSecret = "LAZCvTGVDm"
//        instance?.serviceUrlScheme = kServiceAppUrlScheme //앱을 등록할 때 입력한 URL Scheme
//        instance?.consumerKey = kConsumerKey
//        instance?.consumerSecret = kConsumerSecret
        instance?.appName = kServiceAppName
        
        //MARK: - Kakao
        KakaoSDK.initSDK(appKey: "9b8d905939bfd0faba62f6ab1a0f75d5")
        
        
        return true
    }
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        //Naver
        NaverThirdPartyLoginConnection.getSharedInstance()?.application(app, open: url, options: options)
        return true
    }
    
    
    
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
    
    
}

