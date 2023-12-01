//
//  SelectedViewController.swift
//  sentence
//
//  Created by Terry on 2023/08/16.
//

import UIKit
protocol SelectedViewControllerDelegate: AnyObject {
    func BookSelectDidTap(book: Book)
}

class SelectedViewController: UIViewController {
    private lazy var textFieldView: UITextField = {
        let field = UITextField()
        field.addLeftPadding()
        field.backgroundColor = UIColor(hex: "#EFEFEF")
        field.placeholder = "책을 선택해주세요"
        field.layer.cornerRadius = 8
        return field
    }()
    
    private lazy var tableView = UITableView()
    weak var delegate: SelectedViewControllerDelegate?
    
    var books: Book? {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        UIConfigure()
        setupTableViewConfigure()
        textFieldView.delegate = self
    }
    
    func fetchData(with searchQuery:String = "해리포터" ){
        AlamofireManager.shared.fetchData(for: searchQuery) { book in
            self.books = book
        }
    }
    
    func UIConfigure(){
        view.backgroundColor = .systemBackground
        [
            textFieldView,
            tableView
        ].forEach {
            view.addSubview($0)
        }
        
        textFieldView.snp.makeConstraints{
            $0.centerX.equalToSuperview()
            $0.top.leading.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(64)
        }
        
        tableView.snp.makeConstraints{
            $0.top.equalTo(textFieldView.snp.bottom).offset(28)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    func setupTableViewConfigure(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(SelectedViewCell.self, forCellReuseIdentifier: SelectedViewCell.identifier)
    }
}

extension SelectedViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "최근 읽은 문장의 책"
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return books?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SelectedViewCell.identifier, for: indexPath) as! SelectedViewCell
        let datas = books?.items[indexPath.row]
        cell.UIConfigure(with: datas!)
//        cell.backgroundColor = .gray
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = books?.items[indexPath.row]
        guard let preVC = self.presentingViewController as? EditSentenceViewController else { return }
        preVC.selectedBook.setTitle(data?.title,for: .normal)
        preVC.selectedBood = books?.items[indexPath.row]
        delegate?.BookSelectDidTap(book: books!)
        self.dismiss(animated: true)
    }
}

extension SelectedViewController: UITextFieldDelegate{
    func textFieldDidChangeSelection(_ textField: UITextField) {
        fetchData(with: textField.text!)
    }
}
