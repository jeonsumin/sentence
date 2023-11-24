//
//  SentenceViewController.swift
//  sentence
//
//  Created by terry on 2023/07/05.
//

import UIKit
import SnapKit
import Kingfisher

class SentenceViewController: UIViewController {

    var viewModel: SentenceViewModel = .init()

    var isLike = false
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "arrow.left"), for: .normal)
        button.tintColor = .label
        button.addTarget(self, action: #selector(tappedBackButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.addTarget(self, action: #selector(tappedheartButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "more"), for: .normal)
        button.addTarget(self, action: #selector(tappedMoreButton), for: .touchUpInside)
        
        return button
    }()
    
    
    private lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        [
            backButton,
            likeButton,
            moreButton,
        ].forEach{
            view.addSubview($0)
            
        }
        
        backButton.snp.makeConstraints{
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.centerY.equalTo(view.snp.centerY)
        }
        
        moreButton.snp.makeConstraints{
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.centerY.equalTo(view.snp.centerY)
        }
        
        likeButton.snp.makeConstraints{
            $0.trailing.equalTo(moreButton.snp.leading).offset(-20)
            $0.centerY.equalTo(view.snp.centerY)
        }
        
        return view
    }()
    
    private lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0

        return label
    }()
    private var bookCoverImage = UIImageView()
    private var bookNameLabel = UILabel()
    private var bookOwnerLabel = UILabel()

    private lazy var bookSentenceView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .systemGray6
        sentenceLabel.numberOfLines = 0
        bookNameLabel.font = .systemFont(ofSize: 12,weight: .bold)
        bookOwnerLabel.font = .systemFont(ofSize: 12,weight: .bold)
        bookCoverImage.contentMode = .scaleAspectFit
        [
            sentenceLabel,
            bookCoverImage,
            bookNameLabel,
            bookOwnerLabel,
        ].forEach{
            view.addSubview($0)
        }
        
        sentenceLabel.snp.makeConstraints{
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-60)
            $0.top.equalTo(view.snp.top).inset(160)
            $0.height.lessThanOrEqualTo(10)
        }
        
        bookCoverImage.snp.makeConstraints{
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.bottom.equalTo(view.snp.bottom).offset(20)
            $0.top.equalTo(sentenceLabel.snp.bottom)
            $0.width.equalTo(50)
            $0.height.equalTo(180)
        }

        bookNameLabel.snp.makeConstraints{
            $0.leading.equalTo(bookCoverImage.snp.trailing).offset(10)
            $0.top.equalTo(bookCoverImage.snp.top).inset(80)
        }

        bookOwnerLabel.snp.makeConstraints{
            $0.leading.equalTo(bookNameLabel.snp.leading)
            $0.top.equalTo(bookNameLabel.snp.bottom)
        }
        return view
    }()
    
    private var likeLabelCount = UILabel()
    private var scrapLabelCount = UILabel()
    
    private lazy var circleSentenceBookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "circle_bookmark"), for: .normal)
        button.addTarget(self, action: #selector(tappedBookmarkButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var userThumnailImage: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 45 / 2
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .black
        
        return image
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "구보라"
        label.font = .systemFont(ofSize: 16)
        
        return label
    }()
    
    private lazy var uploadTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "21분 전"
        label.textColor = .systemGray2
        label.font = .systemFont(ofSize: 12)
        
        return label
    }()
    
    private lazy var profileEditButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("팔로우", for: .normal)
        button.backgroundColor = UIColor(hex: "CE52DE")
        button.layer.cornerRadius = 20
        button.titleLabel?.font = .systemFont(ofSize: 12,weight: .semibold)
        button.tintColor = .label
        
        return button
    }()
    
    private lazy var commentView = CommentView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIConfigure()
        setData()
    }


    func setData(){
        sentenceLabel.text = self.viewModel.sentence?.sentence
        bookNameLabel.text = self.viewModel.sentence?.bookName
        bookOwnerLabel.text = self.viewModel.sentence?.bookAuth
        bookCoverImage.kf.setImage(with: self.viewModel.sentence?.bookCover)

        guard let userId = self.viewModel.sentence?.id else { return }
        FirebaseManager.shared.fetchCurrentUser(userId) { user in
            self.userNameLabel.text = user.username
        }
    }

    
    //MARK: - Function
    @objc func tappedBackButton(){
        self.dismiss(animated: true)
        print("backButton")
    }
    @objc func tappedheartButton(){
        isLike.toggle()
        isLike ? likeButton.setImage(UIImage(named: "heart_on"), for: .normal) : likeButton.setImage(UIImage(named: "heart"), for: .normal)
        
    }
    @objc func tappedMoreButton(){
        print("backButton")
    }
    @objc func tappedBookmarkButton(){
        print("backButton")
    }
}

extension SentenceViewController {
    func UIConfigure(){
        view.backgroundColor = .systemBackground
        [
            bookSentenceView,
            headerView,
            likeLabelCount,
            scrapLabelCount,
            circleSentenceBookmarkButton,
            userThumnailImage,
            userNameLabel,
            uploadTimeLabel,
            profileEditButton,
            CommonUtils.dimmedView,
            commentView
        ].forEach{
            view.addSubview($0)
        }
        
        headerView.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(30)
        }
        bookSentenceView.snp.makeConstraints{
            $0.top.equalTo(view.snp.top)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(view.frame.size.height / 2)
        }
        
        scrapLabelCount.text = "스크랩 1"
        scrapLabelCount.font = .systemFont(ofSize: 12,weight: .medium)
        scrapLabelCount.snp.makeConstraints{
            $0.top.equalTo(bookSentenceView.snp.bottom).offset(10)
            $0.leading.equalTo(likeLabelCount.snp.trailing).offset(10)
        }
        
        
        likeLabelCount.text = "좋아요 1"
        likeLabelCount.font = .systemFont(ofSize: 12,weight: .medium)
        likeLabelCount.snp.makeConstraints{
            $0.top.equalTo(bookSentenceView.snp.bottom).offset(10)
            $0.leading.equalTo(view.snp.leading).offset(20)
        }
        
        circleSentenceBookmarkButton.snp.makeConstraints{
            $0.centerY.equalTo(view.snp.centerY)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
        }
        
        profileEditButton.snp.makeConstraints{
            $0.top.equalTo(circleSentenceBookmarkButton.snp.bottom).offset(30)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.width.equalTo(80)
            $0.height.equalTo(40)
        }
        
        userThumnailImage.snp.makeConstraints{
            $0.top.equalTo(circleSentenceBookmarkButton.snp.bottom).offset(30)
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.width.equalTo(45)
            $0.height.equalTo(45)
        }
        
        userNameLabel.snp.makeConstraints{
            $0.leading.equalTo(userThumnailImage.snp.trailing).offset(8)
            $0.top.equalTo(userThumnailImage.snp.top).offset(8)
        }
        uploadTimeLabel.snp.makeConstraints{
            $0.top.equalTo(userNameLabel.snp.bottom)
            $0.leading.equalTo(userNameLabel.snp.leading)
        }
        
        CommonUtils.dimmedView.snp.makeConstraints{
            $0.top.equalTo(userThumnailImage.snp.bottom).offset(40)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(1)
        }
    }
}
