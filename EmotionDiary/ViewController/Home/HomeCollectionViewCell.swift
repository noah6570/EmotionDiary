//
//  HomeCollectionViewCell.swift
//  EmotionDiary
//
//  Created by hoon Kim on 2023/02/13.
//

import UIKit
import SnapKit
import Then

class HomeCollectionViewCell: UICollectionViewCell {
    
    static let identifier: String = "HomeCollectionViewCell"
    
    let backView = UIView().then {
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.systemGray5.cgColor
        $0.layer.cornerRadius = 8
    }
    
    let emotionButton = UIButton().then {
//        $0.layer.borderWidth = 0.5
//        $0.layer.borderColor = UIColor.red.cgColor
        $0.titleLabel?.font = .systemFont(ofSize: 35)
        $0.setTitle("😀", for: .normal)
    }
    
    let countLabel = UILabel().then {
//        $0.layer.borderWidth = 0.5
//        $0.layer.borderColor = UIColor.blue.cgColor
        $0.font = .systemFont(ofSize: 16)
        $0.text = "0번"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        addViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addViews() {
        self.contentView.addSubview(backView)
        backView.addSubview(emotionButton)
        backView.addSubview(countLabel)
    }
    
    func setupConstraints() {
        backView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        emotionButton.snp.makeConstraints { make in
            /// inset과 offset 차이 느껴보고 공부해보기
            make.top.leading.trailing.equalToSuperview().inset(10)
            //
            make.height.equalTo(emotionButton.snp.width).multipliedBy(1.0 / 1.0)
        }
        
        countLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.top.equalTo(emotionButton.snp.bottom)
            make.centerX.equalTo(backView.snp.centerX)
            make.bottom.equalToSuperview().inset(10)
        }
    }
}
