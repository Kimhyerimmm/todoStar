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

    private let progressStatus = UILabel()
    private let lastGoal = UILabel()
    private let goalStatus = UILabel()


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
        cellStyle()
        
        contentView.addSubview(progressStatus)
        contentView.addSubview(lastGoal)
        contentView.addSubview(goalStatus)
    }

    // MARK: - Method
    // 셀 스타일
    func cellStyle() {
        contentView.backgroundColor = .natural90
        contentView.layer.cornerRadius = 10
    }

    // 셀 내용
    func model(with model: GoalListModel) {
        // TODO: 셀에 넣을 내용 어디서 받아올 건지
    }
}
