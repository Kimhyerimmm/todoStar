//
//  StorageMainViewController.swift
//  todoStar
//
//  Created by 김혜림 on 9/1/24.
//

import UIKit

class StorageMainViewController: UIViewController {

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
