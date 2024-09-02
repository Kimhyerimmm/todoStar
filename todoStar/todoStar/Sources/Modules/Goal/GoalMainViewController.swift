//
//  GoalMainViewController.swift
//  todoStar
//
//  Created by 김혜림 on 8/28/24.
//

import UIKit

class GoalMainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 좌측 버튼 설정
        self.navigationItem.leftBarButtonItem = CustomNavigationBar.setupLeftBarButton(
            withImage: "logoSmall",
            target: self,
            action: #selector(logoButtonAction)
        )
        
        // 우측 버튼 설정
        self.navigationItem.rightBarButtonItem = CustomNavigationBar.setupRightBarButton(
            withImage: "noti",
            target: self,
            action: #selector(notificationButtonAction)
        )
    }
    
    
    // MARK: - method
    
    // 네비게이션 바 버튼 액션
    @objc func logoButtonAction() {
        let goalVC = GoalMainViewController()
        self.navigationController?.pushViewController(goalVC, animated: false)
    }
    
    @objc func notificationButtonAction() {
        let notificationVC = NotificationViewController()
        self.navigationController?.pushViewController(notificationVC, animated: false)
    }
    
}

