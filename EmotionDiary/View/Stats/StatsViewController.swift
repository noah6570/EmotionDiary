//
//  StatsViewController.swift
//  EmotionDiary
//
//  Created by hoon Kim on 2023/02/09.
//

import UIKit
import SnapKit
import Then

class StatsViewController: UIViewController {
    
    let tableView = UITableView().then {
        $0.register(StatsTableViewCell.self, forCellReuseIdentifier: StatsTableViewCell.identifier)
    }
    
    var emotion: [Emotion] = [Emotion(name: "good", count: 0, imageName: "😀"), Emotion(name: "veryGood", count: 0, imageName: "😄"), Emotion(name: "notbad", count: 0, imageName: "🙂"), Emotion(name: "happy", count: 0, imageName: "🤣"), Emotion(name: "sad", count: 0, imageName: "😭"), Emotion(name: "tired", count: 0, imageName: "😴")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        setupConstraints()
        initTableView()
    }
    
    private func initUI() {
        self.view.addSubview(tableView)
    }
    
    private func initTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.reloadData()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    
}

extension StatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEmotion = self.emotion[indexPath.row]

        UserDefaults.standard.set(selectedEmotion.count + 1, forKey: selectedEmotion.name)
    }
}

extension StatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emotion.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StatsTableViewCell.identifier, for: indexPath) as! StatsTableViewCell
        
        let emotion = self.emotion[indexPath.row]
        
        cell.emotionLabel.text = "\(emotion.imageName)"
        cell.emotionNameLabel.text = emotion.name
        
        let count = UserDefaults.standard.integer(forKey: emotion.name)
        cell.countLabel.text = "\(count)번"
        
        return cell
    }
}

