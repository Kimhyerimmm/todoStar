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
        let options = ["테스트입니다 1", "테스트입니다 2", "테스트입니다 3"]
        let dropDown = DropDownMenu(options: options) { selectOption in
            print("select option: \(selectOption)")
        }
        
        view.addSubview(dropDown)
        dropDown.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            dropDown.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            dropDown.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            dropDown.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            dropDown.heightAnchor.constraint(equalToConstant: 180)
        ])
    }
}

