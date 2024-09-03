//
//  GoalMainViewController.swift
//  todoStar
//
//  Created by 김혜림 on 8/28/24.
//

import UIKit

class GoalMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - property
    let goalMainView = GoalMainView()
    let goalMainViewModel = GoalMainViewModel()
    
    let dbController = DBController.shared
    let testOption = ["테스트입니당", "테스트입니당", "테스트입니당"]
    
    
    // MARK: - Lifecycle
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
        
        // MARK: - 뷰 추가
        view.addSubview(goalMainView)
        goalMainView.frame = view.bounds
        
        // 테이블뷰 연결
        goalMainView.dailyTodoList().dataSource = self
        goalMainView.dailyTodoList().delegate = self
        goalMainView.dailyTodoList().register(UITableViewCell.self, forCellReuseIdentifier: "cell")
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
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return testOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = testOption[indexPath.row]
        cell.backgroundColor = .white
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
    
    // MARK: - Delegate
    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected item: \(testOption[indexPath.row])")
    }
}

