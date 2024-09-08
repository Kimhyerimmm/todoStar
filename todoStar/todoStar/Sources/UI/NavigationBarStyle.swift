//
//  NavigationBarStyle.swift
//  todoStar
//
//  Created by 김혜림 on 9/2/24.
//

import UIKit

class CustomNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: animated)
        // 백 버튼 커스터마이즈
        if viewControllers.count > 1 {
            let backButton = UIButton(type: .custom)
            backButton.setTitle("", for: .normal)
            backButton.setImage(UIImage(named: "back"), for: .normal)
            backButton.addAction(UIAction { _ in
                self.popViewController(animated: false)
            }, for: .touchUpInside)

            let backBarButtonItem = UIBarButtonItem(customView: backButton)
            let spaceItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
            spaceItem.width = 16 // 여백 조정

            viewController.navigationItem.leftBarButtonItems = [spaceItem, backBarButtonItem]
        }
    }

    static func setupLeftBarButton(withImage imageName: String, target: Any, action: UIAction) -> [UIBarButtonItem] {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addAction(action, for: .touchUpInside)

        let buttonItem = UIBarButtonItem(customView: button)
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spaceItem.width = 16

        return [spaceItem, buttonItem]
    }

    static func setupRightBarButton(withImage imageName: String, target: Any, action: UIAction) -> [UIBarButtonItem] {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.addAction(action, for: .touchUpInside)

        let buttonItem = UIBarButtonItem(customView: button)
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: nil, action: nil)
        spaceItem.width = 16

        return [spaceItem, buttonItem]
    }

    static func navigationTitle(title: String) -> UINavigationItem {
        let navigationItem = UINavigationItem()
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = .bodyRegular()
        titleLabel.textColor = .white

        navigationItem.titleView = titleLabel

        return navigationItem
    }

    static func navigationControllerCreate(rootVC: UIViewController, image: UIImage, tag: Int) -> UINavigationController {
        let NV = CustomNavigationController(rootViewController: rootVC)
        NV.tabBarItem = UITabBarItem(title: "", image: image, tag: tag)

        return NV
    }
}
