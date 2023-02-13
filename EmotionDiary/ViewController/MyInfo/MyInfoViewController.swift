//
//  MyInfoViewController.swift
//  EmotionDiary
//
//  Created by hoon Kim on 2023/02/10.
//

import UIKit

class MyInfoViewController: UIViewController {
    
    let nameLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 16)
        $0.text = "내 정보"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        
        setupConstraints()
    }
    
    func addViews() {
        self.view.backgroundColor = .white
        self.view.addSubview(nameLabel)
    }
    
    func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(self.view.snp.centerY)
            make.centerX.equalTo(self.view.snp.centerX)
        }
    }
    
}
