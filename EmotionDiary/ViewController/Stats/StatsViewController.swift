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
            // make.edges.equalToSuperview()
        }
    }
    
    
}

extension StatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension StatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: StatsTableViewCell.identifier, for: indexPath) as! StatsTableViewCell
    
        return cell
    }
}

