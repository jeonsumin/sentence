//
//  LoginViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/07/06.
//

import UIKit
import SwiftUI


class LoginViewController: UIViewController {
    
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
        button.backgroundColor = .systemOrange
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    lazy var naverLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 25
        
        return button
    }()
    
    lazy var appleLoginButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .black
        button.layer.cornerRadius = 25
        
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIConfigure()
    }
    
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

//MARK: - Preview
struct LoginViewControllerController_Previews: PreviewProvider {
    static var previews: some View {
        LoginViewControllerRepresentable().edgesIgnoringSafeArea(.all)
    }
}
struct LoginViewControllerRepresentable:UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> some UIViewController {
        let homeViewController = LoginViewController()
        return UINavigationController(rootViewController: homeViewController)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        typealias UIViewControllerType = UIViewController
    }
}
