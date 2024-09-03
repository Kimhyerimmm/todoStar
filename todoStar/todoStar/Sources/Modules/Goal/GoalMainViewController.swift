//
//  GoalMainViewController.swift
//  todoStar
//
//  Created by 김혜림 on 8/28/24.
//

import UIKit

class GoalMainViewController: UIViewController {
    
    // MARK: - property
    let goalMainView = GoalMainView()
    let goalMainViewModel = GoalMainViewModel()
    
    let dbController = DBController.shared
    let testOption = ["테스트입니당", "테스트입니당", "테스트입니당"]
    
    
    // MARK: - Lifecycle
    
    override func loadView() {
        self.view = goalMainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: - 네비게이션 바
        // 상단 여백 추가
        self.additionalSafeAreaInsets.top += 20
        
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
    
    
    // MARK: - Method
    // MARK: Action Method
    // 네비게이션 바 버튼 액션
    @objc func logoButtonAction() {
        let goalVC = GoalMainViewController()
        self.navigationController?.pushViewController(goalVC, animated: false)
    }
    
    @objc func notificationButtonAction() {
        let notificationVC = NotificationViewController()
        self.navigationController?.pushViewController(notificationVC, animated: false)
    }
    
    // MARK: - Data Sources
    
    
    // MARK: - Delegate

    
}

