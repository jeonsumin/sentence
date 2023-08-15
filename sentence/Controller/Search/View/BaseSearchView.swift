//
//  BaseSearchView.swift
//  sentence
//
//  Created by terry on 2023/07/03.
//

import UIKit
import SnapKit

class BaseSearchView: BaseView {
    
    //MARK: - Properties
    private lazy var popularBookView: UIView = {
        let view = UIView(frame: .zero)
//        view.layer.borderWidth = 1
        return view
    }()
    private lazy var tableView = UITableView()
    private var dimmedView = UIView()
    
    private lazy var popularSearchLabel: UILabel = {
        let label = UILabel()
        label.text = "지금 사람들이 읽고 있는 책"
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        
        return label
    }()
    private lazy var rightArrowImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "arrow_right")
        return imageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupTableView()
        
        let popularBookViewTap = UITapGestureRecognizer(target: self, action: #selector(popularBookViewTappped))
        popularBookView.addGestureRecognizer(popularBookViewTap)
        popularBookView.isUserInteractionEnabled = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Function
    @objc func popularBookViewTappped(sender: UITapGestureRecognizer){
        print("popular book view Tapped@@")
    }
    
    
    func setupTableView(){
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(PopularWordCell.self, forCellReuseIdentifier: PopularWordCell.identifier)
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 20))
        let label = UILabel()
        label.text = "인기 검색어"
        label.font = .systemFont(ofSize: 14,weight: .bold)
        header.addSubview(label)
        label.snp.makeConstraints{
            $0.centerY.equalTo(header.snp.centerY)
            $0.leading.equalTo(header.snp.leading).offset(20)
        }
        tableView.tableHeaderView = header

        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
    }
    
    override func UIConfigure() {
        [
            popularBookView,
            dimmedView,
            tableView
        ].forEach{
            self.addSubview($0)
        }
        popularBookView.snp.makeConstraints{
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.height.equalTo(60)
        }
        
        dimmedView.snp.makeConstraints{
            $0.top.equalTo(popularBookView.snp.bottom)
            $0.leading.trailing.equalTo(popularBookView)
            $0.height.equalTo(1)
        }
        dimmedView.backgroundColor = .systemGray3
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(dimmedView.snp.bottom).offset(20)
            $0.leading.equalTo(self.snp.leading)
            $0.trailing.equalTo(self.snp.trailing).offset(-20)
            $0.bottom.equalTo(self.snp.bottom)
        }
        [
            popularSearchLabel,
            rightArrowImage,
        ].forEach{
            popularBookView.addSubview($0)
        }
        
        popularSearchLabel.snp.makeConstraints{
            $0.leading.equalTo(popularBookView.snp.leading)
            $0.centerY.equalTo(popularBookView.snp.centerY)
        }
        
        rightArrowImage.snp.makeConstraints {
            $0.trailing.equalTo(popularBookView.snp.trailing)
            $0.centerY.equalTo(popularSearchLabel.snp.centerY)
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
    }
}


//MARK: - UITableView Delegate , DataSource
extension BaseSearchView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PopularWordCell.identifier, for: indexPath) as! PopularWordCell
        cell.selectionStyle = .none
        cell.rankLabel.text = "\(indexPath.row + 1)"
        let word = [
            "사랑",
            "믿음",
            "소망",
            "세상에서가장작은도서관",
            "책속문장나눔",
        ]
        cell.popularWordLabel.text = word[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 55
    }
}
