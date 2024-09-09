//
//  GoalDetailViewModel.swift
//  todoStar
//
//  Created by 김혜림 on 9/9/24.
//

import Foundation

struct GoalDetailModel {

}

class GoalDetailViewModel {
    private let goalId: UUID
    private var goalData: GoalRecordDataModel?

    private let shareData = ShareData.shared

    init(goalId: UUID) {
        self.goalId = goalId
        self.goalData = findGoalData(goalId)
    }

    private func findGoalData(_ id: UUID) -> GoalRecordDataModel? {
        let goalData = shareData.getGoalData()
        let findGoal = goalData.first { $0.goalId == id }

        return findGoal
    }
}
