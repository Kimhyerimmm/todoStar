//
//  CurrentGoalListCellStyle.swift
//  todoStar
//
//  Created by 김혜림 on 9/3/24.
//

import UIKit

class CurrentGoalListCell: UICollectionViewCell {
    static let identifier = "currentGoalListCell"
    
    private let currentSmallGoal = UILabel()
    private let currentMiddleGoal = UIView()
    private let currentGoalImportance = UIView()
    private let currentGoalPeriod = UIView()
    private let goalCompleted = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpCollectionView()
        cellStyle()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setUpCollectionView()
        cellStyle()
    }
    
    func setUpCollectionView() {
        contentView.addSubview(currentSmallGoal)
        contentView.addSubview(currentMiddleGoal)
        contentView.addSubview(currentGoalImportance)
        contentView.addSubview(currentGoalPeriod)
        contentView.addSubview(goalCompleted)
        
        currentSmallGoal.translatesAutoresizingMaskIntoConstraints = false
        currentMiddleGoal.translatesAutoresizingMaskIntoConstraints = false
        currentGoalImportance.translatesAutoresizingMaskIntoConstraints = false
        currentGoalPeriod.translatesAutoresizingMaskIntoConstraints = false
        goalCompleted.translatesAutoresizingMaskIntoConstraints = false
        
        // 오토 레이아웃(currentSmallGoal)
        NSLayoutConstraint.activate([
            currentSmallGoal.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            currentSmallGoal.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentSmallGoal.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            currentSmallGoal.heightAnchor.constraint(equalToConstant: 26)
        ])
        
        // 오토 레이아웃(currentMiddleGoal)
        NSLayoutConstraint.activate([
            currentMiddleGoal.topAnchor.constraint(equalTo: currentSmallGoal.bottomAnchor, constant: 16),
            currentMiddleGoal.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentMiddleGoal.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            currentMiddleGoal.heightAnchor.constraint(equalToConstant: 37)
        ])
        
        // 오토 레이아웃(currentGoalImportance)
        NSLayoutConstraint.activate([
            currentGoalImportance.topAnchor.constraint(equalTo: currentMiddleGoal.bottomAnchor, constant: 20),
            currentGoalImportance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentGoalImportance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            currentGoalImportance.heightAnchor.constraint(equalToConstant: 37)
        ])
        
        // 오토 레이아웃(currentGoalPeriod)
        NSLayoutConstraint.activate([
            currentGoalPeriod.topAnchor.constraint(equalTo: currentGoalImportance.bottomAnchor, constant: 20),
            currentGoalPeriod.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentGoalPeriod.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            currentGoalPeriod.heightAnchor.constraint(equalToConstant: 37)
        ])
        
        // 오토 레이아웃(goalCompleted)
        NSLayoutConstraint.activate([
            goalCompleted.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            goalCompleted.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
    // MARK: 컬렉션 셀 스타일
    // 셀 스타일
    func cellStyle() {
        // TODO: 조건부로 바꾸기(완료 버튼 누르면 바뀌게)
        contentView.backgroundColor = .primary100
        contentView.layer.cornerRadius = 10
    }
    
    // 셀 내부 정보
    // 스타일 정리 및 내용 추가
    func model(with model: CurrentGoalModel) {
        configureLabel(currentSmallGoal, text: model.smallGoal, font: .subtitleMedium(), textColor: .white)
        
        configureSection(in: currentMiddleGoal,
                         subText: "진행 중간 목표",
                         mainText: model.middleGoal,
                         mainFont: .bodySmallMedium(),
                         subFont: .captionSmallRegular())
        
        configureSection(in: currentGoalImportance,
                         subText: "중요도",
                         mainText: model.importance,
                         mainFont: .bodySmallMedium(),
                         subFont: .captionSmallRegular())
        
        configureSection(in: currentGoalPeriod,
                         subText: "진행도",
                         mainText: "\(model.goalStatus) / \(model.goalPeriod)",
                         mainFont: .bodySmallMedium(),
                         subFont: .captionSmallRegular())
        
        configureButton(goalCompleted, title: "완료", in: contentView)
    }
    
    // 타이틀(smallGoal) 스타일
    private func configureLabel(_ label: UILabel, text: String?, font: UIFont, textColor: UIColor) {
        label.text = text
        label.font = font
        label.textColor = textColor
        label.lineBreakMode = .byTruncatingTail
    }
    
    // 내용(middleGoal, importance, period) 스타일
    private func configureSection(in container: UIView, subText: String, mainText: String, mainFont: UIFont, subFont: UIFont) {
        let subLabel = createLabel(text: subText, font: subFont, textColor: .primary20)
        let mainLabel = createLabel(text: mainText, font: mainFont, textColor: .primary10)
        
        container.addSubview(subLabel)
        container.addSubview(mainLabel)
        
        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalTo: container.topAnchor),
            subLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            
            mainLabel.topAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 4),
            mainLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor)
        ])
    }
    
    private func createLabel(text: String, font: UIFont, textColor: UIColor) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = font
        label.textColor = textColor
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    private func configureButton(_ button: UIButton, title: String, in view: UIView) {
        button.configuration = buttonWhiteStyle(title: title)
        button.isUserInteractionEnabled = true
        buttonConstraint(button: button, in: view)
    }
}
