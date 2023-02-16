//
//  CodeTabBarController.swift
//  EmotionDiary
//
//  Created by hoon Kim on 2023/02/09.
//

import UIKit

class CodeTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///TabBar 설정
        let tabBar: UITabBar = self.tabBar
        tabBar.backgroundColor = UIColor.white
        tabBar.barTintColor = UIColor.white
        ///선택되었을 때 타이틀 컬러
        tabBar.tintColor = UIColor.black
        ///선택안된거 타이틀 컬러
        tabBar.unselectedItemTintColor = UIColor.systemGray5
        tabBar.isHidden = false
        
        initViewControllers()
    }
    
    private func initViewControllers() {
        
        let statsVC = StatsViewController()
        
        let homeVC = HomeViewController()
        
        let myInfoVC = MyInfoViewController()
        
        let firstNavigationController = UINavigationController(rootViewController: statsVC)
        
        let secondNavigationController = UINavigationController(rootViewController: homeVC)
        
        let thirdNavigationController = UINavigationController(rootViewController: myInfoVC)
        
        let statsTabImage = UIImage(systemName: "keyboard")!
        let statsSelectedTabImage = UIImage(systemName: "keyboard.fill")!
        statsVC.tabBarItem = UITabBarItem(title: "통계", image: statsTabImage, selectedImage: statsSelectedTabImage)
        
        let homeTabImage = UIImage(systemName: "house")!
        let homeSelectedTabImage = UIImage(systemName: "house.fill")!
        homeVC.tabBarItem = UITabBarItem(title: "홈", image: homeTabImage, selectedImage: homeSelectedTabImage)
        
        let myInfoTabImage = UIImage(systemName: "person.circle")!
        let myInfoSelectedTabImage = UIImage(systemName: "person.circle.fill")!
        myInfoVC.tabBarItem = UITabBarItem(title: "통계", image: myInfoTabImage, selectedImage: myInfoSelectedTabImage)
        
        let viewControllers = [firstNavigationController, secondNavigationController, thirdNavigationController]
        self.setViewControllers(viewControllers, animated: true)
    }
    
}
