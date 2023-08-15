//
//  BannerView.swift
//  sentence
//
//  Created by terry on 2023/06/30.
//

import UIKit

class BannerView: BaseView {
    private lazy var baseView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        view.layer.cornerRadius = 16
        return view
    }()
    
    private lazy var mainCopy: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.white
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 20 , weight: .medium)
        label.textColor = .white
        label.text = """
                    문장에서 시작된 이야기
                    텍스처픽 구독하기
                    """
        return label
    }()
    
    private lazy var subCopy: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .white
        label.text = "매주 수요일 메일함에서 만나보세요"

        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    override func UIConfigure() {
        
        self.addSubview(baseView)
    
        [
            mainCopy,
            subCopy
        ].forEach{
            baseView.addSubview($0)
        }
        
        baseView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        baseView.leadingAnchor.constraint(equalTo: self.leadingAnchor,constant: 20).isActive = true
        baseView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        mainCopy.topAnchor.constraint(equalTo: baseView.topAnchor, constant: 31).isActive = true
        mainCopy.leadingAnchor.constraint(equalTo: baseView.leadingAnchor, constant: 19).isActive = true
//        mainCopy.trailingAnchor.constraint(equalTo: baseView.trailingAnchor, constant: -195).isActive = true
        
        subCopy.topAnchor.constraint(equalTo: mainCopy.bottomAnchor,constant: 7).isActive = true
        subCopy.leadingAnchor.constraint(equalTo: mainCopy.leadingAnchor).isActive = true
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
