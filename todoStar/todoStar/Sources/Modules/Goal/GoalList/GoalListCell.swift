//
//  GoalListCell.swift
//  todoStar
//
//  Created by 김혜림 on 9/6/24.
//

import UIKit

class GoalListCell: UICollectionViewCell {

    // MARK: - Property
    static let identifier = "goalListCell"


    // MARK: - Life Cycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollection()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCollection()
    }
    

    // MARK: - Setup Method
    func setupCollection() {
        // TODO: 뷰 붙이고 위치 잡기
    }

    // MARK: - Method
    // 셀 스타일
    func style() {
        // TODO: 셀 스타일
    }

    // 셀 내용
    func model() {
        // TODO: 셀에 넣을 내용 어디서 받아올 건지
    }
}
