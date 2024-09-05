//
//  UIView+Extension.swift
//  todoStar
//
//  Created by 김혜림 on 9/1/24.
//

import UIKit

// UIView를 UIImage로 변환
extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

// UIView 상단에만 border 추가하기
extension UIView {
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
}
