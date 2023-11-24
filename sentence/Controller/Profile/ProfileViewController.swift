//
//  ProfileViewController.swift
//  sentence
//
//  Created by terry on 2023/06/30.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
    
    //MARK: - Properties
    private lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "gear"), for: .normal)
        button.addTarget(self, action: #selector(tappedSettingsButton), for: .touchUpInside)
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
        label.font = .systemFont(ofSize: 14,weight: .bold)
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.text = "문장"
        return label
    }()
    
    private lazy var sentenceCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14,weight: .bold)
        label.textColor = .label
        label.textAlignment = .left
        label.text = "0"

        return label
    }()
    private lazy var sentenceVstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.axis = .vertical
        [
            sentenceLabel,
            sentenceCount
        ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    private lazy var follower: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14,weight: .bold)
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.text = "팔로워"
        return label
    }()
    
    private lazy var followerCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14,weight: .bold)
        label.textColor = .label
        label.textAlignment = .left
        label.text = "0"
        
        return label
    }()
    
    private lazy var followerVstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.axis = .vertical
        [
            follower,
            followerCount
        ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    
    private lazy var following: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14,weight: .bold)
        label.textColor = .systemGray2
        label.textAlignment = .left
        label.text = "팔로잉"
        
        return label
    }()
    
    private lazy var followingCount: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14,weight: .bold)
        label.textColor = .label
        label.textAlignment = .left
        label.text = "0"
        
        return label
    }()
    
    private lazy var followingVstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.spacing = 8
        stackView.axis = .vertical
        [
            following,
            followingCount
        ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    private lazy var hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 24
        stackView.axis = .horizontal
        [
            sentenceVstackView,
            followerVstackView,
            followingVstackView,
        ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        
        return stackView
    }()
    
    private lazy var countHstackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        stackView.spacing = 12
        stackView.axis = .horizontal
        [
            sentenceCount,
            followerCount,
            followingCount,
        ].forEach{
            stackView.addArrangedSubview($0)
        }
        
        return stackView
    }()
    
    private lazy var userThumnailImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 90 / 2
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        
        return image
    }()
    
    private lazy var userThumnailEditButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "thumbanilEdit"), for: .normal)
        return button
    }()
    
    private lazy var dimmedView: UIView = {
        let view = UIView(frame:.zero)
        view.backgroundColor = .systemGray5
        
        return view
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionview.backgroundColor = .systemBackground
        collectionview.register(UploadSentenceCell.self, forCellWithReuseIdentifier: UploadSentenceCell.identifier)
        
        return collectionview
    }()


    var viewModel: ProfileViewModel = .init()


    //MARK: - LifeCycel
    override func viewDidLoad() {
        super.viewDidLoad()
        UIConfigure()
        setupCollectionView()

        bindViewModel()
        viewModel.fetchProfile()
    }
    
    func bindViewModel(){
        self.viewModel.changeData = { [weak self] in
            self?.userName.text = $0.name

        }
    }

    //MARK: setupCollectionView
    func setupCollectionView(){
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
    }
}

extension ProfileViewController:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: UploadSentenceCell.identifier , for: indexPath) as? UploadSentenceCell else { return UICollectionViewCell() }
        
        return cell
    }
    
}
extension ProfileViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2 - 8
        
        return CGSize(width: width, height: 182)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //          let today = todayList[indexPath.row]
        //          let vc = AppDetailViewController(today: today)
        //          present(vc, animated: true, completion: nil)
    }
}

//MARK: - Target Function
extension ProfileViewController {
    @objc private func tappedSettingsButton(){
        let vc = ProfileConfigureViewController()

        navigationController?.pushViewController(vc, animated: true)
    }
}

//MARK: - UI Confige
extension ProfileViewController {
    func UIConfigure(){
        view.backgroundColor = .systemBackground
        [
            settingsButton,
            profileEditButton,
            userName,
            hStackView,
            userThumnailImage,
            userThumnailEditButton,
            dimmedView,
            collectionView,
        ].forEach{
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
        
        userName.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(160)
            $0.leading.equalTo(settingsButton.snp.leading)
        }
        
        hStackView.snp.makeConstraints{
            $0.leading.equalTo(userName.snp.leading)
            $0.top.equalTo(userName.snp.bottom).offset(10)
        }
        userThumnailImage.snp.makeConstraints{
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.top.equalTo(userName.snp.top)
            $0.width.equalTo(90)
            $0.height.equalTo(90)
        }
        userThumnailEditButton.snp.makeConstraints {
            $0.bottom.equalTo(userThumnailImage.snp.bottom).offset(8)
            $0.trailing.equalTo(userThumnailImage.snp.trailing).offset(-10)
        }
        dimmedView.snp.makeConstraints {
            $0.top.equalTo(hStackView.snp.bottom).offset(60)
            $0.leading.trailing.equalTo(view)
            $0.height.equalTo(1)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(dimmedView.snp.bottom).offset(20)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.height.equalTo(380)
            //            $0.bottom.equalTo(view.snp.bottom)
        }
    }
    
}
