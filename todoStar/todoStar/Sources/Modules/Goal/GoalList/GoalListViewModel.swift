//
//  GoalListViewModel.swift
//  todoStar
//
//  Created by 김혜림 on 9/4/24.
//

import UIKit

struct GoalListModel {
    let progressStatus: Bool
    let lastGoal: String
    let middleGoalCount: Int
    let middleGoalCompletion: Int
    let completionGoal: Bool
    let importance: String
    let createdDate: Date
}

class GoalListViewModel {
    private let shareData = ShareData.shared

    var goalLists: [GoalListModel] = []
    var highData: [GoalListModel] = []
    var middleData: [GoalListModel] = []
    var rowData: [GoalListModel] = []

    init() {
        loadGoal()
        goalFilter()
    }

    func loadGoal() {
        let goalData = shareData.getGoalData()

        let progressStatusGoals = goalData.filter { $0.completionGoal == false }

        self.goalLists = progressStatusGoals.map { goal in
            GoalListModel(progressStatus: goal.progressStatus,
                          lastGoal: goal.lastGoal,
                          middleGoalCount: goal.middleGoal.count,
                          middleGoalCompletion: goal.middleGoal.filter { $0.completionGoal }.count,
                          completionGoal: goal.completionGoal,
                          importance: goal.importance, createdDate: goal.createdDate)
        }
    }

    func goalFilter() {
        // 목표 중요도에 따라 나눠서 저장
        highData = goalLists.filter { $0.importance == "반드시 해야 해요!"}
        middleData = goalLists.filter { $0.importance == "해야 하지만 급하지 않아요."}
        rowData = goalLists.filter { $0.importance == "하고 싶지만 급하지 않아요."}

        // 목표 정렬 기준
        highData.sort {
            if $0.progressStatus != $1.progressStatus {
                return $0.progressStatus && !$1.progressStatus
            } else {
                return $0.createdDate < $1.createdDate
            }
        }

        middleData.sort {
            if $0.progressStatus != $1.progressStatus {
                return $0.progressStatus && !$1.progressStatus
            } else {
                return $0.createdDate < $1.createdDate
            }
        }

        rowData.sort {
            if $0.progressStatus != $1.progressStatus {
                return $0.progressStatus && !$1.progressStatus
            } else {
                return $0.createdDate < $1.createdDate
            }
        }
    }
}
