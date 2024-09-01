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
        // CustomSegmentedControl 인스턴스 생성
        let segmentedControl = SegmentedControlStyle(items: ["테스트 1", "테스트 2"])

        
        // 기본 선택 상태 설정
        segmentedControl.selectedSegmentIndex = 0
        
        // 액션 추가
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)
        
        // 뷰에 추가
        view.addSubview(segmentedControl)
    }
    
    @objc func segmentChanged(_ sender: SegmentedControlStyle) {
        print("Selected segment index: \(sender.selectedSegmentIndex)")
    }
    
}

