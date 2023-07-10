//
//  SetNameViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/07/06.
//

import UIKit
import SnapKit

class SetNameViewController:UIViewController {
    
    lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "back_arrow"), for: .normal)
        button.backgroundColor = .blue
        return button
    }()
 
    var mainTitle = LargeTitleLabel()
    var subTitle = NormalLabel()
    
    var textField: UITextField = {
        let field = UITextField(frame: .zero)
        field.placeholder = "이름을 입력해 주세요"
        field.backgroundColor = .systemGray6
        field.layer.cornerRadius = 16

        return field
    }()
    
    var successButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 16
        button.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 1
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.tintColor = .label

        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        UIConfigure()
        
//        self.navigationItem.setHidesBackButton(true, animated: true)
//        self.navigationItem.backButtonTitle = " "
        
        successButton.addTarget(self, action: #selector(tappedNextTermButton), for: .touchUpInside)
        backButton.addTarget(self, action: #selector(tappedBackbutton), for: .touchUpInside)
        textField.delegate = self
    }
    
}

extension SetNameViewController {
    @objc func tappedNextTermButton(){
        let nextVC = StartViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @objc func tappedBackbutton(){
        print("tapped back button ")
        self.navigationController?.popViewController(animated: true)
    }
}

extension SetNameViewController: UITextFieldDelegate {
    
}

extension SetNameViewController {
    
    func UIConfigure(){
        view.backgroundColor = .systemBackground
        [
            backButton,
            mainTitle,
            subTitle,
            textField,
            successButton,
        ].forEach{
            view.addSubview($0)
        }
        
        backButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(10)
            $0.leading.equalTo(view).offset(20)
            $0.width.equalTo(50)
            $0.height.equalTo(50)
        }
        mainTitle.text = "텍스처에서 사용할 이름을 입력해 주세요."
        mainTitle.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(30)
            $0.leading.equalTo(view).offset(20)
            $0.width.equalTo(180)
        }
        subTitle.text = "이름은 공백없이 12자 이하만 사용 가능합니다."
        subTitle.textColor = .systemGray3
        subTitle.snp.makeConstraints{
            $0.leading.equalTo(mainTitle)
            $0.top.equalTo(mainTitle.snp.bottom).offset(10)
            $0.width.equalTo(170)
        }
        
        textField.snp.makeConstraints{
            $0.top.equalTo(subTitle.snp.bottom).offset(50)
            $0.leading.trailing.equalTo(view).inset(20)
            $0.height.equalTo(66)
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
