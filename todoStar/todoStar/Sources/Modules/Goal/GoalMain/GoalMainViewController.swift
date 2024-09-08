//
//  GoalMainViewController.swift
//  todoStar
//
//  Created by 김혜림 on 8/28/24.
//

import UIKit

class GoalMainViewController: UIViewController, GoalMainViewDelegate {
    
    // MARK: - Property
    let goalMainView = GoalMainView()
    let goalMainViewModel = GoalMainViewModel()
    
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = goalMainView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = .natural90
        goalMainViewModel.loadGoal()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // 델리게이트 연결
        goalMainView.delegate = self

        // MARK: - Navigation Bar
        // 좌측 버튼 설정
        let leftBarButtonItem = CustomNavigationController.setupLeftBarButton(
            withImage: "logoSmall",
            target: self,
            action: UIAction { _ in
                if let tabBarController = self.navigationController?.tabBarController {
                    // 탭 바의 첫 번째 탭 선택
                    tabBarController.selectedIndex = 0

                    // 네비게이션 스택 초기화
                    if let navigationController = tabBarController.viewControllers?[0] as? UINavigationController {
                        navigationController.popToRootViewController(animated: false)
                    }
                }
            }
        )
        self.navigationItem.leftBarButtonItems = leftBarButtonItem

        // 우측 버튼 설정
        let rightBarButtonItem = CustomNavigationController.setupRightBarButton(
            withImage: "noti",
            target: self,
            action: UIAction { _ in
                let notificationVC = NotificationViewController()
                self.navigationController?.pushViewController(notificationVC, animated: false)
            }
        )
        self.navigationItem.rightBarButtonItems = rightBarButtonItem
    }
    
    
    // MARK: - Method
    // 더보기 버튼 액션
    func didTapMoreButton() {
        let GoalListVC = GoalListViewController()
        self.navigationController?.pushViewController(GoalListVC, animated: false)
    }    
}

