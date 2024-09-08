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
    
    var currentGoals: [CurrentGoalModel] = []
    
    init() {
        loadGoal()
    }
    
    func loadGoal() {
        // 모든 GoalRecordDataModel 가져오기
        let goalData = shareData.getGoalData()
//        print("goalData: \(goalData.count)")
//        for goal in goalData {
//            print("goalData: \(goal.lastGoal)\n")
//        }

        // 조건 1: progressStatus가 true인 GoalRecordDataModel 배열
        let progressStatusGoals = goalData.filter { $0.progressStatus }
//        print("progressStatusGoals: \(progressStatusGoals.count)")
//        for goal in progressStatusGoals {
//            print("progressStatusGoals: \(goal.middleGoal)\n")
//        }

        // 조건 2: 위에서 찾은 배열 중 middleGoal의 middleGoalProgressStatus가 false인 GoalRecordDataModel 배열
        let filteredGoals = progressStatusGoals.filter { goal in
            let hasProgressingMiddleGoal = goal.middleGoal.contains { $0.completionGoal == false }
            return hasProgressingMiddleGoal
        }
//        print("filteredGoals: \(filteredGoals.count)")
//        for goal in filteredGoals {
//            print("filteredGoals: \(goal.middleGoal)\n")
//        }

        // 필터링된 배열을 currentGoals에 저장
        self.currentGoals = filteredGoals.flatMap { goal in
            goal.middleGoal.filter { $0.completionGoal == false }.map { middleGoal in
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
//        print("currentGoals: \(currentGoals.count)")
//        for goal in currentGoals {
//            print("currentGoals: \(goal.middleGoal)\n")
//        }

        // lastGoal 기준으로 그룹화
        let groupedByLastGoal = Dictionary(grouping: currentGoals, by: { $0.lastGoal })
//        print("groupedByLastGoal: \(groupedByLastGoal.count)")
//        for goal in groupedByLastGoal {
//            print("groupedByLastGoal: \(goal)\n")
//        }

        // 각 그룹에서 가장 먼저 생성된 항목 선택
        let earliestGoals = groupedByLastGoal.values.compactMap { group in
            group.min(by: { $0.createdDate < $1.createdDate })
        }
//        print("earliestGoals: \(earliestGoals.count)")
//        for goal in earliestGoals {
//            print("earliestGoals: \(goal.middleGoal)\n")
//        }

        // 결과를 currentGoals에 저장
        self.currentGoals = earliestGoals
    }
}




