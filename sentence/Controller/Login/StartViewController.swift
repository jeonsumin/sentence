//
//  StartViewController.swift
//  sentence
//
//  Created by terry on 2023/07/10.
//

import UIKit
import SnapKit

class StartViewController: UIViewController {
    //MARK: - Properties
    var startLabel = LargeTitleLabel()
    var subLabel = LargeTitleLabel()
    
    var imageView: UIImageView = {
        let imgView = UIImageView(frame: .zero)
        imgView.contentMode = .scaleAspectFit
        imgView.image = UIImage(named: "startSuccessImage")
        
        return imgView
    }()
    
    var successButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("시작하기", for: .normal)
        button.layer.cornerRadius = 16
        button.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 1)
        button.layer.borderWidth = 1
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.tintColor = .label
        button.addTarget(self, action: #selector(tappedSuccessButton), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIConfigure()
    }
    
}

//MARK: - Tapped Function
extension StartViewController {
    @objc func tappedSuccessButton(){
        self.navigationController?.dismiss(animated: false)
    }
}


//MARK: - UIConfigure
extension StartViewController {
    func UIConfigure(){
        view.backgroundColor = .systemBackground
        [
            startLabel,
            subLabel,
            imageView,
            successButton,
        ].forEach{
            view.addSubview($0)
        }
        
        startLabel.text = "읽고 발견하고 연결되는 소셜 독서 플랫폼"
        startLabel.snp.makeConstraints{
            $0.leading.equalTo(view).offset(20)
            $0.width.equalTo(195)
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(50)
        }
        subLabel.text = "텍스처에 오신 것을 환영합니다."
        subLabel.snp.makeConstraints{
            $0.leading.equalTo(startLabel)
            $0.top.equalTo(startLabel.snp.bottom).offset(30)
            $0.width.equalTo(195)
        }
        
        imageView.snp.makeConstraints{
            $0.top.equalTo(subLabel.snp.bottom).offset(150)
            $0.centerX.equalTo(view)
            $0.leading.trailing.equalTo(view).inset(20)
        }
        successButton.snp.makeConstraints{
            $0.centerX.equalTo(view)
            $0.bottom.equalTo(view).inset(60)
            $0.leading.trailing.equalTo(view).inset(20)
            $0.height.equalTo(66)
        }
        
    }
}
