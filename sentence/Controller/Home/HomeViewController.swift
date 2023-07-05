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
        CommonUtils.navigationTitleConfigure(viewController: self, navigationTitle: "Feed")
    
        tableView.register(ContentCell.self, forCellReuseIdentifier: "cell")
        let header = BannerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        
        tableView.tableHeaderView = header
        tableView.separatorStyle = .none
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContentCell else { return UITableViewCell() }
        cell.delegate = self
        cell.selectionStyle = .none
        cell.index = indexPath.row
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 380
    }
    
}

extension HomeViewController: ContentCellDelegate {
    
    //Cell tag 설정된 델리게이트
    func tappedHeartButton(index: Int) {
        print("index ::: \(index)")
        let cell = ContentCell()
        cell.isLike = !cell.isLike
    }
    
    func tappedBookmarkButton() {
        print("tapped bookmark Button")
    }
    
    func tappedMoreButton() {
        let alertController = UIAlertController(title: "옵션 선택", message: nil, preferredStyle: .actionSheet)
        alertController.addAction(UIAlertAction(title: "공유하기", style: .default,handler: { action in
            let previewVC = PreviewController()
            previewVC.modalPresentationStyle = .fullScreen
            self.present(previewVC, animated: true)
        }))
        alertController.addAction(UIAlertAction(title: "신고하기", style: .default,handler: { action in
            print("action : ", action)
        }))
        alertController.addAction(UIAlertAction(title: "취소", style: .cancel))
        
        present(alertController, animated: true)
    }
}
