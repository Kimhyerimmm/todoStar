//
//  UILabel+Extension.swift
//  todoStar
//
//  Created by 김혜림 on 8/28/24.
//

import UIKit

extension UILabel {
    // MARK: 자간 조절
    func addCharacterSpacing(_ value: Double = -0.03) {
        let kernValue = self.font.pointSize * CGFloat(value)
        guard let text = text, !text.isEmpty else { return }
        let string = NSMutableAttributedString(string: text)
        string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
        attributedText = string
    }
    
    // MARK: 타이틀
    func titleBold() {
        self.font = UIFont(name: "S-CoreDream-6Bold", size: 26)
        self.addCharacterSpacing()
    }
    
    func titleMedium() {
        self.font = UIFont(name: "S-CoreDream-5Medium", size: 26)
        self.addCharacterSpacing()
    }
    
    // MARK: 서브 타이틀
    func subtitleBold() {
        self.font = UIFont(name: "S-CoreDream-6Bold", size: 22)
        self.addCharacterSpacing()
    }
    
    func subtitleMedium() {
        self.font = UIFont(name: "S-CoreDream-5Medium", size: 22)
        self.addCharacterSpacing()
    }
    
    // MARK: 바디
    func bodyMedium() {
        self.font = UIFont(name: "S-CoreDream-5Medium", size: 18)
        self.addCharacterSpacing()
    }
    
    func bodyRegular() {
        self.font = UIFont(name: "S-CoreDream-4Regular", size: 18)
        self.addCharacterSpacing()
    }
    
    func bodySmallMedium() {
        self.font = UIFont(name: "S-CoreDream-5Medium", size: 16)
        self.addCharacterSpacing()
    }
    
    func bodySmallRegular() {
        self.font = UIFont(name: "S-CoreDream-4Regular", size: 16)
        self.addCharacterSpacing()
    }
    
    // MARK: 캡션
    func captionRegular() {
        self.font = UIFont(name: "S-CoreDream-4Regular", size: 14)
        self.addCharacterSpacing()
    }
    
    func captionLight() {
        self.font = UIFont(name: "S-CoreDream-3Light", size: 14)
        self.addCharacterSpacing()
    }
    
    func captionSmallRegular() {
        self.font = UIFont(name: "S-CoreDream-4Regular", size: 12)
        self.addCharacterSpacing()
    }
    
    func captionSmallLight() {
        self.font = UIFont(name: "S-CoreDream-3Light", size: 12)
        self.addCharacterSpacing()
    }
    
}
