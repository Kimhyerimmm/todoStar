//
//  TabBarControllerStyle.swift
//  todoStar
//
//  Created by 김혜림 on 9/8/24.
//

import UIKit

class CustomTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if let navController = viewController as? UINavigationController {
            // 네비게이션 스택을 루트 뷰컨트롤러로 pop
            navController.popToRootViewController(animated: false)
        }
        return true
    }

    static func tabBarControllerCreate(VC: [UIViewController]) -> CustomTabBarController {
        let tabBarController = CustomTabBarController()
        tabBarController.viewControllers = VC

        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.backgroundColor = .natural100

        tabBarController.tabBar.unselectedItemTintColor = .natural70
        tabBarController.tabBar.tintColor = .white
        tabBarController.tabBar.backgroundColor = .natural100
        tabBarController.tabBar.standardAppearance = tabBarAppearance

        if #available(iOS 15.0, *) {
            tabBarController.tabBar.scrollEdgeAppearance = tabBarAppearance
        }

        return tabBarController
    }

    static func tabBarHeightControllView() -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.natural100
        view.addTopBorder(color: UIColor.natural80, thickness: 1)

        return view
    }
}
