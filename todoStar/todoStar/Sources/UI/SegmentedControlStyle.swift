//
//  SegmentedControlStyle.swift
//  todoStar
//
//  Created by 김혜림 on 8/31/24.
//

import UIKit

class SegmentedControlStyle: UISegmentedControl {
    private let segmentInset: CGFloat = 5
    private let segmentImage: UIImage = UIImage(color: UIColor.primary100) ?? UIImage(color: UIColor.primary100)!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
        
        // 선택된 인덱스 찾기
        let foregroundIndex = numberOfSegments
        
        // 색상, 애니메이션 삭제, 버튼 디자인
        if subviews.indices.contains(foregroundIndex),let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
            
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            foregroundImageView.image = segmentImage
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = foregroundImageView.bounds.height / 2
            selectedSegmentIndex = 0
        }
        
        // 폰트 설정
        for segment in subviews {
            if let label = segment as? UILabel {
                label.font = UIFont.bodyMedium()
            }
        }
    }
}

func segmentedButton() -> UISegmentedControl {
    let segmented = UISegmentedControl()
    segmented.setTitleTextAttributes([
        NSAttributedString.Key.font: UIFont.bodyMedium()
    ], for: .normal)
    
    return segmented
}
