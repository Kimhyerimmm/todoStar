//
//  SegmentedControlStyle.swift
//  todoStar
//
//  Created by 김혜림 on 8/31/24.
//

import UIKit

class SegmentedControlStyle: UISegmentedControl {
    private let segmentInset: CGFloat = 3
    private let segmentImage: UIImage? = UIImage(color: UIColor.primary100)
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        layer.cornerRadius = bounds.height / 2
        
        let foregroundIndex = numberOfSegments
        if subviews.indices.contains(foregroundIndex), let foregroundImageView = subviews[foregroundIndex] as? UIImageView {
            foregroundImageView.bounds = foregroundImageView.bounds.insetBy(dx: segmentInset, dy: segmentInset)
            foregroundImageView.image = segmentImage
            foregroundImageView.layer.removeAnimation(forKey: "SelectionBounds")
            foregroundImageView.layer.masksToBounds = true
            foregroundImageView.layer.cornerRadius = bounds.height / 2
        }
    }
}

func segmentedContolCreated(to segmentedControl: UISegmentedControl, items: [String], in view: UIView) {
    // 인덱스 추가
    for (index, item) in items.enumerated() {
        segmentedControl.insertSegment(withTitle: item, at: index, animated: false)
    }
    
    // 기본 선택 상태
    segmentedControl.selectedSegmentIndex = 0
    
    // 커스텀 스타일
    segmentedControl.setTitleTextAttributes([
        NSAttributedString.Key.font: UIFont.bodyRegular(),
        NSAttributedString.Key.foregroundColor: UIColor.natural40
    ], for: .normal)
    
    segmentedControl.setTitleTextAttributes([
        NSAttributedString.Key.font: UIFont.bodyMedium(),
        NSAttributedString.Key.foregroundColor: UIColor.white
    ], for: .selected)
    
    segmentedControl.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(segmentedControl)
    
    segmentedControl.backgroundColor = .natural80
    
    NSLayoutConstraint.activate([
        segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
        segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        segmentedControl.heightAnchor.constraint(equalToConstant: 60)
    ])
    
}
