//
//  PopularWordCell.swift
//  sentence
//
//  Created by deepvisions on 2023/07/04.
//

import UIKit
import SnapKit

class PopularWordCell: UITableViewCell {
    static let identifier = "popularWordCell"
    
    
    private lazy var cellView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(hex: "FEF0AB")
        view.layer.cornerRadius = 8
        return view
    }()
    
    lazy var rankLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20,weight: .bold)
        label.textColor = .purple
        
        return label
    }()
    
    lazy var popularWordLabel: UILabel = {
        let label = UILabel()
        label.text = "이별"
        label.font = .systemFont(ofSize: 20,weight: .semibold)
        label.textColor = .label
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:reuseIdentifier)
        UIConfigure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func UIConfigure(){
        self.addSubview(cellView)
        
        cellView.snp.makeConstraints{
            $0.leading.equalTo(self.snp.leading).offset(20)
            $0.top.equalTo(self.snp.top).offset(14)
            $0.trailing.equalTo(self.snp.trailing)
            $0.height.equalTo(40)
        }
        
        [
            rankLabel,
            popularWordLabel
        ].forEach{
            cellView.addSubview($0)
        }
        
        rankLabel.snp.makeConstraints {
            $0.leading.equalTo(cellView.snp.leading).offset(20)
            $0.centerY.equalTo(cellView.snp.centerY)
        }
        popularWordLabel.snp.makeConstraints{
            $0.leading.equalTo(rankLabel.snp.trailing).offset(23)
            $0.centerY.equalTo(rankLabel.snp.centerY)
        }
    }
}
