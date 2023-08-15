//
//  PreviewController.swift
//  sentence
//
//  Created by terry on 2023/07/03.
//

import UIKit
import SnapKit

class PreviewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "미리보기"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .label
        return label
    }()
    
    private lazy var dismissButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(dismissPreview), for: .touchUpInside)
        return button
    }()
    
    private lazy var sentenceView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .green
        view.layer.cornerRadius = 16
        
        return view
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("공유하기", for: .normal)
        button.addTarget(self, action: #selector(tappedShareButton), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.tintColor = .label
        return button
    }()
    
    private lazy var imageSaveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("이미지 저장", for: .normal)
        button.addTarget(self, action: #selector(tappedSaveImageButton), for: .touchUpInside)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 16
        button.tintColor = .label
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIConfigure()
    }
    
    @objc func dismissPreview(){
        self.dismiss(animated: true)
    }
    
    @objc func tappedShareButton(){}
    @objc func tappedSaveImageButton(){}
    
}
extension PreviewController {
    
    func UIConfigure(){
        view.backgroundColor = .systemBackground
        
        [
            titleLabel,
            dismissButton,
            sentenceView,
            shareButton,
            imageSaveButton,
        ].forEach{
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide).offset(20)
            $0.leading.equalTo(self.view).offset(20)
        }
        
        dismissButton.snp.makeConstraints{
            $0.centerY.equalTo(titleLabel.snp.centerY)
            $0.trailing.equalTo(self.view).offset(-20)
        }
        
        sentenceView.snp.makeConstraints{
            $0.centerX.equalTo(view.snp.centerX)
            $0.top.equalTo(view.snp.top).offset(135)
            $0.leading.equalTo(view.snp.leading).offset(75)
            $0.trailing.equalTo(view.snp.trailing).offset(-75)
            $0.height.equalTo(200)
        }
        
        [].forEach{
            sentenceView.addSubview($0)
        }
        shareButton.snp.makeConstraints{
            $0.leading.equalTo(sentenceView.snp.leading).offset(30)
            $0.top.equalTo(sentenceView.snp.bottom).offset(71)
            $0.width.equalTo(72)
        }
        
        imageSaveButton.snp.makeConstraints{
            $0.width.equalTo(94)
            $0.leading.equalTo(shareButton.snp.trailing).offset(25)
            $0.top.equalTo(shareButton.snp.top)
        }
    }
    
}
