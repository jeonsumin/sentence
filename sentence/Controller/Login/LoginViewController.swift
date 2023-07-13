//
//  LoginViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/07/06.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {

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
        button.addTarget(self, action: #selector(tappedKakaoLoginButton), for: .touchUpInside)
        
        return button
    }()
    
    lazy var appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "apple_login"), for: .normal)
        button.layer.cornerRadius = 25
        button.addTarget(self, action: #selector(tappedKakaoLoginButton), for: .touchUpInside)
        
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
        let nextVC = TermsViewController()
        let navVC = UINavigationController(rootViewController: nextVC)
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    @objc func tappedNaverLoginButton(){}
    @objc func tappedAppleLoginButton(){}
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
