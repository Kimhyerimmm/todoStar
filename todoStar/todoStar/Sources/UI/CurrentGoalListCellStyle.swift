//
//  CurrentGoalListCellStyle.swift
//  todoStar
//
//  Created by 김혜림 on 9/3/24.
//

import UIKit

class CurrentGoalListCellStyle: UICollectionViewCell {
    static let identifier = "goalListCell"
    private let shareData = ShareData.shared
    
    private let currentSmallGoal = UILabel()
    private let currentMiddleGoal = UIStackView()
    private let currentGoalImportance = UIStackView()
    private let currentGoalPeriod = UIStackView()
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
            currentSmallGoal.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        // 오토 레이아웃(currentMiddleGoal)
        NSLayoutConstraint.activate([
            currentMiddleGoal.topAnchor.constraint(equalTo: currentSmallGoal.bottomAnchor, constant: 16),
            currentMiddleGoal.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentMiddleGoal.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            currentMiddleGoal.heightAnchor.constraint(equalToConstant: 56)
        ])
        
        // 오토 레이아웃(currentGoalImportance)
        NSLayoutConstraint.activate([
            currentGoalImportance.topAnchor.constraint(equalTo: currentMiddleGoal.bottomAnchor, constant: 20),
            currentGoalImportance.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentGoalImportance.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        // 오토 레이아웃(currentGoalPeriod)
        NSLayoutConstraint.activate([
            currentGoalPeriod.topAnchor.constraint(equalTo: currentGoalImportance.bottomAnchor, constant: 20),
            currentGoalPeriod.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            currentGoalPeriod.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20)
        ])
        
        // 오토 레이아웃(goalCompleted)
        NSLayoutConstraint.activate([
            goalCompleted.topAnchor.constraint(equalTo: currentGoalPeriod.bottomAnchor, constant: 20),
            goalCompleted.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20)
        ])
    }
    
    func cellStyle() {
        // TODO: 조건부로 바꾸기(완료 버튼 누르면 바뀌게)
        contentView.backgroundColor = .primary100
        contentView.layer.cornerRadius = 10
    }
    
    func config(with model: CurrentGoalModel) {
        // currentSmallGoal
        currentSmallGoal.text = model.smallGoal
        currentSmallGoal.font = .subtitleMedium()
        currentSmallGoal.textColor = .white
        currentSmallGoal.lineBreakMode = .byCharWrapping
        currentSmallGoal.numberOfLines = 2
        currentSmallGoal.setLineSpacing(spacing: 5.0)
        
        // currentMiddleGoal
        let currentMiddleGoalSubText = UILabel()
        currentMiddleGoalSubText.text = "진행 중간 목표"
        currentMiddleGoalSubText.font = .captionSmallRegular()
        currentMiddleGoalSubText.textColor = .primary20
        
        let currentMiddleGoalMainText = UILabel()
        currentMiddleGoalMainText.text = model.middleGoal
        currentMiddleGoalMainText.font = .bodySmallMedium()
        currentMiddleGoalMainText.textColor = .primary10
        currentMiddleGoalMainText.lineBreakMode = .byTruncatingTail
        
        currentMiddleGoal.axis = .vertical
        currentMiddleGoal.alignment = .leading
        currentMiddleGoal.spacing = 4
        currentMiddleGoal.addArrangedSubview(currentMiddleGoalSubText)
        currentMiddleGoal.addArrangedSubview(currentMiddleGoalMainText)
        
        // currentGoalImportance
        let currentGoalImportanceSubText = UILabel()
        currentGoalImportanceSubText.text = "중요도"
        currentGoalImportanceSubText.font = .captionSmallRegular()
        currentGoalImportanceSubText.textColor = .primary20
        
        let currentGoalImportanceMainText = UILabel()
        currentGoalImportanceMainText.text = model.importance
        currentGoalImportanceMainText.font = .bodySmallMedium()
        currentGoalImportanceMainText.textColor = .primary10
        currentGoalImportanceMainText.lineBreakMode = .byTruncatingTail
        
        currentGoalImportance.axis = .vertical
        currentGoalImportance.alignment = .leading
        currentGoalImportance.spacing = 4
        currentGoalImportance.addArrangedSubview(currentGoalImportanceSubText)
        currentGoalImportance.addArrangedSubview(currentGoalImportanceMainText)
        
        // currentGoalPeriod
        let currentGoalPeriodSubText = UILabel()
        currentGoalPeriodSubText.text = "진행도"
        currentGoalPeriodSubText.font = .captionSmallRegular()
        currentGoalPeriodSubText.textColor = .primary20
        
        let currentGoalPeriodMainText = UILabel()
        currentGoalPeriodMainText.text = "\(model.period)"
        currentGoalPeriodMainText.font = .bodySmallMedium()
        currentGoalPeriodMainText.textColor = .primary10
        currentGoalPeriodMainText.lineBreakMode = .byTruncatingTail
        
        currentGoalPeriod.axis = .vertical
        currentGoalPeriod.alignment = .leading
        currentGoalPeriod.spacing = 4
        currentGoalPeriod.addArrangedSubview(currentGoalPeriodSubText)
        currentGoalPeriod.addArrangedSubview(currentGoalPeriodMainText)
        
        // goalCompleted
        goalCompleted.configuration = buttonWhiteStyle(title: "완료")
        buttonConstraint(button: goalCompleted, in: contentView)
    }
}
