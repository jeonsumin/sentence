//
//  ProfileViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/06/30.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "gear"), for: .normal)
        return button
    }()
    
    private lazy var profileEditButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("프로필 수정", for: .normal)
        button.backgroundColor = UIColor(hex: "CE52DE")
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 12,weight: .semibold)
        button.tintColor = .label
        
        return button
    }()
    
    private lazy var userName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24,weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24,weight: .bold)
        label.textColor = .systemGray2
        
        return label
    }()
    
    private lazy var sentenceCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24,weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var follower: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24,weight: .bold)
        label.textColor = .systemGray2
        
        return label
    }()
    
    private lazy var followerCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24,weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var following: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24,weight: .bold)
        label.textColor = .systemGray2
        
        return label
    }()
    
    private lazy var followingCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24,weight: .bold)
        label.textColor = .label
        
        return label
    }()
    
    private lazy var HstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.axis = .horizontal
        [
            sentenceLabel,
            follower,
            following
        ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UIConfigure()
    }
}

extension ProfileViewController {
    func UIConfigure(){
        view.backgroundColor = .systemBackground
        [
            settingsButton,
            profileEditButton,
            HstackView].forEach{
            view.addSubview($0)
        }
        
        settingsButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.snp.leading).offset(20)
        }
        
        profileEditButton.snp.makeConstraints{
            $0.centerY.equalTo(settingsButton.snp.centerY)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
    }

}
