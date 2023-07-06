//
//  TermsViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/07/06.
//

import UIKit
import SwiftUI

class TermsViewController: UIViewController {
    
    var allAgreeLabel = TitleLabel()
    var serviceTerms = TitleLabel()
    var PersonalTerms = TitleLabel()
    var MarketingTerms = TitleLabel()
    
    var VStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        view.alignment = .fill

        
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIConfigure()
    }
}

extension TermsViewController {
    func UIConfigure() {
        title = "서비스 이용 약관"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        [
            allAgreeLabel,
            VStackView,
            CommonUtils.dimmedView
        ].forEach {
            view.addSubview($0)
        }
        allAgreeLabel.text = "약관 전체동의"
        allAgreeLabel.snp.makeConstraints{
            $0.leading.equalTo(view).offset(20)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        CommonUtils.dimmedView.snp.makeConstraints{
            $0.leading.equalTo(view).offset(20)
            $0.trailing.equalTo(view).inset(20)
            $0.top.equalTo(allAgreeLabel.snp.bottom).offset(20)
            $0.height.equalTo(1)
        }
        
        VStackView.snp.makeConstraints{
            $0.leading.equalTo(view).offset(20)
            $0.top.equalTo(CommonUtils.dimmedView.snp.bottom).offset(20)
        }
        
        
        serviceTerms.text = "(필수) 서비스 이용약관"
        PersonalTerms.text = "(필수) 개인정보 처리방침"
        MarketingTerms.text = "(선택) 마케팅정보 수신동의"
        [
            serviceTerms,
            PersonalTerms,
            MarketingTerms,
        ].forEach{
            VStackView.addArrangedSubview($0)
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
