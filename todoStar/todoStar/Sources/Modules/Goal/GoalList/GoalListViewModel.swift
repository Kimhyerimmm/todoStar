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
}

class GoalListViewModel {
    private let shareData = ShareData.shared

    var goalLists: [GoalListModel] = []

    init() {
        loadGoal()
    }

    func loadGoal() {
        let goalData = shareData.getGoalData()

        let progressStatusGoals = goalData.filter { $0.progressStatus }

        self.goalLists = progressStatusGoals.map { goal in
            GoalListModel(progressStatus: goal.progressStatus,
                          lastGoal: goal.lastGoal,
                          middleGoalCount: goal.middleGoal.count,
                          middleGoalCompletion: goal.middleGoal.filter { $0.completionGoal }.count,
                          completionGoal: goal.completionGoal)
        }

    }
}
