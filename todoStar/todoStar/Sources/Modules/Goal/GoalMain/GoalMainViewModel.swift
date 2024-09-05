//
//  GoalMainViewModel.swift
//  todoStar
//
//  Created by 김혜림 on 9/3/24.
//

import UIKit

struct CurrentGoalModel {
    let lastGoal: String
    let middleGoal: String
    let smallGoal: String
    let importance: String
    let goalPeriod: Int
    let goalStatus: Int
    let createdDate: Date
}

class GoalMainViewModel {
    private let shareData = ShareData.shared
    typealias goalData = CurrentGoalModel
    
    var currentGoals: [CurrentGoalModel] = []
    
    init() {
        loadCurrentGoal()
        print(currentGoals)
        print(currentGoals.count)
    }
    
    func loadCurrentGoal() {
        // 모든 GoalRecordDataModel 가져오기
        let goalData = shareData.getGoalData()

        // 조건 1: progressStatus가 true인 GoalRecordDataModel 배열
        let progressStatusGoals = goalData.filter { $0.progressStatus }
        
        // 조건 2: 위에서 찾은 배열 중 middleGoal의 middleGoalProgressStatus가 true인 GoalRecordDataModel 배열
        let filteredGoals = progressStatusGoals.filter { goal in
            let hasProgressingMiddleGoal = goal.middleGoal.contains { $0.goalPeriod != $0.goalStatus }
            return hasProgressingMiddleGoal
        }
        
        // 필터링된 배열을 currentGoals에 저장
        self.currentGoals = filteredGoals.flatMap { goal in
            goal.middleGoal.filter { $0.goalPeriod != $0.goalStatus }.map { middleGoal in
                CurrentGoalModel(
                    lastGoal: goal.lastGoal,
                    middleGoal: middleGoal.middleGoal,
                    smallGoal: middleGoal.smallGoal,
                    importance: goal.importance,
                    goalPeriod: middleGoal.goalPeriod,
                    goalStatus: middleGoal.goalStatus,
                    createdDate: middleGoal.createdDate
                )
            }
        }

        // lastGoal 기준으로 그룹화
        let groupedByLastGoal = Dictionary(grouping: currentGoals, by: { $0.lastGoal })

        // 각 그룹에서 가장 먼저 생성된 항목 선택
        let earliestGoals = groupedByLastGoal.values.compactMap { group in
            group.min(by: { $0.createdDate < $1.createdDate })
        }

        // 결과를 currentGoals에 저장
        self.currentGoals = earliestGoals
    }
}




