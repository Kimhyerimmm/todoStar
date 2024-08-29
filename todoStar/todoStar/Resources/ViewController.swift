//
//  ViewController.swift
//  todoStar
//
//  Created by 김혜림 on 8/28/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpKeybordDismiss()
        
        let textField = UITextField()
        textFieldDefaultStyle(to: textField, placeholder: "입력해주세요.")
        textFieldConstraint(textField: textField, in: view)
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textField)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.topAnchor, constant: 100)
        ])
    }
}

