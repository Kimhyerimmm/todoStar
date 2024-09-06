//
//  GoalListViewController.swift
//  todoStar
//
//  Created by 김혜림 on 9/4/24.
//

import UIKit

class GoalListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        // 타이틀 설정
        let navigationTitle = CustomNavigationController.navigationTitle(title: "목표 리스트")
        self.navigationItem.titleView = navigationTitle.titleView
        
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }


    // MARK: - Delegate

}
