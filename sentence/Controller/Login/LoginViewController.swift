//
//  LoginViewController.swift
//  sentence
//
//  Created by terry on 2023/07/06.
//

import UIKit
import SnapKit
import NaverThirdPartyLogin
import Alamofire
import KakaoSDKAuth
import KakaoSDKUser

class LoginViewController: UIViewController {

    let naverLoginInstance = NaverThirdPartyLoginConnection.getSharedInstance()
    
    //MARK: - Properties
    lazy var subLogo: UILabel = {
        let label = UILabel()
        label.text = "읽고, 발견하고, 연결되는 소셜 독서 플랫폼"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 18,weight: .bold)
        
        return label
    }()
    
    lazy var Logo: UILabel = {
        let label = UILabel()
        label.text = "TexTure"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 32,weight: .bold)
        
        return label
    }()
    
    lazy var kakaoLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "kakao_login"), for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(tappedKakaoLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var naverLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "naver_login"), for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(tappedNaverLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "apple_login"), for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(tappedAppleLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var loginInfoLabel: UILabel = {
        let label = UILabel()
        label.text = "SNS 계정으로 간편 가입하기"
        label.font = .systemFont(ofSize: 12,weight: .bold)
        
        return label
    }()
    lazy var LoginStackView: UIStackView = {
        let view = UIStackView()
        view.spacing = 20
        view.axis = .horizontal
        view.distribution = .equalCentering
        [
            kakaoLoginButton,
            naverLoginButton,
            appleLoginButton
        ].forEach{
            view.addArrangedSubview($0)
            
            $0.snp.makeConstraints{
                $0.width.equalTo(50)
                $0.height.equalTo(50)
            }
        }
        
        return view
    }()

    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UIConfigure()
        
    }
    
    
}

//MARK: - Function
extension LoginViewController {
    @objc func tappedKakaoLoginButton(){
        if UserApi.isKakaoTalkLoginAvailable() {
            UserApi.shared.loginWithKakaoTalk { token, error in
                if let error = error {
                    print("kakao login error " ,error )
                } else {
                  print("kakao login sucess")
                    _ = token
                    self.kakaoSetUserInfo()
                    self.nextPageToPushController()
                }
            }
        } else {
            UserApi.shared.loginWithKakaoAccount { token, error in
                if let error = error {
                    print("kakao login error ", error )
                } else {
                    _ = token
                    self.kakaoSetUserInfo()
                    self.nextPageToPushController()
                }
            }
        }
    }
    
    func kakaoSetUserInfo(){
        UserApi.shared.me { user, error in
            if let error = error {
                print(error)
            }else{
                print("me success")
                _ = user
                print("nickname : \(user?.kakaoAccount?.profile?.nickname ?? "no nickname")")
            }
        }
    }
    
    @objc func tappedNaverLoginButton(){
        naverLoginInstance?.delegate = self
        naverLoginInstance?.requestThirdPartyLogin()
        getNaverLoginInfo()
        let userDefaults = UserDefaults.standard
        userDefaults.set(naverLoginInstance?.accessToken, forKey: "naverLoginToken")
        
        
        if (userDefaults.string(forKey: "naverLoginToken") != nil){
            self.nextPageToPushController()
        }
        
    }
    
    @objc func tappedAppleLoginButton(){
        self.nextPageToPushController()
    }
    
    func nextPageToPushController(){
        let nextVC = TermsViewController()
        let navVC = UINavigationController(rootViewController: nextVC)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}


//MARK: - UIConfigure
extension LoginViewController {
    func UIConfigure(){
        view.backgroundColor = .systemBackground
        
        [
            subLogo,
            Logo,
            LoginStackView,
            loginInfoLabel
        ].forEach{
            view.addSubview($0)
        }
        subLogo.snp.makeConstraints{
            $0.top.equalTo(view).offset(135)
            $0.leading.equalTo(view).offset(60)
            $0.width.equalTo(130)
        }
        Logo.snp.makeConstraints{
            $0.leading.equalTo(subLogo)
            $0.top.equalTo(subLogo.snp.bottom).offset(20)
        }
        
        LoginStackView.snp.makeConstraints{
            $0.bottom.equalTo(view).inset(120)
            $0.centerX.equalTo(view)
        }
        loginInfoLabel.snp.makeConstraints{
            $0.bottom.equalTo(LoginStackView.snp.top).offset(-20)
            $0.centerX.equalTo(view)
        }
    }
}

extension LoginViewController: NaverThirdPartyLoginConnectionDelegate {
    
    //로그인 성공시 호출
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        print("Success Login")
        getNaverLoginInfo()
        self.nextPageToPushController()
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
            print("response :: ", response)
            guard let result = response.value as? [String:Any] else { return }
            guard let object = result["response"] as? [String:Any] else { return }
            
            guard let name = object["name"] as? String else { return }
            guard let email = object["email"] as? String else { return }
            guard let id = object["id"] as? String else { return }
            
        }
    }
    
    
}
