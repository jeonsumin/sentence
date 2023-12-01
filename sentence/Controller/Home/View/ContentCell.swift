//
//  ContentCell.swift
//  sentence
//
//  Created by terry on 2023/06/30.
//

import UIKit
import SnapKit

protocol ContentCellDelegate {
    func tappedHeartButton(index: Int)
    func tappedBookmarkButton()
    func tappedMoreButton()
}

class ContentCell: UITableViewCell {
    var delegate :ContentCellDelegate!
 
    var index:Int = 0
    var isLike = false
    var isBookmark = false
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .systemGray3
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 35 / 2
        
        return imageView
    }()
    
    private lazy var uploadTimelabel: UILabel = {
        let label = UILabel()
        label.text = "21분 전"
        label.textColor = .systemGray2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 8,weight: .medium)
        return label
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "구보라"
        label.font = .systemFont(ofSize: 14,weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sentenceView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .green
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.text = "많이 생각하고 있어요. 다른 사람이 쓴 글,만든 책도 많이 보면서, 그들의 삶의 방식에 늘 매료되면서, 최대한 즐기면서, 그렇게 하고 있어요.(p.163)"
        label.numberOfLines = 9
        label.font = .systemFont(ofSize: 16,weight: .medium)
        
        return label
    }()
    
    private lazy var sentenceDescriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "아무도 알려주지 않은 도서관 사서 실무"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12,
                                 weight: .medium)
        
        return label
    }()
    
    private lazy var bookOwnerLabel : UILabel = {
        let label = UILabel()
        label.text = "강민선"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12,
                                 weight: .medium)
        
        return label
    }()
    
    private lazy var heartButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.addTarget(self, action: #selector(tappedHeartButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var bookmarkButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "bookmark"), for: .normal)
        button.addTarget(self, action: #selector(tappedBookmarkButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var sentenceMoreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "more"), for: .normal)
        button.addTarget(self, action: #selector(tappedMoreButton), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        UIConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tappedHeartButton(){
        delegate.tappedHeartButton(index: index)
        isLike = !isLike
        isLike ? heartButton.setImage(UIImage(named: "heart_on"), for: .normal) : heartButton.setImage(UIImage(named: "heart"), for: .normal)
        
    }
    
    @objc func tappedBookmarkButton(){
        delegate.tappedBookmarkButton()
        isBookmark = !isBookmark
        isBookmark ? bookmarkButton.setImage(UIImage(named: "bookmark_on"), for: .normal) : bookmarkButton.setImage(UIImage(named: "bookmark"), for: .normal)
    }
    
    @objc func tappedMoreButton(){
        delegate.tappedMoreButton()
    }

    func setData(_ data: Sentence){
        FirebaseManager.shared.fetchCurrentUser(data.id) { user in
            self.userNameLabel.text = user.username
        }

        self.sentenceLabel.text = data.sentence
        self.sentenceDescriptionLabel.text = data.bookName
        self.bookOwnerLabel.text = data.bookAuth
        self.uploadTimelabel.text = data.createDate
    }
}


//MARK: - UI Configure
extension ContentCell {
    
    func UIConfigure(){
        
        [
            profileImageView,
            userNameLabel,
            uploadTimelabel,
            sentenceView,
            heartButton,
            bookmarkButton,
            sentenceMoreButton,
        ].forEach{
            contentView.addSubview($0)
        }
        profileImageView.widthAnchor.constraint(equalToConstant: 35).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 20).isActive = true
        profileImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 20).isActive = true
        
        userNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(11)
        }
        
        uploadTimelabel.snp.makeConstraints {
            $0.top.equalTo(userNameLabel.snp.bottom)
            $0.leading.equalTo(userNameLabel.snp.leading)
        }
        
        sentenceView.snp.makeConstraints {
            $0.leading.equalTo(contentView.snp.leading).offset(20)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-20)
            $0.top.equalTo(profileImageView.snp.bottom).offset(11)
            $0.height.equalTo(265)
        }
        
        heartButton.snp.makeConstraints {
            $0.leading.equalTo(sentenceView.snp.leading).offset(6)
            $0.top.equalTo(sentenceView.snp.bottom).offset(12)
        }
        
        bookmarkButton.snp.makeConstraints {
            $0.leading.equalTo(heartButton.snp.trailing).offset(11)
            $0.top.equalTo(sentenceView.snp.bottom).offset(12)
        }
        
        sentenceMoreButton.snp.makeConstraints {
            $0.trailing.equalTo(sentenceView.snp.trailing).offset(-6)
            $0.centerY.equalTo(bookmarkButton.snp.centerY)
        }
        
        [
            
            sentenceLabel,
            sentenceDescriptionLabel,
            bookOwnerLabel
        ].forEach{
            sentenceView.addSubview($0)
        }
        sentenceLabel.snp.makeConstraints{
            $0.leading.equalTo(sentenceView.snp.leading).offset(20)
            $0.trailing.equalTo(sentenceView.snp.trailing).offset(-20)
            $0.top.equalTo(sentenceView.snp.top).offset(20)
        }
        bookOwnerLabel.snp.makeConstraints{
            $0.leading.equalTo(sentenceView.snp.leading).offset(20)
            $0.trailing.equalTo(sentenceView.snp.trailing).offset(-20)
            $0.bottom.equalTo(sentenceView.snp.bottom).offset(-15)
        }
        sentenceDescriptionLabel.snp.makeConstraints{
            $0.leading.equalTo(bookOwnerLabel.snp.leading)
            $0.trailing.equalTo(sentenceView.snp.trailing)
            $0.bottom.equalTo(bookOwnerLabel.snp.top).offset(-3)
        }
        
    }
}
