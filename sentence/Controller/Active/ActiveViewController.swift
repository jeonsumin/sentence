//
//  ActiveViewController.swift
//  sentence
//
//  Created by deepvisions on 2023/06/30.
//

import UIKit
import SnapKit

class ActiveViewController: UIViewController {
    private var tableview = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CommonUtils.navigationTitleConfigure(viewController: self, navigationTitle: "Activity")
        setupTableView()
        UIConfigure()
    }
    
    
    func setupTableView(){
        tableview.delegate = self
        tableview.dataSource = self
        
        tableview.register(ActiveTableViewCell.self, forCellReuseIdentifier: ActiveTableViewCell.identifier)
        
        let header = UIView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 50))
        let label = UILabel()
        label.text = "알림이 없습니다."
        label.textColor = .systemGray3
        label.font = .systemFont(ofSize: 14)
        header.addSubview(label)
        label.snp.makeConstraints{
            $0.centerY.equalTo(header.snp.centerY)
            $0.leading.equalTo(header.snp.leading).offset(20)
        }
        tableview.tableHeaderView = header
        
        //TODO: add TableView Refresh control 
    }
}

extension ActiveViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ActiveTableViewCell.identifier, for: indexPath) as! ActiveTableViewCell
        
        return cell
    }
}

extension ActiveViewController {
    
    func UIConfigure() {
        view.backgroundColor = .systemBackground
        [tableview].forEach{
            view.addSubview($0)
        }
        tableview.snp.makeConstraints{
            $0.leading.top.trailing.bottom.equalTo(view)
        }
    }
}

