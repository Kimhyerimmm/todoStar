//
//  SettingMainViewController.swift
//  todoStar
//
//  Created by 김혜림 on 9/1/24.
//

import UIKit

class SettingMainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let notiView = UIView()
        
        let text = UILabel()
        text.text = "설정 페이지 공사 중 입니다!"
        text.font = .titleMedium()
        text.textColor = .white
        
        let imageView = UIImageView()
        let image = UIImage(named: "construction")
        imageView.image = image
        
        notiView.translatesAutoresizingMaskIntoConstraints = false
        text.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(notiView)
        notiView.addSubview(imageView)
        notiView.addSubview(text)
        
        NSLayoutConstraint.activate([
            notiView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            notiView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            notiView.widthAnchor.constraint(equalToConstant: 200),
            notiView.heightAnchor.constraint(equalToConstant: 400),
            
            imageView.topAnchor.constraint(equalTo: notiView.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            text.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            text.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
    
    // MARK: - method
}
