//
//  UploadSentenceCell.swift
//  sentence
//
//  Created by terry on 2023/07/05.
//

import UIKit
import SnapKit

class UploadSentenceCell: UICollectionViewCell {

    static let identifier = "UploadSentenceCell"
    
    private lazy var sentenceView: UIView = {
        let view = UIView(frame: .zero)
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(hex: "FEF3BC")
        return view
    }()
    
    private lazy var sentenceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14,weight: .bold)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.text = "방지하는 품었기 충분히 실현에 이것이야말로 위하여서. 거친 능히 기관과 부패뿐이다. 피가 수 위하여서 일월과 아름다우냐? 노년에게서 원질이 전인 아니한 것이다. 얼음에 있을 무엇이 이상의 보이는 얼음 그리하였는가? 않는 공자는 붙잡아 같은 군영과 바이며, 피어나는 뼈 불러 운다. 뜨거운지라, 날카로우나 부패를 것은 있다. 끓는 같지 소리다.이것은 보이는 노년에게서 내려온 있으랴? 속에 얼음과 품고 말이다. 있는 현저하게 생의 그들은 트고, 품고 용기가 사막이다. 그것은 많이 힘차게 든 목숨을 이상, 황금시대다."
        
        return label
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.addSubview(sentenceView)
        sentenceView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
        sentenceView.addSubview(sentenceLabel)
        sentenceLabel.snp.makeConstraints{
            $0.leading.equalTo(sentenceView.snp.leading).offset(10)
            $0.top.equalTo(sentenceView.snp.top).offset(10)
            $0.trailing.equalTo(sentenceView.snp.trailing).offset(-10)
            $0.bottom.equalTo(sentenceView.snp.bottom).offset(-10)
        }
    }
}
