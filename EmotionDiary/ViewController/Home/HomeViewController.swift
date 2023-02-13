//
//  HomeViewController.swift
//  EmotionDiary
//
//  Created by hoon Kim on 2023/02/09.
//

import UIKit
import SnapKit
import Then

class HomeViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "감정일기"
        
        initCollectionView()
        setupConstraints()
    }
    
    private func initCollectionView() {
        self.view.addSubview(emotionCollectionView)
        emotionCollectionView.dataSource = self
        emotionCollectionView.delegate = self
        
        emotionCollectionView.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: HomeCollectionViewCell.identifier)
        
        emotionCollectionView.reloadData()
    }
    
    private func setupConstraints() {
        emotionCollectionView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
            // make.edges.equalToSuperview()
        }
    }
    
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionViewCell.identifier, for: indexPath) as! HomeCollectionViewCell
        
        return cell
    }
}
