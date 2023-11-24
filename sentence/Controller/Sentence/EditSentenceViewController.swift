//
//  EditSentenceViewController.swift
//  sentence
//
//  Created by terry on 2023/07/06.
//

import UIKit
import SnapKit
import FirebaseDatabase
import FirebaseAuth

class EditSentenceViewController: UIViewController{

    //MARK: - Properties
    private lazy var titleLabel: UILabel = {
        let button = UILabel()
        button.text = "새로운 문장"
        button.font = .systemFont(ofSize: 18,weight: .bold)
        button.textColor = .label
        
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("취소", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18,weight: .medium)
        button.tintColor = .label
        button.addTarget(self, action: #selector(tappedCancelButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("완료", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18,weight: .bold)
        button.tintColor = .label
        button.addTarget(self, action: #selector(tappedSuccessButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView(frame: .zero)
        [
            titleLabel,
            likeButton,
            moreButton,
        ].forEach{
            view.addSubview($0)
        }
        
        titleLabel.snp.makeConstraints{
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.centerY.equalTo(view.snp.centerY)
        }
        
        moreButton.snp.makeConstraints{
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.centerY.equalTo(view.snp.centerY)
        }
        
        likeButton.snp.makeConstraints{
            $0.trailing.equalTo(moreButton.snp.leading).offset(-20)
            $0.centerY.equalTo(view.snp.centerY)
        }
        
        return view
    }()
    
    public lazy var selectedBook: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .systemGray5
        button.setTitle("책을 선택해 주세요", for: .normal)
        button.tintColor = .label
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        button.titleLabel?.font = .systemFont(ofSize: 16,weight: .light)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tappedSelectedBook), for: .touchUpInside)
        return button
    }()
    
    let textViewPlaceHolder = "문장을 입력해 주세요."
    private lazy var sentenceTextFieldView: UITextView = {
        let txtView = UITextView()
        txtView.backgroundColor = .clear
        txtView.text = textViewPlaceHolder
        txtView.textColor = .lightGray
        txtView.delegate = self
        

        
        return txtView
    }()

    private lazy var backgroundColorChangeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .brown
        button.layer.borderWidth = 3
        button.layer.borderColor = CGColor.init(red: 0, green: 0, blue: 0, alpha: 0)
        button.layer.cornerRadius = 6
        button.addTarget(self, action: #selector(tappedChangeBackGroundColorButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var remainCountLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "0/400"
        label.font = .systemFont(ofSize: 12)
        label.textColor = .lightGray
        label.textAlignment = .center
        
        
        return label
        
    }()
    
    private lazy var sentenceTxtView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 8
        view.backgroundColor = .systemGray4
        [
            sentenceTextFieldView,
//            backgroundColorChangeButton,
            remainCountLabel,
        ].forEach{
            view.addSubview($0)
        }
        
        sentenceTextFieldView.snp.makeConstraints{
            $0.leading.equalTo(view).offset(10)
            $0.trailing.equalTo(view).inset(10)
            $0.top.equalTo(view).offset(14)
            $0.bottom.equalTo(view).inset(60)
        }
        
//        backgroundColorChangeButton.snp.makeConstraints{
//            $0.bottom.equalTo(view.snp.bottom).inset(10)
//            $0.leading.equalTo(sentenceTextFieldView)
//        }
        
        remainCountLabel.snp.makeConstraints{
            $0.trailing.equalTo(view).inset(10)
            $0.bottom.equalTo(view).inset(10)
//            $0.centerY.equalTo(backgroundColorChangeButton)
        }
        return view
    }()

    var selectedBood: Items?
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        UIConfigure()
    }
    
    
    //MARK: - Function
    @objc func tappedCancelButton(){
        self.dismiss(animated: true)
    }

    //MARK: - 문장 저장 완료
    @objc func tappedSuccessButton(){
        guard let books = self.selectedBood,
              let sentence = sentenceTextFieldView.text
        else { return }

        guard let key = Database.database().reference().childByAutoId().key else { return }
        let loginUser = Auth.auth().currentUser?.uid
        let params = [
            "id": loginUser,
            "bookId": "\(key)",
            "bookName": books.title,
            "bookCover": books.image,
            "bookAuth" : books.author,
            "link" : books.link,
            "descrips": books.description,
            "sentence": sentence
        ]
        Database.database().reference().child("sentence/\(key)").setValue(params)
        self.dismiss(animated: true)
    }

    //MARK: - 배경색상 변경 버튼 액션
    @objc func tappedChangeBackGroundColorButton() {
        print("tapped ChangeBackGroundColor Button")
    }

    //MARK: - 책 선택 버튼
    @objc func tappedSelectedBook(){
        let vc = SelectedViewController()
        let navVC = UINavigationController(rootViewController: vc)
        navVC.modalPresentationStyle = .automatic
        present(navVC, animated: true)
    }
    
    private func updateCountLabel(characterCount: Int){
        remainCountLabel.text = "\(characterCount)/400"
    }
}

extension EditSentenceViewController{
    func UIConfigure(){
        view.backgroundColor = .systemBackground
        
        [
            headerView,
            selectedBook,
            sentenceTxtView,
        ].forEach{
            view.addSubview($0)
        }
        
        headerView.snp.makeConstraints{
            $0.top.equalTo(view.snp.top).offset(60)
            $0.leading.equalTo(view.snp.leading)
            $0.trailing.equalTo(view.snp.trailing)
            $0.height.equalTo(60)
        }
        selectedBook.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            
            $0.leading.equalTo(view.snp.leading).offset(20)
            $0.trailing.equalTo(view.snp.trailing).offset(-20)
            $0.height.equalTo(60)
        }
        
        sentenceTxtView.snp.makeConstraints{
            $0.leading.equalTo(selectedBook)
            $0.trailing.equalTo(selectedBook)
            $0.top.equalTo(selectedBook.snp.bottom).offset(5)
            $0.height.equalTo(255)
        }
    }
}

extension EditSentenceViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == textViewPlaceHolder {
            textView.text = nil
            textView.textColor = .label
        }
    }
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = textViewPlaceHolder
            textView.textColor = .lightGray
            updateCountLabel(characterCount: 0)
        }
    }
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let inputString = text.trimmingCharacters(in: .whitespacesAndNewlines)
        guard let oldString = textView.text, let newRange = Range(range, in: oldString) else { return true }
        let newString = oldString.replacingCharacters(in: newRange, with: inputString).trimmingCharacters(in: .whitespacesAndNewlines)
        
        let characterCount = newString.count
        guard characterCount < 400 else { return false }
        updateCountLabel(characterCount: characterCount)
        
        return true
    }
}

extension EditSentenceViewController: SelectedViewControllerDelegate {
    func BookSelectDidTap(book: Book) {
        print("book Select : \(book)")
    }
}
