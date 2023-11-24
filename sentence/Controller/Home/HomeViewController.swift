//
//  HomeViewController.swift
//  sentence
//
//  Created by terry on 2023/06/30.
//

import UIKit
class HomeViewController: UITableViewController {
    var viewModel: HomeViewModel = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        CommonUtils.navigationTitleConfigure(viewController: self, navigationTitle: "Feed")
    
        tableView.register(ContentCell.self, forCellReuseIdentifier: "cell")
        let header = BannerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 150))
        
        tableView.tableHeaderView = header
        tableView.separatorStyle = .none

        bindViewModel()
        viewModel.fetchSentence()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.fetchSentence()
        bindViewModel()
    }

    func bindViewModel(){
        self.viewModel.changeData = { [weak self] _ in
            self?.tableView.reloadData()
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sentence?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ContentCell else { return UITableViewCell() }
        cell.delegate = self
        cell.selectionStyle = .none
        if let data = self.viewModel.sentence?[indexPath.row] {
            cell.setData(data)
        }
        cell.index = indexPath.row
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 380
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sentenceVC = SentenceViewController()
        sentenceVC.modalTransitionStyle = .crossDissolve
        sentenceVC.modalPresentationStyle = .overFullScreen
        if let selectedData = self.viewModel.sentence?[indexPath.row] {
            sentenceVC.viewModel.sentence = selectedData
        }
        present(sentenceVC, animated: true)
    }
    
}

extension HomeViewController: ContentCellDelegate {
    
    //Cell tag 설정된 델리게이트
    func tappedHeartButton(index: Int) {
        let cell = ContentCell()
        cell.isLike.toggle()
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
