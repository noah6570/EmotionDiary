//
//  HomeViewController.swift
//  EmotionDiary
//
//  Created by hoon Kim on 2023/02/09.
//

import UIKit
import SnapKit
import Then

/// MVVM 으로 구현 하기 ****
///
/// 카운팅이 왜 안되는지 디버깅 하기 !!
/// 버튼에 isUserInteractionEnabled 의 false 처리를 해주지 않아서
/// 버튼이 눌리는 동작으로 인식을 했었던것 같습니다.
/// isUserInteractionEnabled 를 false 로 바꿔주니 정상동작 합니다!

class HomeViewController: UIViewController {
    let viewModel = EmotionHomeViewModel()
    
    let emotionCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        
        let padding: CGFloat = 30.0
        let screenSize: CGRect = UIScreen.main.bounds
        let emotionSize = (screenSize.width - (padding * 2)) / 3
        let emotionCountLabelHeight: CGFloat = 35.0
        
        layout.itemSize = CGSize(width: emotionSize, height: emotionSize + emotionCountLabelHeight)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    
    let totalCountInfoView = UIView().then {
        $0.layer.borderWidth = 0.5
        $0.layer.borderColor = UIColor.systemGray4.cgColor
        $0.layer.cornerRadius = 8
    }
    
    let totalCountInfoStackView = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .center
        $0.spacing = 10
    }
    
    let totalCountInfoLabel = UILabel().then {
        $0.textColor = .darkGray
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 17, weight: .medium)
    }
    
    let totalCountLabel = UILabel().then {
        $0.textColor = .black
        $0.textAlignment = .center
        $0.font = .systemFont(ofSize: 28, weight: .bold)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setNavigationItemTitle()
        
        initCollectionView()
        setupConstraints()
        
        initTotalCountInfoLabel()
        initTotalCountLabel()
    }
    
    private func addViews() {
        let viewArray = [emotionCollectionView, totalCountInfoView]
        
        viewArray.forEach {
            self.view.addSubview($0)
        }
        
        totalCountInfoView.addSubview(totalCountInfoStackView)
        
        totalCountInfoStackView.addArrangedSubview(totalCountInfoLabel)
        totalCountInfoStackView.addArrangedSubview(totalCountLabel)
    }
    
    private func setupConstraints() {
        emotionCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        totalCountInfoView.snp.makeConstraints { make in
            make.bottom.equalToSuperview().inset(135)
        }
        
        totalCountInfoStackView.snp.makeConstraints { make in
            make.centerX.equalTo(self.view.snp.centerX)
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(25)
        }
    }
    
    private func setNavigationItemTitle() {
        self.navigationItem.title = viewModel.navigationItemTitle
    }
    
    private func initCollectionView() {
        emotionCollectionView.dataSource = self
        emotionCollectionView.delegate = self
        
        emotionCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        emotionCollectionView.reloadData()
    }
    
    private func initTotalCountInfoLabel() {
        totalCountInfoLabel.text = viewModel.totalCountInfo
    }
    
    private func initTotalCountLabel() {
        let count = viewModel.calculateEmotionCount()
        totalCountLabel.text = "총 \(count)번"
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let emotion = self.viewModel.emotionInfoArray[indexPath.row]
        
        let beforeCount = UserDefaults.standard.integer(forKey: emotion.name)
        UserDefaults.standard.set(beforeCount + 1, forKey: emotion.name)
        
        self.emotionCollectionView.reloadData()
        self.initTotalCountLabel()
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.viewModel.emotionInfoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
        let emotion = self.viewModel.emotionInfoArray[indexPath.row]
        
        cell.emotionButton.setTitle("\(emotion.imageName)", for: .normal)
        
        let count = UserDefaults.standard.integer(forKey: emotion.name)
        cell.countLabel.text = "\(count)번"
        
        return cell
    }
}
