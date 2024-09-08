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

    private let progressStatus = UIView()
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

        progressStatus.translatesAutoresizingMaskIntoConstraints = false
        lastGoal.translatesAutoresizingMaskIntoConstraints = false
        goalStatus.translatesAutoresizingMaskIntoConstraints = false

        // 오토 레이아웃(progressStatus)
        NSLayoutConstraint.activate([
            progressStatus.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            progressStatus.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            progressStatus.widthAnchor.constraint(equalToConstant: 58),
            progressStatus.heightAnchor.constraint(equalToConstant: 24)
        ])

        // 오토 레이아웃(lastGoal)
        NSLayoutConstraint.activate([
            lastGoal.topAnchor.constraint(equalTo: progressStatus.bottomAnchor, constant: 10),
            lastGoal.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            lastGoal.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])

        // 오토 레이아웃(goalStatus)
        NSLayoutConstraint.activate([
            goalStatus.topAnchor.constraint(equalTo: lastGoal.bottomAnchor, constant: 10),
            goalStatus.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            goalStatus.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20)
        ])
    }

    // MARK: - Method
    // 셀 스타일
    func cellStyle() {
        contentView.backgroundColor = .natural90
        contentView.layer.cornerRadius = 10
    }

    // 셀 내용
    func model(with model: GoalListModel) {
        progressStatusCreate(status: model.progressStatus)
        lastGoalCreate(text: model.lastGoal)
        goalStatusCreate(text: "중간 목표: \(model.middleGoalCount)   |   진행도: \(model.middleGoalCompletion)/\(model.middleGoalCount)")
    }

    func progressStatusCreate(status: Bool) {
        let label = UILabel()
        label.font = .captionSmallRegular()

        if status == true {
            label.textColor = .white
            label.text = "진행 중"
            progressStatus.backgroundColor = .primary100
        } else {
            label.textColor = .natural40
            label.text = "대기 중"
            progressStatus.backgroundColor = .natural80
        }

        progressStatus.layer.cornerRadius = 12
        progressStatus.addSubview(label)

        label.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: progressStatus.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: progressStatus.centerYAnchor, constant: 1)
        ])

    }

    func lastGoalCreate(text: String) {
        lastGoal.font = .bodyRegular()
        lastGoal.text = text
        lastGoal.textColor = .white
        lastGoal.lineBreakMode = .byTruncatingTail
    }

    func goalStatusCreate(text: String) {
        goalStatus.font = .captionLight()
        goalStatus.text = text
        goalStatus.textColor = .natural60
    }
}
