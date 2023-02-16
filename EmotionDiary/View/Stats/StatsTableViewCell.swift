//
//  StatsTableViewCell.swift
//  EmotionDiary
//
//  Created by hoon Kim on 2023/02/09.
//

import UIKit
import SnapKit
import Then

class StatsTableViewCell: UITableViewCell {
    
    static let identifier = "StatsTableViewCell"
    
    let emotionLabel = UILabel()
    
    let emotionNameLabel = UILabel()
    
    let countLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initUI()
        setupConstraints()
    }
    
    private func initUI() {
        self.contentView.addSubview(emotionLabel)
        self.contentView.addSubview(emotionNameLabel)
        self.contentView.addSubview(countLabel)
        
        emotionLabel.font = .systemFont(ofSize: 30)
        
        emotionNameLabel.font = .systemFont(ofSize: 16)
        
        countLabel.font = .systemFont(ofSize: 15)
    }
    
    private func setupConstraints() {
        emotionLabel.snp.makeConstraints { make in
            make.height.width.equalTo(35)
            make.leading.equalToSuperview().inset(25)
            make.top.bottom.equalToSuperview().inset(12)
        }
        
        emotionNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(emotionLabel.snp.centerY)
            make.leading.equalTo(emotionLabel.snp.trailing).inset(-15)
        }
        
        countLabel.snp.makeConstraints { make in
            make.centerY.equalTo(emotionLabel.snp.centerY)
            make.trailing.equalToSuperview().inset(25)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("StatsTableViewCell fatal error")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
}

