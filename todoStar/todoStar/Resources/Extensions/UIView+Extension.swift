//
//  UIView+Extension.swift
//  todoStar
//
//  Created by 김혜림 on 9/1/24.
//

import UIKit

extension UIView {
    // UIView를 UIImage로 변환
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }

    // UIView 상단에만 border 추가하기
    func addTopBorder(color: UIColor, thickness: CGFloat) {
        let borderView = UIView()
        borderView.backgroundColor = color
        borderView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(borderView)
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: self.topAnchor),
            borderView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            borderView.heightAnchor.constraint(equalToConstant: thickness)
        ])
    }

    // UIView에서 UIViewController 찾기
    func findViewController() -> UIViewController? {
        var responder: UIResponder? = self // 현재 위치 찾기(현재 있는 UIView 찾기)
        while responder != nil { // responder가 nil이 되면 반복문 종료
            if let viewController = responder as? UIViewController { // responder가 UIViewController를 찾으면 찾아낸 UIViewController 반환
                return viewController
            }
            responder = responder?.next // UIViewController 찾을 때까지 이동
        }
        return nil // UIViewController 못찾으면 nil 반환
    }
}
