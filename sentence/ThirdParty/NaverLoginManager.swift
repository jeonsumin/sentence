//
//  NaverLoginManager.swift
//  sentence
//
//  Created by terry on 2023/07/28.
//

import Foundation
import NaverThirdPartyLogin
import Alamofire

extension LoginViewController: NaverThirdPartyLoginConnectionDelegate {
    
    //로그인 성공시 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success Login")
        getNaverLoginInfo()
    }
    
    // refresh token
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        getNaverLoginInfo()
    }
    
    //로그아웃
    func oauth20ConnectionDidFinishDeleteToken() {
        print("logout")
    }
    
    //모든 error
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error = \(error.localizedDescription)")
    }
    
    func getNaverLoginInfo() {
        guard let isValidAccessToken = naverLoginInstance?.isValidAccessTokenExpireTimeNow() else { return }
        
        if !isValidAccessToken {
            return
        }
        
        guard let tokenType = naverLoginInstance?.tokenType else { return }
        guard let accessToken = naverLoginInstance?.accessToken else { return }
        
        
        let urlStr = "https://openapi.naver.com/v1/nid/me"
        let url = URL(string: urlStr)!
        
        let authorization = "\(tokenType) \(accessToken)"
        
        let req = AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default,headers: ["Authorization":authorization])
        
        req.responseJSON { response in
            guard let result = response.value as? [String:Any] else { return }
            guard let object = result["response"] as? [String:Any] else { return }
            
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let id = object["id"] as? String else { return }

        }
    }
    
    
}
