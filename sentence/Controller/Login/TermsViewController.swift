//
//  TermsViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/07/06.
//

import UIKit
import SnapKit
import SwiftUI

class TermsViewController: UIViewController {

    //MARK: - Properties
    var termsTitle = LargeTitleLabel()
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "back_arrow"), for: .normal)
        
        return button
    }()
 
    //MARK: 전체동의
    var isAllAgree = false
    var allAgreeLabel = TitleLabel()
    lazy var allAgreeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "checkBox"), for: .normal)
        return button
    }()
    
    var AllAgreeStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        
        return view
    }()
    
    //MARK: 서비스 이용악관
    var isServiceTerms = false
    var serviceTerms = TitleLabel()
    lazy var serviceTermsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "checkBox"), for: .normal)
        button.setImage(UIImage(named: "checkBox"), for: .normal)
        
        return button
    }()
    var serviceTermsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        
        return view
    }()
    
    //MARK: 개인정보
    var isPersonalTerms = false
    var PersonalTerms = TitleLabel()
    lazy var PersonalTermsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "checkBox"), for: .normal)
        button.setImage(UIImage(named: "checkBox"), for: .normal)
        
        return button
    }()
    
    var personalTermsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        
        return view
    }()
    
    //MARK: 마케팅정보
    var isMarketing = false
    var MarketingTerms = TitleLabel()
    lazy var MarketingTermsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "checkBox"), for: .normal)
        button.setImage(UIImage(named: "checkBox"), for: .normal)
        
        return button
    }()
    var marketingTermsStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        
        return view
    }()
    
    var isSuccess = false
    var successButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.layer.borderColor = CGColor.init(red: 225, green: 225, blue: 225, alpha: 1)
        button.layer.borderWidth = 4
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.tintColor = .systemGray5

        return button
    }()
    
    var VStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.alignment = .fill

        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        successButton.addTarget(self, action: #selector(tappedNextTermButton), for: .touchUpInside)
        
        allAgreeButton.addTarget(self, action: #selector(tappedAllAgreeButton), for: .touchUpInside)
        serviceTermsButton.addTarget(self, action: #selector(tappedServiceTermsButton), for: .touchUpInside)
        MarketingTermsButton.addTarget(self, action: #selector(tappedMarketingTermsButton), for: .touchUpInside)
        PersonalTermsButton.addTarget(self, action: #selector(tappedPersonalTermsButton), for: .touchUpInside)
        UIConfigure()
    }
    
    @objc func tappedAllAgreeButton(){
        isAllAgree = !isAllAgree
        
        isAllAgree ? allAgreeButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : allAgreeButton.setImage(UIImage(named: "checkBox"), for: .normal)
        isAllAgree ? serviceTermsButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : serviceTermsButton.setImage(UIImage(named: "checkBox"), for: .normal)
        isAllAgree ? PersonalTermsButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : PersonalTermsButton.setImage(UIImage(named: "checkBox"), for: .normal)
        isAllAgree ? MarketingTermsButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : MarketingTermsButton.setImage(UIImage(named: "checkBox"), for: .normal)
    }
    
    @objc func tappedServiceTermsButton(){
        isServiceTerms = !isServiceTerms
        isServiceTerms ? serviceTermsButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : serviceTermsButton.setImage(UIImage(named: "checkBox"), for: .normal)
        isServiceTerms && isPersonalTerms ? (successButton.tintColor = .label) : (successButton.tintColor = .systemGray3)
        if (isAllAgree) {
            isAllAgree = !isAllAgree
            isAllAgree ? allAgreeButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : allAgreeButton.setImage(UIImage(named: "checkBox"), for: .normal)
        }

    }
    @objc func tappedPersonalTermsButton(){
        isPersonalTerms = !isPersonalTerms
        isPersonalTerms ? PersonalTermsButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : PersonalTermsButton.setImage(UIImage(named: "checkBox"), for: .normal)
        isServiceTerms && isPersonalTerms ? (successButton.tintColor = .label) : (successButton.tintColor = .systemGray3)
        if (isAllAgree) {
            isAllAgree = !isAllAgree
            isAllAgree ? allAgreeButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : allAgreeButton.setImage(UIImage(named: "checkBox"), for: .normal)
        }
    }
    @objc func tappedMarketingTermsButton(){
        isMarketing = !isMarketing
        isMarketing ? MarketingTermsButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : MarketingTermsButton.setImage(UIImage(named: "checkBox"), for: .normal)
        if (isAllAgree) {
            isAllAgree = !isAllAgree
            isAllAgree ? allAgreeButton.setImage(UIImage(named: "checkBox_on"), for: .normal) : allAgreeButton.setImage(UIImage(named: "checkBox"), for: .normal)
        }
    }
    
    @objc func tappedNextTermButton(){
        isServiceTerms && isPersonalTerms ? (successButton.isEnabled = true) : (successButton.isEnabled = false)
        if successButton.isEnabled {
            let nextVC = SetNameViewController()
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
    }
    
    
}

extension TermsViewController {
    func UIConfigure() {
        view.backgroundColor = .systemBackground
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        [
            backButton,
            termsTitle,
            AllAgreeStackView,
            VStackView,
            CommonUtils.dimmedView,
            serviceTermsStackView,
            personalTermsStackView,
            marketingTermsStackView,
            successButton
        ].forEach {
            view.addSubview($0)
        }
        
        
        backButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(view).offset(20)
            $0.height.equalTo(50)
        }
        
        termsTitle.text = "서비스 이용동의"
        termsTitle.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(8)
            $0.leading.equalTo(view).offset(20)
        }
        
        allAgreeLabel.text = "약관 전체동의"
        [allAgreeButton,allAgreeLabel,].forEach{
            AllAgreeStackView.addArrangedSubview($0)
        }
        
        AllAgreeStackView.snp.makeConstraints{
            $0.leading.equalTo(view).offset(20)
            $0.top.equalTo(termsTitle.snp.bottom).offset(50)
        }
        
        CommonUtils.dimmedView.snp.makeConstraints{
            $0.leading.equalTo(view).offset(20)
            $0.trailing.equalTo(view).inset(20)
            $0.top.equalTo(allAgreeLabel.snp.bottom).offset(20)
            $0.height.equalTo(1)
        }
        
        serviceTerms.text = "(필수) 서비스 이용약관"
        [serviceTermsButton,serviceTerms].forEach{
            serviceTermsStackView.addArrangedSubview($0)
        }
        serviceTermsStackView.snp.makeConstraints{
            $0.leading.equalTo(view).offset(20)
            $0.top.equalTo(CommonUtils.dimmedView.snp.bottom).offset(20)
        }
        
        PersonalTerms.text = "(필수) 개인정보 처리방침"
        [PersonalTermsButton,PersonalTerms].forEach{
            personalTermsStackView.addArrangedSubview($0)
        }
        personalTermsStackView.snp.makeConstraints{
            $0.leading.equalTo(serviceTermsStackView)
            $0.top.equalTo(serviceTermsStackView.snp.bottom).offset(20)
        }
        
        MarketingTerms.text = "(선택) 마케팅정보 수신동의"
        [MarketingTermsButton,MarketingTerms].forEach{
            marketingTermsStackView.addArrangedSubview($0)
        }
        marketingTermsStackView.snp.makeConstraints{
            $0.leading.equalTo(personalTermsStackView)
            $0.top.equalTo(personalTermsStackView.snp.bottom).offset(20)
        }
        
        successButton.setTitle("확인", for: .normal)
        successButton.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(view).offset(-30)
            $0.leading.equalTo(view).offset(20)
            $0.trailing.equalTo(view).offset(-20)
            $0.height.equalTo(66)
        }
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
