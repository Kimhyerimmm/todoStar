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
}

class GoalListViewModel {
    private let shareData = ShareData.shared

    var goalLists: [GoalListModel] = []
    var highData: [GoalListModel] = []
    var middleData: [GoalListModel] = []
    var rowData: [GoalListModel] = []

    init() {
        loadGoal()
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
                          importance: goal.importance)
        }

        highData = goalLists.filter { $0.importance == "반드시 해야 해요!"}
        middleData = goalLists.filter { $0.importance == "해야 하지만 급하지 않아요."}
        rowData = goalLists.filter { $0.importance == "하고 싶지만 급하지 않아요."}

    }
}
