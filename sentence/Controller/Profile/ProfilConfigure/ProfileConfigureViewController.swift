//
//  ProfileConfigureViewController.swift
//  sentence
//
//  Created by Terry on 2023/11/21.
//

import UIKit

class ProfileConfigureViewController: UITableViewController {
    let settingsString: [String] = [
    "공지사항",
    "고객샌터",
    "이용약관",
    "버전 1.0.0",
    "로그아웃"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }

    func setupTableView(){
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingsString.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = settingsString[indexPath.row]

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let lastItem = settingsString.lastIndex(of: "로그아웃")
        if indexPath.row == lastItem {
            UserDefaults.standard.set(nil, forKey: "naverLoginToken")
            let vc = LoginViewController()
            let navVC = UINavigationController(rootViewController: vc)
            navVC.modalPresentationStyle = .fullScreen
            present(navVC, animated: false)
        }
    }
}



