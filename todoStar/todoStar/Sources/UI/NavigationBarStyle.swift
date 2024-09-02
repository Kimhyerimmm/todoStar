//
//  NavigationBarStyle.swift
//  todoStar
//
//  Created by 김혜림 on 9/2/24.
//

import UIKit

class CustomNavigationBar {

    static func setupLeftBarButton(withImage imageName: String, target: Any, action: Selector) -> UIBarButtonItem {
        let logoButton = UIButton(type: .custom)
        logoButton.setImage(UIImage(named: imageName), for: .normal)
        logoButton.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: logoButton)
    }
    
    static func setupRightBarButton(withImage imageName: String, target: Any, action: Selector) -> UIBarButtonItem {
        let notificationButton = UIButton(type: .custom)
        notificationButton.setImage(UIImage(named: imageName), for: .normal)
        notificationButton.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: notificationButton)
    }
}
