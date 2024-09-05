//
//  UINavigationController+Extenstion.swift
//  todoStar
//
//  Created by 김혜림 on 9/2/24.
//

import UIKit

extension UINavigationController {

    func setCustomNavigationBar(leftImage: String, leftAction: UIAction, rightImage: String, rightAction: UIAction, target: Any) {
        if let viewController = self.topViewController {
            let leftBarButtonItems = CustomNavigationController.setupLeftBarButton(
                withImage: leftImage,
                target: target,
                action: leftAction
            )
            viewController.navigationItem.leftBarButtonItems = leftBarButtonItems

            let rightBarButtonItems = CustomNavigationController.setupLeftBarButton(
                withImage: leftImage,
                target: target,
                action: leftAction
            )
            viewController.navigationItem.rightBarButtonItems = rightBarButtonItems
        }
    }
}
