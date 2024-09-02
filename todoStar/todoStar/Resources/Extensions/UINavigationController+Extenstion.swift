//
//  UINavigationController+Extenstion.swift
//  todoStar
//
//  Created by 김혜림 on 9/2/24.
//

import UIKit

extension UINavigationController {

    func setCustomNavigationBar(leftImage: String, leftAction: Selector, rightImage: String, rightAction: Selector, target: Any) {
        if let viewController = self.topViewController {
            viewController.navigationItem.leftBarButtonItem = CustomNavigationBar.setupLeftBarButton(
                withImage: leftImage,
                target: target,
                action: leftAction
            )
            
            viewController.navigationItem.rightBarButtonItem = CustomNavigationBar.setupRightBarButton(
                withImage: rightImage,
                target: target,
                action: rightAction
            )
        }
    }
}
