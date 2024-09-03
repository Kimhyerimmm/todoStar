//
//  StorageMainViewController.swift
//  todoStar
//
//  Created by 김혜림 on 9/1/24.
//

import UIKit

class StorageMainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let testOption = ["테스트입니당", "테스트입니당", "테스트입니당"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let test = dailyTodoList()
        view.addSubview(test)
        test.translatesAutoresizingMaskIntoConstraints = false
        
        // 테이블뷰 연결
        test.dataSource = self
        test.delegate = self
        test.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        
        NSLayoutConstraint.activate([
            test.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            test.widthAnchor.constraint(equalToConstant: 200),
            test.heightAnchor.constraint(equalToConstant: 400),
            
        ])
        
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
        
        
        let notiView = UIView()

        let text = UILabel()
        text.text = "보관함 페이지 공사 중 입니다!"
        text.font = .titleMedium()
        text.textColor = .white
        
        let imageView = UIImageView()
        let image = UIImage(named: "construction")
        imageView.image = image
        
        notiView.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notiView)
        notiView.addSubview(imageView)
        notiView.addSubview(text)
        
        NSLayoutConstraint.activate([
            notiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            notiView.widthAnchor.constraint(equalToConstant: 200),
            notiView.heightAnchor.constraint(equalToConstant: 400),
            
            imageView.topAnchor.constraint(equalTo: notiView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            text.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    func dailyTodoList() -> UITableView {
        let tableView = UITableView()
        
        tableView.backgroundColor = .blue
        
        return tableView
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
