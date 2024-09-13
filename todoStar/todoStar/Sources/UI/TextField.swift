//
//  TextFieldStyle.swift
//  todoStar
//
//  Created by 김혜림 on 8/29/24.
//

import UIKit

// MARK: property
let textFieldSetUpDelegate = TextFieldSetUpDelegate()

// MARK: - Custom Style
// MARK: 텍스트 필드 사이즈 조절
func textFieldConstraint(textField: UITextField, in view: UIView) {
    textField.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(textField)
    
    NSLayoutConstraint.activate([
        textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        textField.heightAnchor.constraint(equalToConstant: 60)
    ])
}


// MARK: 기본 텍스트 필드
func textFieldDefaultStyle(to textField: UITextField, placeholder: String) {
    // 텍스트 박스 스타일
    textField.layer.cornerRadius = 10
    textField.borderStyle = .none
    textField.backgroundColor = .natural90
    textField.padding(left: 20, right: 20)
    
    // 텍스트 스타일
    textField.font = .bodyRegular()
    textField.textColor = .white
    
    // placeholder 텍스트 색상 변경
    let placeholderColor: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.natural70
    ]
    textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                         attributes: placeholderColor)
    
    // delegate 연결
    textField.delegate = textFieldSetUpDelegate
}


// MARK: 팝업 텍스트 필드
func textFieldPopUpStyle(to textField: UITextField, placeholder: String) {
    // 텍스트 박스 스타일
    textField.layer.cornerRadius = 10
    textField.borderStyle = .none
    textField.backgroundColor = .natural80
    textField.padding(left: 20, right: 20)
    
    // 텍스트 스타일
    textField.font = .bodyRegular()
    textField.textColor = .white
    
    // placeholder 텍스트 색상 변경
    let placeholderColor: [NSAttributedString.Key: Any] = [
        .foregroundColor: UIColor.natural60
    ]
    textField.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                         attributes: placeholderColor)
    
    // delegate 연결
    textField.delegate = textFieldSetUpDelegate
}



// MARK: - Delegate
class TextFieldSetUpDelegate: NSObject, UITextFieldDelegate {
    // 텍스트 필드 선택 중일 때 스타일 변경
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.natural60.cgColor
        textField.layer.borderWidth = 1.0
    }
    
    // 텍스트 필드 선택 취소 시 스타일 초기화
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.clear.cgColor
        textField.layer.borderWidth = 0
    }
    
    // return 키 눌러서 키보드 내리기
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

