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
        // MARK: - 네비게이션 바
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
    
}
