//
//  GoalListViewController.swift
//  todoStar
//
//  Created by 김혜림 on 9/4/24.
//

import UIKit

class GoalListViewController: UIViewController {

    // MARK: - Property
    let goalListView = GoalListView()
    let goalListViewModel = GoalListViewModel()


    // MARK: - Lifecycle
    override func loadView() {
        self.view = goalListView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // MARK: - Navigation Bar
        // 우측 버튼 설정
        let rightBarButtonItem = CustomNavigationController.setupRightBarButton(
            withImage: "cancle",
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
        self.navigationItem.rightBarButtonItems = rightBarButtonItem
    }

    // MARK: - Method


    // MARK: - Data Source


    // MARK: - Delegate

}
