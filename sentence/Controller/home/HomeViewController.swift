//
//  HomeViewController.swift
//  sentence
//
//  Created by terry on 2023/06/30.
//

import UIKit

class HomeViewController: UITableViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationTitleConfigure()
    
        tableView.register(ContentCell.self, forCellReuseIdentifier: "cell")
        let header = BannerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        
        tableView.tableHeaderView = header
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContentCell else { return UITableViewCell() }
        cell.delegate = self
        cell.selectionStyle = .none
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    
    func navigationTitleConfigure(){
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Feed"
        label.font = UIFont.systemFont(ofSize: 24,weight: .bold)
        
        label.textAlignment = .left
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 44))
        titleView.backgroundColor = .clear
        titleView.addSubview(label)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleView)
    }
}

extension HomeViewController: ContentCellDelegate {
    func tappedHeartButton() {
        print("tapped Header Button")
    }
    
    func tappedBookmarkButton() {
        print("tapped bookmark Button")
    }
    
    func tappedMoreButton() {
        print("tapped More Button")
    }
}
