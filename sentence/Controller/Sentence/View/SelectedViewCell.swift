//
//  SelectedViewCell.swift
//  sentence
//
//  Created by Terry on 2023/08/16.
//

import UIKit
import SnapKit
import Kingfisher

class SelectedViewCell: UITableViewCell {
    
    static let identifier = "selectViewCell"
    private let bookCoverImg: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    private let bookName = LargeTitleLabel()
    private let authorBook = TitleLabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        [
            bookCoverImg,
            bookName,
            authorBook
        ].forEach{
            contentView.addSubview($0)
        }
        
        bookCoverImg.snp.makeConstraints{
            $0.top.leading.equalToSuperview().offset(20)
            $0.width.equalTo(55)
            $0.height.equalTo(80)
        }
        bookName.numberOfLines = 0
        bookName.snp.makeConstraints{
            $0.top.equalTo(bookCoverImg.snp.top).offset(12)
            $0.leading.equalTo(bookCoverImg.snp.trailing).offset(8)
            $0.trailing.equalToSuperview().inset(20)
        }
        authorBook.snp.makeConstraints{
            $0.top.equalTo(bookName.snp.bottom).offset(3)
            $0.leading.equalTo(bookName)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func UIConfigure(with model: Items){
        bookName.text = model.title
        authorBook.text = model.author
        let urlString = URL(string: model.image)!
        bookCoverImg.kf.setImage(with: urlString)
    }
    
    
}
