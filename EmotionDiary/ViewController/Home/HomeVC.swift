//
//  HomeVC.swift
//  EmotionDiary
//
//  Created by hoon Kim on 2023/02/07.
//

import UIKit
import SnapKit
import Then

class HomeVC: UIViewController {
    /// 라이브러리 Then 알아보기 -> Then 사용해서 깔끔하게 바꿔보기
    let verticalStackView = UIStackView().then {
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 15
    }
    
    //    let horizontalStackView: UIStackView = {
    //        let stackView = UIStackView()
    //        stackView.axis = .horizontal
    //        stackView.alignment = .fill
    //        stackView.distribution = .fillEqually
    //        stackView.spacing = 15
    //        return stackView
    //    }()
    
    let horizontalStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.alignment = .fill
        $0.distribution = .fillEqually
        $0.spacing = 15
    }
    
    let backView = UIView().then {
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.systemGray5.cgColor
        $0.layer.cornerRadius = 8
    }
    
    let emotionButton = UIButton().then {
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.red.cgColor
        $0.setTitle("😀", for: .normal)
    }
    
    let countLabel = UILabel().then {
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.blue.cgColor
        $0.font = .systemFont(ofSize: 15)
        $0.text = "0번"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setupConstraints()
    }
    
    private func initUI() {
        view.addSubview(verticalStackView)
        verticalStackView.addArrangedSubview(horizontalStackView)
        horizontalStackView.addArrangedSubview(backView)
        backView.addSubview(emotionButton)
        backView.addSubview(countLabel)
        
        print("In !!!!!")
    }
    
    private func setupConstraints() {
        verticalStackView.snp.makeConstraints { make in
            make.centerY.equalTo(self.view.snp.centerY)
            make.leading.trailing.equalToSuperview().inset(15)
        }
        
        /// backView를 constraints를 잡지 않고 subview들(emotionButton, countLable)의 사이즈를 따라 유동적으로 변하도록 작성해보세요.
        backView.snp.makeConstraints { make in
            
        }
        
        emotionButton.snp.makeConstraints { make in
            /// inset과 offset 차이 느껴보고 공부해보기
            make.top.leading.trailing.equalToSuperview().inset(10)
            make.height.equalTo(emotionButton.snp.width).multipliedBy(1.0 / 1.0)
        }
        
        countLabel.snp.makeConstraints { make in
            make.height.equalTo(25)
            make.top.equalTo(emotionButton.snp.bottom).inset(15)
            make.centerX.equalTo(backView.snp.centerX)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
}
