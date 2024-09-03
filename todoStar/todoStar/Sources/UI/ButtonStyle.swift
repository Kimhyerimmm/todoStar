//
//  Buttons.swift
//  todoStar
//
//  Created by 김혜림 on 8/28/24.
//

import UIKit

// MARK: 버튼 사이즈 조절
func buttonConstraint(button: UIButton, in view: UIView, height: CGFloat = 60) {
    button.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(button)
    
    NSLayoutConstraint.activate([
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
        button.heightAnchor.constraint(equalToConstant: height)
    ])
}


// MARK: 액션 버튼 스타일
func buttonActivationDefaultStyle(title: String) -> UIButton.Configuration {
    // 기본 스타일
    var config = UIButton.Configuration.filled()
    config.title = title
    config.baseBackgroundColor = UIColor.natural80
    config.baseForegroundColor = UIColor.white
    config.cornerStyle = .capsule
    
    // 폰트 스타일
    var titleStyle = AttributedString(title)
    titleStyle.font = .bodyMedium()
    config.attributedTitle = titleStyle
    
    return config
}

func buttonDeactivationDefaultStyle(title: String) -> UIButton.Configuration {
    // 기본 스타일
    var config = UIButton.Configuration.filled()
    config.title = title
    config.baseBackgroundColor = UIColor.natural80
    config.baseForegroundColor = UIColor.natural50
    config.cornerStyle = .capsule
    
    // 폰트 스타일
    var titleStyle = AttributedString(title)
    titleStyle.font = .bodyRegular()
    config.attributedTitle = titleStyle
    
    return config
}

// MARK: 강조 액션 버튼 스타일
func buttonPrimaryStyle(title: String) -> UIButton.Configuration {
    // 기본 스타일
    var config = UIButton.Configuration.filled()
    config.title = title
    config.baseBackgroundColor = UIColor.primary100
    config.baseForegroundColor = UIColor.white
    config.cornerStyle = .capsule
    
    // 폰트 스타일
    var titleStyle = AttributedString(title)
    titleStyle.font = .bodyMedium()
    config.attributedTitle = titleStyle
    
    return config
}

func buttonWhiteStyle(title: String) -> UIButton.Configuration {
    // 기본 스타일
    var config = UIButton.Configuration.filled()
    config.title = title
    config.baseBackgroundColor = UIColor.white
    config.baseForegroundColor = UIColor.primary100
    config.cornerStyle = .capsule
    
    // 폰트 스타일
    var titleStyle = AttributedString(title)
    titleStyle.font = .bodyMedium()
    config.attributedTitle = titleStyle
    
    return config
}

// MARK: 셀렉트 버튼 스타일
func selectButtonActivationStyle(title: String) -> UIButton.Configuration {
    // 기본 스타일
    var config = UIButton.Configuration.filled()
    config.title = title
    config.baseBackgroundColor = UIColor.primary100
    config.baseForegroundColor = UIColor.white
    config.background.cornerRadius = 10
    
    // 폰트 스타일
    var titleStyle = AttributedString(title)
    titleStyle.font = .bodyMedium()
    config.attributedTitle = titleStyle
    
    return config
}

func selectButtonDeactivationStyle(title: String) -> UIButton.Configuration {
    // 기본 스타일
    var config = UIButton.Configuration.filled()
    config.title = title
    config.baseBackgroundColor = UIColor.natural90
    config.baseForegroundColor = UIColor.natural40
    config.background.cornerRadius = 10
    
    // 폰트 스타일
    var titleStyle = AttributedString(title)
    titleStyle.font = .bodyRegular()
    config.attributedTitle = titleStyle

    
    return config
}

func selectButtonBigActivationStyle(title: String, subtitle: String) -> UIButton.Configuration {
    // 기본 스타일
    var config = UIButton.Configuration.filled()
    config.title = title
    config.subtitle = subtitle
    config.baseBackgroundColor = UIColor.primary100
    config.baseForegroundColor = UIColor.white
    config.background.cornerRadius = 10
    config.titleAlignment = .center
    config.titlePadding = 3
    
    // 폰트 스타일
    var titleStyle = AttributedString(title)
    _ = AttributeContainer([
        .font: UIFont.captionLight(),
        .foregroundColor: UIColor.primary20
    ])
    titleStyle.font = .bodyMedium()
    config.attributedTitle = titleStyle

    
    return config
}

func selectButtonBigDeactivationStyle(title: String, subtitle: String) -> UIButton.Configuration {
    // 기본 스타일
    var config = UIButton.Configuration.filled()
    config.title = title
    config.subtitle = subtitle
    config.baseBackgroundColor = UIColor.natural90
    config.baseForegroundColor = UIColor.natural40
    config.background.cornerRadius = 10
    config.titleAlignment = .center
    config.titlePadding = 3
    
    // 폰트 스타일
    var titleStyle = AttributedString(title)
    _ = AttributeContainer([
        .font: UIFont.captionLight(),
        .foregroundColor: UIColor.natural60
    ])
    titleStyle.font = .bodyRegular()
    config.attributedTitle = titleStyle

    
    return config
}

func textButtonStyle(title: String) -> UIButton.Configuration {
    var config = UIButton.Configuration.plain()
    config.title = title
    config.baseForegroundColor = .natural40
    
    // 폰트 스타일
    var titleStyle = AttributedString(title)
    titleStyle.font = .bodySmallRegular()
    config.attributedTitle = titleStyle
    
    return config
}
