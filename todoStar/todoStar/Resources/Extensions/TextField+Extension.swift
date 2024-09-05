//
//  TextField+Extension.swift
//  todoStar
//
//  Created by 김혜림 on 8/29/24.
//

import UIKit

extension UITextField {
    // 텍스트 필드 여백
    func padding(left: CGFloat, right: CGFloat) {
        let leftPadding = UIView(frame: CGRect(x: 0, y: 0, width: left, height: self.frame.height))
        let rightPadding = UIView(frame: CGRect(x: 0, y: 0, width: right, height: self.frame.height))
        
        self.leftView = leftPadding
        self.leftViewMode = .always
        self.rightView = rightPadding
        self.rightViewMode = .always
    }
}
