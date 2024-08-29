//
//  UIFont+Extension.swift
//  todoStar
//
//  Created by 김혜림 on 8/29/24.
//

import UIKit

extension UIFont {
    // MARK: title
    static func titleBold() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-6Bold", size: 26) ?? UIFont.systemFont(ofSize: 26)
        
        return fontStyle
    }
    
    static func titleMedium() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-5Medium", size: 26) ?? UIFont.systemFont(ofSize: 26)
        
        return fontStyle
    }
    
    static func subtitleBold() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-6Bold", size: 22) ?? UIFont.systemFont(ofSize: 22)
        
        return fontStyle
    }
    
    static func subtitleMedium() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-5Medium", size: 22) ?? UIFont.systemFont(ofSize: 22)
        
        return fontStyle
    }
    
    // MARK: body
    static func bodyMedium() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-5Medium", size: 18) ?? UIFont.systemFont(ofSize: 18)
        
        return fontStyle
    }
    
    static func bodyRegular() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-4Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)
        
        return fontStyle
    }
    
    static func bodySmallMedium() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-5Medium", size: 16) ?? UIFont.systemFont(ofSize: 18)
        
        return fontStyle
    }
    
    static func bodySmallRegular() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-4Regular", size: 16) ?? UIFont.systemFont(ofSize: 18)
        
        return fontStyle
    }
    
    // MARK: caption
    static func captionRegular() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-4Regular", size: 14) ?? UIFont.systemFont(ofSize: 14)
        
        return fontStyle
    }
    
    static func captionLight() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-3Light", size: 14) ?? UIFont.systemFont(ofSize: 14)
        
        return fontStyle
    }
    
    static func captionSmallRegular() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-4Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)
        
        return fontStyle
    }
    
    static func captionSmallLight() -> UIFont {
        let fontStyle = UIFont(name: "S-CoreDream-3Light", size: 12) ?? UIFont.systemFont(ofSize: 12)
        
        return fontStyle
    }
}
