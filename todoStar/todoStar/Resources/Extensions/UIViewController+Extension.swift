//
//  UIViewController+Extension.swift
//  todoStar
//
//  Created by 김혜림 on 8/29/24.
//

import UIKit

extension UIViewController {
    func setUpKeybordDismiss() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(keybordDismiss))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func keybordDismiss() {
        view.endEditing(true)
    }
}
